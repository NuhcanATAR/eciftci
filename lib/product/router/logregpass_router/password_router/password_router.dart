import 'package:eciftci/feature/logregpass/password/view/respassendrouter_view.dart';
import 'package:flutter/material.dart';

class PasswordRouterService {
  // password reset send mail success router
  void resetPassEndMailSuccessViewNavigatorRouter(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const ResetPasswordEndRouterView(),
        ),
        (Route<dynamic> route) => false);
  }
}
