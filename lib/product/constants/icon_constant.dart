import 'package:flutter/material.dart';

enum AppIconConstant {
  appLogoGreen('logogreen'),
  appLogoTextGreen('logotexgreen');

  final String value;
  const AppIconConstant(this.value);

  String get toPng => "assets/icons/app_icon/$value.png";
  Image get toImg => Image.asset(toPng);
}
