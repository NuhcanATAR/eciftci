import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

class LoginServiceModel {
  // form key
  final formLoginKey = GlobalKey<FormState>();

  // controller
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  // validator
  String? emailValidator(String? emailVal) {
    if (emailVal == null || emailVal.isEmpty) {
      return "Zorunlu Alan";
    } else {
      return null;
    }
  }

  String? passwordValidator(String? passwordVal) {
    if (passwordVal == null || passwordVal.isEmpty) {
      return "Zorunlu Alan";
    } else {
      return null;
    }
  }

  // remember me
  late bool isRememberMeStatus = false;

  // password open/close
  late bool isPasswordHideStatus = true;

  // connectivity controller
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertDialog = false;

  // logger
  dynamic logger = Logger();
}
