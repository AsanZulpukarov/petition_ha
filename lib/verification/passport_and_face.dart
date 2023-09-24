import 'dart:io';

import 'utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'camera_page.dart';
import 'dart:async';
import 'global.dart';
import 'package:face_camera/face_camera.dart';
class PassportAndFace extends StatelessWidget {
  PassportAndFace({super.key});

  Future<int> loadData() async {
    return await initDocumentSDK();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamsoft Document Normalization',
      theme: ThemeData(
        scaffoldBackgroundColor: colorMainTheme,
      ),
      home: Center(
        child: FutureBuilder<int>(
          future: loadData(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator(); // Loading indicator
            }

            return
                getWidget(context);
          },
        ),
      ),
    );
  }

  Widget getWidget(BuildContext context){
    return GestureDetector(
        onTap: () {
          if (!kIsWeb && Platform.isLinux) {
            showAlert(context, "Warning",
                "${Platform.operatingSystem} is not supported");
            return;
          }

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const CameraPage();
          }));
        },
        child: Container(
          width: 150,
          height: 125,
          decoration: BoxDecoration(
            color: colorOrange,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.perm_identity_outlined,
                color: Colors.blue,
              ),
              const Text(
                "Идентификация",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, color: Colors.white),
              )
            ],
          ),
        ));
  }

  File? _capturedImage;

  Widget face(BuildContext context){
    return Builder(builder: (context) {
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
                  onPressed: (){},
                  // => setState(() => _capturedImage = null),
                  child: const Text(
                    'Capture Again',
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

            // setState(() => _capturedImage = image);
            _capturedImage = image;
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
    });
  }

  Widget _message(String msg) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
    child: Text(msg,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 14, height: 1.5, fontWeight: FontWeight.w400)),
  );
}