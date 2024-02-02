import 'package:eciftci/feature/mainview/connectionerror/connectionerror_view.dart';
import 'package:flutter/material.dart';

class ConnectionErrorRouterService {
  // connection error view router
  void connectionErrorViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ConnectionErrorView(),
      ),
    );
  }
}
