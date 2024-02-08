import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MainEquipmentCategory {
  final String id;
  final String categoryName;

  MainEquipmentCategory({required this.id, required this.categoryName});

  factory MainEquipmentCategory.fromSnapshot(DocumentSnapshot snapshot) {
    return MainEquipmentCategory(
      id: snapshot.id,
      categoryName: snapshot['CATEGORYNAME'],
    );
  }
}

class EquipmentTrackingModelService {
  // form key
  final formEquiptmentTrackingAddKey = GlobalKey<FormState>();
  final formEquipmentTrackingUpdateKey = GlobalKey<FormState>();

  // controller
  late TextEditingController titleController = TextEditingController();
  late TextEditingController explanationController = TextEditingController();

  late List<String> equipmentStatusList = <String>[
    "Beklemede",
    "Çalışıyor",
    "Kapalı",
    "Servisde",
  ];

  late List<String> cityList = <String>[
    "Çorum",
    "Ankara",
    "Kırıkkale",
    "İstanbul",
    "Çanakkale",
  ];

  late String selectEquipmentStatus = equipmentStatusList.first;
  late String selectCity = cityList.first;

  late String equipmentSearch = "";

  // validator
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
