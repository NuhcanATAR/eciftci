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
      return "Ad alanı boş bırakılamaz";
    } else {
      return null;
    }
  }

  String? surnameValidator(String? surnameVal) {
    if (surnameVal == null || surnameVal.isEmpty) {
      return "Soyad alanı boş bırakılamaz";
    } else {
      return null;
    }
  }

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

  String? phoneNumberValidator(String? phoneNumberVal) {
    if (phoneNumberVal == null || phoneNumberVal.isEmpty) {
      return "Telefon numarası alanı boş bırakılamaz";
    }
    if (!RegExp(r"^[1-9][0-9]{9}$").hasMatch(phoneNumberVal)) {
      return "Geçersiz telefon numarası formatı";
    }
    return null;
  }

  String? passwordValidator(String? passwordVal) {
    if (passwordVal == null || passwordVal.isEmpty) {
      return "Şifre alanı boş bırakılamaz";
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
