import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class EGuideModelService {
  // form key
  final formUserAddKey = GlobalKey<FormState>();
  final formUserUpdateKey = GlobalKey<FormState>();

  // controller
  late TextEditingController nameController = TextEditingController();
  late TextEditingController surnameController = TextEditingController();
  late TextEditingController phoneNumberController = TextEditingController();
  late TextEditingController companyNameController = TextEditingController();
  late TextEditingController explanationController = TextEditingController();

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

  String? phoneNumberValidator(String? phoneNumberVal) {
    if (phoneNumberVal == null || phoneNumberVal.isEmpty) {
      return "Telefon numarası alanı boş bırakılamaz";
    }
    if (!RegExp(r"^[1-9][0-9]{9}$").hasMatch(phoneNumberVal)) {
      return "Geçersiz telefon numarası formatı";
    }
    return null;
  }

  dynamic logger = Logger();

  late String searchUser = "";
}
