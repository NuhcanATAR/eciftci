import 'package:eciftci/feature/logregpass/login/login_view.dart';
import 'package:eciftci/feature/logregpass/register/view/registerendrouter_view.dart';
import 'package:flutter/material.dart';

class RegisterRouterService {
  // register router view
  void registerRouterViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RegisterEndRouterView(),
      ),
    );
  }

  // login router view
  void loginRouterViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginView(),
      ),
    );
  }
}
