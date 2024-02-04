import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

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

  dynamic logger = Logger();
}
