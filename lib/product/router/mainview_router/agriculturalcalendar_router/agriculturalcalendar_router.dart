import 'package:eciftci/feature/mainview/connectionerror/connectionerror_view.dart';
import 'package:flutter/material.dart';

class AgriculturalCalendarRouterService {
  // connection error view
  void connectionErrorViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ConnectionErrorView(),
      ),
    );
  }
}
