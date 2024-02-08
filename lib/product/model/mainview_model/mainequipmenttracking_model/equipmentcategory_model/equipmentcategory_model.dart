import 'package:flutter/material.dart';

class EquipmentCategoryModel {
  // form key
  final formEquipmentCategoryAddKey = GlobalKey<FormState>();

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
}
