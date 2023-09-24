import 'package:petition_ha/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  late SharedPreferences prefs;
  Future<void> setUserEmail(String text) async {
    prefs = await SharedPreferences.getInstance();
    ApiService.email = text;
    await prefs.setString('emailKey', text);
  }

  Future<String?> getUserEmail() async {
    prefs = await SharedPreferences.getInstance();
    ApiService.email = prefs.getString('emailKey') ?? "";
    return prefs.getString('emailKey');
  }

  Future<void> clearUserEmail() async {
    prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
