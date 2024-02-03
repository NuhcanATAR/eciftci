import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class MainIncomeCategory {
  final String id;
  final String categoryName;

  MainIncomeCategory({required this.id, required this.categoryName});

  factory MainIncomeCategory.fromSnapshot(DocumentSnapshot snapshot) {
    return MainIncomeCategory(
      id: snapshot.id,
      categoryName: snapshot['CATEGORYNAME'],
    );
  }
}

class IncomeModelService {
  // form key
  final formIncomeAddKey = GlobalKey<FormState>();
  final formIncomeUpdateKey = GlobalKey<FormState>();

  // controller
  late TextEditingController incomeTitleController = TextEditingController();
  late TextEditingController incomeExplanationController =
      TextEditingController();
  late TextEditingController incomeValueController = TextEditingController();

  // validator
  String? incomeTitleValidator(String? incomeTitleVal) {
    if (incomeTitleVal == null || incomeTitleVal.isEmpty) {
      return "Zorunlu alan *";
    } else {
      return null;
    }
  }

  String? incomeExplanationValidator(String? incomeExplanationVal) {
    if (incomeExplanationVal == null || incomeExplanationVal.isEmpty) {
      return "Zorunlu alan *";
    } else {
      return null;
    }
  }

  String? incomeValueValidator(String? incomeValueVal) {
    if (incomeValueVal == null || incomeValueVal.isEmpty) {
      return "Zorunlu alan *";
    } else {
      return null;
    }
  }

  // date
  final DateTime dateTime = DateTime.now();

  // logger
  dynamic logger = Logger();
}
