import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static late SharedPreferences instance;
  static getInstance() async {
    instance = await SharedPreferences.getInstance();
  }

  static String getString(String key) {
    return instance.getString(key) ?? "";
  }

  static Future<bool> setString(String key, String value) async {
    return await instance.setString(key, value);
  }

  static Future clear() async {
    await instance.clear();
  }
}

class PreferenceConstants {
  static const tokenid = "tokenid";
  static const userid = "userid";
  static const username = "username";
  static const email = "email";
  static const fullname = "fullname";
  static const dob = "dob";
  static const gender = "gender";
  static const latitute = "leti";
  static const longitute = "longi";
}
