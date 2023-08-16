import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  //BUNU ARTIK HER YERDE KULLANACAĞIZ
  AppCache._();
  static AppCache instance = AppCache._();
  Future<void> setup() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  late SharedPreferences sharedPreferences;
}
