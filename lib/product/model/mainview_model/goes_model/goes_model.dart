import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class MainGoesCategory {
  final String id;
  final String categoryName;

  MainGoesCategory({required this.id, required this.categoryName});

  factory MainGoesCategory.fromSnapshot(DocumentSnapshot snapshot) {
    return MainGoesCategory(
      id: snapshot.id,
      categoryName: snapshot['CATEGORYNAME'],
    );
  }
}

class GoesModelService {
  final formGoesAddKey = GlobalKey<FormState>();
  final formGoesUpdateKey = GlobalKey<FormState>();

  // controller
  late TextEditingController goesTitleController = TextEditingController();
  late TextEditingController goesExplanationController =
      TextEditingController();
  late TextEditingController goesValueController = TextEditingController();

  // validator
  String? goesTitleValidator(String? goesTitleVal) {
    if (goesTitleVal == null || goesTitleVal.isEmpty) {
      return "Zorunlu alan *";
    } else {
      return null;
    }
  }

  String? goesExplanationValidator(String? goesExplanationVal) {
    if (goesExplanationVal == null || goesExplanationVal.isEmpty) {
      return "Zorunlu alan *";
    } else {
      return null;
    }
  }

  String? goesValueValidator(String? goesValueVal) {
    if (goesValueVal == null || goesValueVal.isEmpty) {
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
