import 'package:flutter/material.dart';

class PasswordModelService {
  // form key
  final formResetPasswordKey = GlobalKey<FormState>();

  // controller
  late TextEditingController mailController = TextEditingController();

  // validator
  String? emailValidator(String? emailVal) {
    if (emailVal == null || emailVal.isEmpty) {
      return "Zorunlu Alan!";
    } else {
      return null;
    }
  }
}
