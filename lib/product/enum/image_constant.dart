import 'package:flutter/material.dart';

@immutable
// class ImageConstants {
//   const ImageConstants._();
//   final String microphone = "ic_microphone".iconToPng;
// }

// extension _StringPath on String {
//   String get iconToPng => 'assets/icon/$this.png';
// }

//bu da başka bir kullanımı
enum IconConstants {
  microphone('microphone'),
  appIcon('app_logo');

  final String value;
  const IconConstants(this.value);
  String get toPng =>
      'assets/icon/ic_$value.png'; //hepsinin başında ic olacağı için ic_ koyduk.
  //her yerde image.asset kullandığımız için onu da hemen baseleştiriyoruz
  Image get toImage => Image.asset(toPng);
}
