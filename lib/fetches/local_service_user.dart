import 'package:petition_ha/service/local_service.dart';

Future<bool> fetchGetUserEmail() async {
  final response = await LocalService().getUserEmail();
  print("123456789  " + (response ?? "123"));
  return response == null || response.isEmpty ? false : true;
}

Future<void> fetchSetUserEmail(String email) async {
  await LocalService().setUserEmail(email);
}

Future<void> fetchClearUserEmail() async {
  await LocalService().clearUserEmail();
}
