import 'package:eciftci/feature/mainview/agriculturalcalendar/agriculturalcalendar_view.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/equipmenttracking_view.dart';
import 'package:eciftci/feature/mainview/home/home_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/incomegoes_view.dart';
import 'package:eciftci/feature/mainview/plots/plots_view.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class BottomMenuModelService {
  List<Widget> viewList = <Widget>[
    const IncomeGoesView(),
    const PlotsView(),
    const HomeView(),
    const AgriculturalCalendarView(),
    const EquipmentTrackingView(),
  ];

  late int selectedViewIndex = 2;

  dynamic logger = Logger();
}
