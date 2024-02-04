import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class GoesCategoryModelService {
  // form key
  final formGoesCategorySavedKey = GlobalKey<FormState>();
  final formGoesCategoryUpdateKey = GlobalKey<FormState>();

  // controller
  late TextEditingController categoryNameController = TextEditingController();

  // validator
  String? categoryNameValidator(String? categoryNameVal) {
    if (categoryNameVal == null || categoryNameVal.isEmpty) {
      return "Zorunlu Alan *";
    } else {
      return null;
    }
  }

  dynamic logger = Logger();
}
