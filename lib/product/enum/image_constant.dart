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
  microphone('ic_microphone');

  final String value;
  const IconConstants(this.value);
  String get toPng => 'assets/icon/$value.png';
}
