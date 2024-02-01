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
    final emailRegExp =
        RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");

    if (emailVal == null || emailVal.isEmpty) {
      return "E-posta alanı boş bırakılamaz";
    } else if (!emailRegExp.hasMatch(emailVal)) {
      return "Geçersiz e-posta formatı";
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

  // logger
  dynamic logger = Logger();
}
