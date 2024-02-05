import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

List<mainUserCity> cityList = [
  mainUserCity(
    'Adana',
    [
      mainUserDistrict('Aladağ'),
      mainUserDistrict('Ceyhan'),
      mainUserDistrict('Çukurova'),
    ],
  ),
  mainUserCity(
    'Ankara',
    [
      mainUserDistrict('Altındağ'),
      mainUserDistrict('Çankaya'),
      mainUserDistrict('Keçiören'),
    ],
  ),
  mainUserCity(
    'İstanbul',
    [
      mainUserDistrict('Beşiktaş'),
      mainUserDistrict('Kadıköy'),
      mainUserDistrict('Şişli'),
    ],
  ),
];

List<String> plotsStatusList = <String>[
  "Arazi Aktif",
  "Arazi Kapalı",
];

class PlotsModelService {
  // form key
  final formPlotsSaveKey = GlobalKey<FormState>();
  final formPlotsUpdateKey = GlobalKey<FormState>();

  // controller
  late TextEditingController titleController = TextEditingController();
  late TextEditingController explanationController = TextEditingController();
  late TextEditingController neighborhoodVillageController =
      TextEditingController();
  late TextEditingController neighborhoodNumber = TextEditingController();
  late TextEditingController islandController = TextEditingController();
  late TextEditingController parcelController = TextEditingController();
  late TextEditingController titleDeedAreaController = TextEditingController();
  late TextEditingController qualificationController = TextEditingController();
  late TextEditingController groundTypeController = TextEditingController();
  late TextEditingController sheetController = TextEditingController();
  late TextEditingController locationController = TextEditingController();

  // plots status
  late String plotsSelectStatusType = plotsStatusList.first;

  // validator
  String? titleValidator(String? titleVal) {
    if (titleVal == null || titleVal.isEmpty) {
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

  late double plotsActiveValue = 0;
  late double plotsCloseValue = 0;
  late int plotsActiveNumber = 0;
  late int plotsCloseNumber = 0;

  late String plotsSearch = "";

  final DateTime dateTime = DateTime.now();

  List<int> years = List.generate(10, (index) => 2024 + index);
  int selectedYear = DateTime.now().year;

  dynamic logger = Logger();
}

class mainUserCity {
  final String cityName;
  final List<mainUserDistrict> subDistrictList;

  mainUserCity(this.cityName, this.subDistrictList);
}

// ignore:
class mainUserDistrict {
  final String districtName;

  mainUserDistrict(this.districtName);
}
