import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class MainintenanceServiceModelService {
  // form key
  final formServiceAddKey = GlobalKey<FormState>();
  final formServiceUpdateKey = GlobalKey<FormState>();

  // controller
  late TextEditingController maintenancePeriodController =
      TextEditingController();
  late TextEditingController companyNameController = TextEditingController();
  late TextEditingController companyPhoneNumberController =
      TextEditingController();
  late TextEditingController caregiverController = TextEditingController();
  late TextEditingController explanationController = TextEditingController();

  late List<String> completionStatusList = <String>[
    "Tamamlandı",
    "Tamamlanmadı",
  ];

  late String completionStatusSelect = completionStatusList.first;

  DateTime selectedDate = DateTime.now();

  List<int> years = List.generate(10, (index) => 2024 + index);
  int selectedYear = DateTime.now().year;

  // validator
  String? maintenancePeriodValidator(String? maintenancePeriodVal) {
    if (maintenancePeriodVal == null || maintenancePeriodVal.isEmpty) {
      return "Zorunlu Alan *";
    } else {
      return null;
    }
  }

  String? companyNameValidator(String? companyNameVal) {
    if (companyNameVal == null || companyNameVal.isEmpty) {
      return "Zorunlu Alan *";
    } else {
      return null;
    }
  }

  String? companyPhoneNumberValidator(String? companyPhoneNumberVal) {
    if (companyPhoneNumberVal == null || companyPhoneNumberVal.isEmpty) {
      return "Zorunlu Alan *";
    } else {
      return null;
    }
  }

  String? caregiverValidator(String? caregiverVal) {
    if (caregiverVal == null || caregiverVal.isEmpty) {
      return "Zorunlu Alan *";
    } else {
      return null;
    }
  }

  String? explanationValidator(String? explanationVal) {
    if (explanationVal == null || explanationVal.isEmpty) {
      return "Zorunlu Alan *";
    } else {
      return null;
    }
  }

  dynamic logger = Logger();
}
