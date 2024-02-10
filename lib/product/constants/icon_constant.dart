import 'package:flutter/material.dart';

enum AppIconConstant {
  appLogoGreen('logogreen'),
  appLogoTextGreen('logotexgreen'),
  appLogoWhite('logotextwhite'),
  appLogoTextWhite('logowhite');

  final String value;
  const AppIconConstant(this.value);

  String get toPng => "assets/icons/app_icon/$value.png";
  Image get toImg => Image.asset(toPng);
}

enum AppRegisterIcon {
  appRegisterSuccessIcon('icons8-success-144');

  final String value;
  const AppRegisterIcon(this.value);

  String get toPng => "assets/icons/register_icon/$value.png";
  Image get toImg => Image.asset(toPng);
}

enum AppForgotPassIcon {
  appSendMailSuccessIcon('icons8-send-mail-53');

  final String value;
  const AppForgotPassIcon(this.value);

  String get toPng => "assets/icons/password_icon/$value.png";
  Image get toImg => Image.asset(toPng);
}

enum AppHomeIconConstant {
  appAccountIcon('icons8-farmer-96');

  final String value;
  const AppHomeIconConstant(this.value);

  String get toPng => "assets/icons/home_icon/$value.png";
  Image get toImg => Image.asset(toPng);
}

enum AppEGuideIconConstant {
  appUserIcon('icons8-account-96');

  final String value;
  const AppEGuideIconConstant(this.value);

  String get toPng => "assets/icons/eguide_icon/$value.png";
  Image get toImg => Image.asset(toPng);
}
