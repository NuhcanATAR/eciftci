import 'package:flutter/material.dart';

class PasswordModelService {
  // form key
  final formResetPasswordKey = GlobalKey<FormState>();

  // controller
  late TextEditingController mailController = TextEditingController();

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
}
