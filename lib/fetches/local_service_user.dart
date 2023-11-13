import 'package:petition_ha/service/api_service.dart';
import 'package:petition_ha/service/local_service.dart';

Future<bool> fetchGetUserEmail() async {
  final response = await LocalService().getUserEmail();
  ApiService.email = response ?? "";
  return response == null || response.isEmpty ? false : true;
}

Future<void> fetchSetUserEmail(String email) async {
  await LocalService().setUserEmail(email);
}

Future<void> fetchClearUserEmail() async {
  await LocalService().clearUserEmail();
}
