import 'package:eciftci/feature/logregpass/login/view/loginrouter_view.dart';
import 'package:eciftci/feature/logregpass/password/password_view.dart';
import 'package:eciftci/feature/logregpass/register/register_view.dart';
import 'package:flutter/material.dart';

class LoginServiceRouter {
  // login view router
  void loginViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginRouterView(),
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

  // forgot password view router
  void forgotPasswordViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PasswordView(),
      ),
    );
  }
}
