import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:face_camera/face_camera.dart';
import 'package:http/http.dart' as http;
import 'package:petition_ha/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/profile/profile.dart';

class FaceVerification extends StatefulWidget {
  final String passport;
  const FaceVerification({Key? key, required this.passport}) : super(key: key);

  @override
  State<FaceVerification> createState() => _MyAppState();
}

class _MyAppState extends State<FaceVerification> {
  File? _capturedImage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Cфотайте лицо'),
          ),
          body: Builder(builder: (context) {
            if (_capturedImage != null) {
              return Center(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.file(
                      _capturedImage!,
                      width: double.maxFinite,
                      fit: BoxFit.fitWidth,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          var face =
                              base64Encode(_capturedImage!.readAsBytesSync());
                          var url = Uri(
                            port: ApiService.port,
                            path: 'user/set-identification',
                            host: ApiService.ip,
                            scheme: ApiService.scheme,
                          );
                          var shared = await SharedPreferences.getInstance();
                          Map data = {
                            'passport': widget.passport,
                            'face': face,
                            'email': shared.get('email').toString(),
                          };

                          var body = json.encode(data);
                          await http.post(url,
                              headers: {"Content-Type": "application/json"},
                              body: body);
                          print('length');
                          print(widget.passport.length);
                          print(face.length);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Profile(),
                            ),
                          );

                          return;
                          //encode Map to JSON
                        },
                        // => setState(() => _capturedImage = null),
                        child: const Text(
                          'Отправить',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ))
                  ],
                ),
              );
            }
            return SmartFaceCamera(
                autoCapture: true,
                defaultCameraLens: CameraLens.front,
                onCapture: (File? image) {
                  setState(() => _capturedImage = image);
                },
                onFaceDetected: (Face? face) {
                  //Do something
                },
                messageBuilder: (context, face) {
                  if (face == null) {
                    return _message('Place your face in the camera');
                  }
                  if (!face.wellPositioned) {
                    return _message('Center your face in the square');
                  }
                  return const SizedBox.shrink();
                });
          })),
    );
  }

  Widget _message(String msg) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
        child: Text(msg,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 14, height: 1.5, fontWeight: FontWeight.w400)),
      );
}
