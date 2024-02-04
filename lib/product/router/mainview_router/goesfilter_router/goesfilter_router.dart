import 'package:eciftci/feature/mainview/connectionerror/connectionerror_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/goesdetail/goesdetail_view.dart';
import 'package:flutter/material.dart';

class GoesFilterRouterService {
  // goes detail
  void goesDetailViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GoesDetailView(
          data: data,
        ),
      ),
    );
  }

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
