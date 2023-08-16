import 'package:fullapp2/product/initialize/app_cache.dart';

enum CacheItem {
  token;

  String get read =>
      AppCache.instance.sharedPreferences.getString(name) ??
      ''; // önbellekten okuma işlemi yapılıyor.

  Future<bool> write(String value) => AppCache.instance.sharedPreferences
      .setString(name, value); //önbelleğe yazma işlemi yapılıyor.
}
