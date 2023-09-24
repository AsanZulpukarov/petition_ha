import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petition_ha/model/create_petition_model.dart';
import 'package:petition_ha/model/petition_model.dart';

class ApiService {
  var client = http.Client();
  static var ip = '192.168.43.93';
  static var port = 8080;
  static var scheme = 'http';

  static String email = "";

  Future<dynamic> getProducts() async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      port: port,
      path: 'Products/Index',
    );
    var response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseBody = utf8.decode(response.bodyBytes);
      print(responseBody);
      return responseBody;
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
    }
  }

  Future<dynamic> getCategoryProducts(String id) async {
    var uri = Uri(
        scheme: scheme,
        host: ip,
        port: port,
        path: 'Products/Index',
        queryParameters: {'categoryId': id});

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

  Future<dynamic> getSearchProducts(String search) async {
    var uri = Uri(
        scheme: scheme,
        host: ip,
        port: port,
        path: 'Products/Search',
        queryParameters: {'param': search});

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

  Future<dynamic> getCategories() async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      port: port,
      path: 'Categories/Index',
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

  Future<dynamic> getProductsFavorite(String email) async {
    var uri = Uri(
        scheme: scheme,
        host: ip,
        port: port,
        path: 'Favorites/GetFavorites',
        queryParameters: {'email': email});

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

  Future<dynamic> getProductData(String productId, String email) async {
    var uri = Uri(
        scheme: scheme,
        host: ip,
        port: port,
        path: 'Products/GetById',
        queryParameters: {'productId': productId, 'email': email});

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

  Future<String> getSetFavorite(String productId, String email) async {
    var uri = Uri(
        scheme: scheme,
        host: ip,
        port: port,
        path: 'Favorites/SetFavorite',
        queryParameters: {'email': email, 'productId': productId});

    var response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return 'true';
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
      return 'false';
    }
  }

  Future<String> getUnSetFavorite(String productId, String email) async {
    var uri = Uri(
        scheme: scheme,
        host: ip,
        port: port,
        path: 'Favorites/UnsetFavorite',
        queryParameters: {'email': email, 'productId': productId});

    var response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return 'true';
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
      return 'false';
    }
  }

  Future<bool> postSingUp(String email, String password, String inn) async {
    Map<String, String> json = {"email": email, "password": password};

    var uri = Uri(
      scheme: scheme,
      host: ip,
      port: port,
      path: 'user/register',
    );
    print(uri);
    var response = await client.post(uri, body: jsonEncode(json), headers: {
      "Content-Type": "application/json",
      "Accept": "*/*",
    });
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      final responseBody = utf8.decode(response.bodyBytes);
      print(responseBody);
      return true;
    } else {
      print('error not found');
      print(response.body);
      return false;
      //throw exception and catch it in UI
    }
  }

  Future<dynamic> getListPetition() async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      port: port,
      path: 'petition/$email',
    );
    print(uri);
    var response = await client.get(uri, headers: {
      "Content-Type": "application/json",
      "Accept": "*/*",
    });
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      final responseBody = utf8.decode(response.bodyBytes);
      return responseBody;
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getListComment(int idPetition) async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      port: port,
      path: 'petition/comments/$email/$idPetition',
    );
    print(uri);
    var response = await client.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Accept": "*/*",
      },
    );
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      final responseBody = utf8.decode(response.bodyBytes);
      print(response.statusCode);
      return responseBody;
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getListCategory() async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      port: port,
      path: 'law/categories',
    );
    print(uri);
    var response = await client.get(uri, headers: {
      "Content-Type": "application/json",
      "Accept": "*/*",
    });
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      final responseBody = utf8.decode(response.bodyBytes);
      return responseBody;
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getListSection(int idCategory) async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      port: port,
      path: 'law/sections/$idCategory',
    );
    print(uri);
    var response = await client.get(uri, headers: {
      "Content-Type": "application/json",
      "Accept": "*/*",
    });
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      final responseBody = utf8.decode(response.bodyBytes);
      return responseBody;
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getListChapter(int idChapter) async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      port: port,
      path: 'law/chapters/$idChapter',
    );
    print(uri);
    var response = await client.get(uri, headers: {
      "Content-Type": "application/json",
      "Accept": "*/*",
    });
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      final responseBody = utf8.decode(response.bodyBytes);
      return responseBody;
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getListLaws(int idChapter) async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      port: port,
      path: 'law/laws/$idChapter',
    );
    print(uri);
    var response = await client.get(uri, headers: {
      "Content-Type": "application/json",
      "Accept": "*/*",
    });
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      final responseBody = utf8.decode(response.bodyBytes);
      return responseBody;
    } else {
      print(response.statusCode);
    }
  }

  Future<String> createPetition(
      List<XFile> file, CreatePetitionModel createPetitionModel) async {
    var uri = Uri(
      scheme: scheme,
      host: '192.168.0.192',
      port: 8080,
      path: 'petition/create',
    );
    var request = http.MultipartRequest('POST', uri);

    for (var i = 0; i < file.length; i++) {
      var fileBytes$i = await file[i].readAsBytes();
      var httpImage$i = http.MultipartFile.fromBytes(
        'photo',
        fileBytes$i.toList(),
        contentType: MediaType('photo', 'jpeg'),
        filename: file[i].name,
      );

      request.files.add(httpImage$i);
    }

    request.fields['email'] = email ?? "";
    request.fields['ruTitle'] = createPetitionModel.ruTitle ?? "";
    request.fields['kgTitle'] = createPetitionModel.kgTitle ?? "";
    request.fields['ruDescription'] = createPetitionModel.ruDescription ?? "";
    request.fields['kgDescription'] = createPetitionModel.kgDescription ?? "";
    var response = await request.send();

    var responsed = await http.Response.fromStream(response);

    if (responsed.statusCode == 201 || responsed.statusCode == 200) {
      return "Петиция создана";
    } else {
      return "Ошибка";
    }
  }

  Future<String> postSingIn(String email, String password) async {
    //var _payload = json.encode(object);

    Map<String, String> json = {"email": email, "password": password};

    var uri = Uri(
      scheme: scheme,
      host: ip,
      port: port,
      path: 'user/signIn',
    );
    var response = await client.post(uri, body: jsonEncode(json), headers: {
      "Content-Type": "application/json",
      "Accept": "*/*",
    });
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.statusCode);
      return 'true';
    } else if (response.statusCode == 400) {
      print('error not found');
      print(response.body);
      return 'password';
      //throw exception and catch it in UI
    } else {
      print('error not found');
      print(response.body);
      return 'false';
      //throw exception and catch it in UI
    }
  }

  Future<bool> postProfileEdit(var json) async {
    //var _payload = json.encode(object);

    var uri = Uri(
      scheme: scheme,
      host: ip,
      port: port,
      path: 'User/UpdateProfile',
    );
    var response = await client.post(uri,
        body: jsonEncode(json),
        headers: {"Content-Type": "application/json", "Accept": "*/*"});
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.statusCode);
      return true;
    } else {
      print('error not found');
      print(response.body);
      return false;
      //throw exception and catch it in UI
    }
  }

  Future<dynamic> getProfileProducts(String email) async {
    // email=email.replaceAll('@', '%40');

    var url = Uri.parse('http://$ip/Products/Index?email=$email');
    var uri = Uri(
        scheme: scheme,
        host: ip,
        port: port,
        path: 'Products/Index',
        queryParameters: {'email': email});
    print('$url\n' + uri.toString());

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

  Future<dynamic> getUserData(String email) async {
    var uri = Uri(
        scheme: scheme,
        host: ip,
        port: port,
        path: '/User/GetProfile',
        queryParameters: {'Email': email});
    print(uri.toString());

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

  Future<bool> getConfirmEmail(String email) async {
    //var _payload = json.encode(object);

    email = email.replaceAll('@', '%40');
    print(email);

    var url = Uri.parse(
        'http://$ip/User/SendCodeWordToEmailToConfirmEmail?email=$email');
    var uri = Uri(
      scheme: scheme,
      host: ip,
      port: port,
      path: "User/SendCodeWordToEmailToConfirmEmail?email=$email",
    );
    var response = await client.get(url);
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.statusCode);
      return true;
    } else {
      print('error not found');
      print(response.body);
      return false;
      //throw exception and catch it in UI
    }
  }

  Future<bool> postConfirmEmail(String email, String kod) async {
    //var _payload = json.encode(object);

    Map<String, String> json = {"secretWord": kod, "email": email};

    var uri = Uri(
      scheme: scheme,
      host: ip,
      port: port,
      path: 'User/ConfirmEmail',
    );
    var response = await client.post(uri,
        body: jsonEncode(json),
        headers: {"Content-Type": "application/json", "Accept": "*/*"});
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.statusCode);
      return true;
    } else {
      print('error not found');
      print(response.body);
      return false;
      //throw exception and catch it in UI
    }
  }

  Future<int> postProductAdd(var json) async {
    //var _payload = json.encode(object);

    var uri = Uri(
      scheme: scheme,
      host: ip,
      port: port,
      path: 'Products/AddWithEmail',
    );
    var response = await client.post(uri,
        body: jsonEncode(json),
        headers: {"Content-Type": "application/json", "Accept": "*/*"});
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.statusCode);
      return int.parse(response.body);
    } else {
      print('error not found');
      print(response.body);
      return 0;
      //throw exception and catch it in UI
    }
  }

  Future<bool> postProductPhotoAdd(List<XFile> file, int id) async {
    var uri = Uri(
      scheme: scheme,
      host: ip,
      port: port,
      path: 'ProductImage/AddImage/$id',
    );
    var request = http.MultipartRequest('POST', uri);

//for image and videos and files

// request.files.add(await http.MultipartFile.fromPath("images", path));
    for (var i = 0; i < file.length; i++) {
      var fileBytes$i = await file[i].readAsBytes();
      var httpImage$i = http.MultipartFile.fromBytes(
          'Images', fileBytes$i.toList(),
          contentType: MediaType('image', 'jpeg'), filename: file[i].name);

//for completeing the request
      request.files.add(httpImage$i);
    }
    var response = await request.send();

//for getting and decoding the response into json format
    var responsed = await http.Response.fromStream(response);
// final responseData = json.decode();

    if (response.statusCode == 200) {
      print("SUCCESS");
      print(responsed.body);
      return true;
    } else {
      print(response.statusCode);
      print(responsed.body);
      print("ERROR");
      return false;
    }
  }

  Future<bool> postProfilePhotoAdd(XFile file, String email,
      [bool update = false]) async {
    var uri = Uri(
        scheme: scheme,
        host: ip,
        port: port,
        path: 'User/ProfileAvatar',
        queryParameters: update
            ? {'email': email, 'updateDelete': 'true'}
            : {'email': email});
    print(uri);
    var request = http.MultipartRequest('POST', uri);

//for image and videos and files

// request.files.add(await http.MultipartFile.fromPath("images", path));
    final fileBytes = await file.readAsBytes();
    final httpImage = http.MultipartFile.fromBytes('Avatar', fileBytes.toList(),
        contentType: MediaType('image', 'jpeg'), filename: file.name);
//for completeing the request
    request.files.add(httpImage);
    var response = await request.send();

//for getting and decoding the response into json format
    var responsed = await http.Response.fromStream(response);
// final responseData = json.decode();

    if (response.statusCode == 200) {
      print("SUCCESS photoprofile add");
      print(responsed.body);
      return true;
    } else {
      print(response.statusCode);
      print(responsed.body);
      print("ERROR photo profile");
      return false;
    }
  }
}
