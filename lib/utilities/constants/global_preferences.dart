import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GlobalPreferences {
  static getInt(key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int value = prefs.getInt(key) ?? 0;
    return value;
  }

  static setInt(String key, int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  static getBool(key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool value = prefs.getBool(key) ?? false;
    return value;
  }

  static setbool(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static setClear() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  static remove(key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}

EncryptedSharedPreferences encryptedSharedPreferences =
    EncryptedSharedPreferences(mode: AESMode.sic);

class GlobalPreferencesEncrypted {
  static setString(String key, String value) async {
    encryptedSharedPreferences.setString(key, value);
  }

  static getString(key) async {
    String val = await encryptedSharedPreferences.getString(key);
    return val;
  }

  static clearValues() async {
    await encryptedSharedPreferences.clear();
  }
}
