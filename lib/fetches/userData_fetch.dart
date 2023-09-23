import 'dart:convert';
import '../model/userDataModel.dart';
import '../service/api_service.dart';

Future<UserDataModel> fetchUserData(String email) async {
  final response = await ApiService().getUserData(email);

  return UserDataModel.fromJson(jsonDecode(response));
}
