//لتخزين token عند عمل لوجين
import 'package:shared_preferences/shared_preferences.dart';

class PrefHelpers {
  static const String key_token = 'auth_token';
//حفظ التوكن في اللوكال داتا مش ع النت
  static Future<void> saveToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(key_token, token);
  }
  //تجيب الي التوكن الي تم حفظه
  static Future<String?> getToken()async{
    final pref=await SharedPreferences.getInstance();
   return pref.getString(key_token);
  }
  //هذه تستخدم في عملية تسجيل الخروج فقط عشان تمسح التوكن الي عندي
  static Future<void> cleanToken()async{
    final pref =await SharedPreferences.getInstance();
    pref.remove(key_token);
  }
}
