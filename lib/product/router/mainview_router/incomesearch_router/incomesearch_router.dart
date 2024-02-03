import 'package:eciftci/feature/mainview/incomegoes/view/income/view/incomedetail/incomedetail_view.dart';
import 'package:flutter/material.dart';

class IncomeSearchRouterService {
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
}
