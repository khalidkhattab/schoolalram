import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

 static Future<bool> saveString({required String key, required String value}) async {
    return await sharedPreferences.setString(key, value);
  }

  static  getData({required String key}){
    return sharedPreferences.getString(key);
  }
}
