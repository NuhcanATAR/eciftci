import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ProfileModelService {
  // form key
  final formNameSurnameUpdateKey = GlobalKey<FormState>();
  final formCityDistrictUpdateKey = GlobalKey<FormState>();
  final formPhoneNumberUpdateKey = GlobalKey<FormState>();

  // validator
  String? nameValidator(String? nameVal) {
    if (nameVal == null || nameVal.isEmpty) {
      return "Zorunlu Alan *";
    } else {
      return null;
    }
  }

  String? surNameValidator(String? surNameVal) {
    if (surNameVal == null || surNameVal.isEmpty) {
      return "Zorunlu Alan *";
    } else {
      return null;
    }
  }

  String? phoneNumberValidator(String? phoneNumberVal) {
    if (phoneNumberVal == null || phoneNumberVal.isEmpty) {
      return "Zorunlu Alan *";
    } else {
      return null;
    }
  }

  dynamic logger = Logger();
}
