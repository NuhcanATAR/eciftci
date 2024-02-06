import 'package:flutter/material.dart';

List<String> futureDateList = <String>[
  "Hedef Tarih Yok",
  "Hedef Tarih Var",
];

class PlotsNoteModel {
  final formNoteAddKey = GlobalKey<FormState>();
  final formNoteUpdateKey = GlobalKey<FormState>();

  late TextEditingController noteTitleController = TextEditingController();
  late TextEditingController noteExplanationController =
      TextEditingController();

  DateTime selectedDate = DateTime.now();
  DateTime nowDate = DateTime.now();

  late String futureDateListSelect = futureDateList.first;

  String? titleValidator(String? titleVal) {
    if (titleVal == null || titleVal.isEmpty) {
      return "Zorunlu Alan";
    } else {
      return null;
    }
  }

  String? explanationValidator(String? explanationVal) {
    if (explanationVal == null || explanationVal.isEmpty) {
      return "Zorunlu Alan";
    } else {
      return null;
    }
  }
}
