import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../service/api_service.dart';

class ServiceAman {
  var client = http.Client();
  static var ip = '192.168.0.192';
  var sheme = 'https';
  Future<dynamic> getPetitions() async {
    var uri = Uri(
      scheme: ApiService.scheme,
      host: ApiService.ip,
      port: ApiService.port,
      path: 'petition/to-speech',
    );

    var response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return response.body;
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
    }
  }

  Future<bool> postPetitionLike(int petitionId, bool isLike) async {
    //var _payload = json.encode(object);

    var uri = Uri(
      scheme: ApiService.scheme,
      host: ApiService.ip,
      port: ApiService.port,
      path: 'petition/like',
    );
    var request = http.MultipartRequest('POST', uri);
    request.fields['email'] = 'bektemir@gmail.com';
    request.fields['petitionId'] = petitionId.toString();
    request.fields['isLike'] = isLike.toString();
    var response = await request.send();
    // var response = await client.post(uri,body: jsonEncode(json), headers: {"Content-Type":"application/json","Accept":"*/*"});
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.statusCode);
      return true;
    } else {
      print('error not found');
      print('');
      return false;
      //throw exception and catch it in UI
    }
  }

  Future<bool> postVerification(
      String email, String face, String passport) async {
    //var _payload = json.encode(object);

    var uri = Uri(
      scheme: ApiService.scheme,
      host: ApiService.ip,
      port: ApiService.port,
      path: 'user/set-identification',
    );
    var request = http.MultipartRequest('POST', uri);
    request.fields['email'] = email;
    request.fields['passport'] = passport;
    request.fields['face'] = face;
    var response = await request.send();
    // var response = await client.post(uri,body: jsonEncode(json), headers: {"Content-Type":"application/json","Accept":"*/*"});
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.statusCode);
      return true;
    } else {
      print('error not found');
      print('');
      return false;
      //throw exception and catch it in UI
    }
  }

  Future<bool> postPetitionComment(int petitionId, String comment) async {
    //var _payload = json.encode(object);

    var uri = Uri(
      scheme: ApiService.scheme,
      host: ApiService.ip,
      port: ApiService.port,
      path: 'petition/comment',
    );
    var request = http.MultipartRequest('POST', uri);
    request.fields['email'] = 'bektemir@gmail.com';
    request.fields['petitionId'] = petitionId.toString();
    request.fields['comment'] = comment;
    var response = await request.send();
    // var response = await client.post(uri,body: jsonEncode(json), headers: {"Content-Type":"application/json","Accept":"*/*"});
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.statusCode);
      return true;
    } else {
      print('error not found');
      print('');
      return false;
      //throw exception and catch it in UI
    }
  }

  Future<dynamic> postSendQuestion(String question) async {
    Map<String, dynamic> jsonQues = {
      "message": question,
    };

    var uri = Uri(
      scheme: ApiService.scheme,
      host: ApiService.ip,
      port: ApiService.port,
      path: 'api/openAi',
    );
    var response = await client
        .post(uri, body: jsonEncode(jsonQues), headers: <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptCharsetHeader: 'utf-8',
    });
    if (response.statusCode == 201 || response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }
}
