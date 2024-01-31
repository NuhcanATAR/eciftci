import 'package:eciftci/feature/logregpass/login/login_view.dart';
import 'package:eciftci/feature/logregpass/register/register_view.dart';
import 'package:flutter/material.dart';

class LogRegRouterService {
  // login view router
  void loginViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginView(),
      ),
    );
  }

  // register view router
  void registerViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RegisterView(),
      ),
    );
  }
}
