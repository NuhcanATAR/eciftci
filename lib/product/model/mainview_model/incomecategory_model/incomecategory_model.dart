import 'package:flutter/widgets.dart';

class IncomeCategoryModelService {
  // form key
  final formIncomeCategorySavedKey = GlobalKey<FormState>();
  final formIncomeCategoryUpdateKey = GlobalKey<FormState>();

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
