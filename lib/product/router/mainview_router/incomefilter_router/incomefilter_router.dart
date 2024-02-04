import 'package:eciftci/feature/mainview/connectionerror/connectionerror_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/incomedetail/incomedetail_view.dart';
import 'package:flutter/material.dart';

class IncomeFilterRouterService {
  // income detail
  void incomeDetailViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IncomeDetailView(
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
