// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

List<mainUserCity> cityList = [
  mainUserCity(
    'Adana',
    [
      mainUserDistrict('Aladağ'),
      mainUserDistrict('Ceyhan'),
      mainUserDistrict('Çukurova'),
    ],
  ),
  mainUserCity(
    'Ankara',
    [
      mainUserDistrict('Altındağ'),
      mainUserDistrict('Çankaya'),
      mainUserDistrict('Keçiören'),
    ],
  ),
  mainUserCity(
    'İstanbul',
    [
      mainUserDistrict('Beşiktaş'),
      mainUserDistrict('Kadıköy'),
      mainUserDistrict('Şişli'),
    ],
  ),
];

class RegisterServiceModel {
  // form key
  final formRegisterKey = GlobalKey<FormState>();

  // controller
  late TextEditingController nameController = TextEditingController();
  late TextEditingController surnameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController phoneNumberController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  // validator
  String? nameValidator(String? nameVal) {
    if (nameVal == null || nameVal.isEmpty) {
      return "Zorunlu Alan";
    } else {
      return null;
    }
  }

  String? surnameValidator(String? surnameVal) {
    if (surnameVal == null || surnameVal.isEmpty) {
      return "Zorunlu Alan";
    } else {
      return null;
    }
  }

  String? emailValidator(String? emailVal) {
    if (emailVal == null || emailVal.isEmpty) {
      return "Zorunlu Alan";
    } else {
      return null;
    }
  }

  String? phoneNumberValidator(String? phoneNumberVal) {
    if (phoneNumberVal == null || phoneNumberVal.isEmpty) {
      return "Zorunlu Alan";
    } else {
      return null;
    }
  }

  String? passwordValidator(String? passwordVal) {
    if (passwordVal == null || passwordVal.isEmpty) {
      return "Zorunlu Alan *";
    } else {
      return null;
    }
  }

  // agreement check
  late bool isAgreementCheck = false;

  // password hide status
  late bool isPasswordHideStatus = true;

  dynamic logger = Logger();
}

class mainUserCity {
  final String cityName;
  final List<mainUserDistrict> subDistrictList;

  mainUserCity(this.cityName, this.subDistrictList);
}

// ignore:
class mainUserDistrict {
  final String districtName;

  mainUserDistrict(this.districtName);
}
