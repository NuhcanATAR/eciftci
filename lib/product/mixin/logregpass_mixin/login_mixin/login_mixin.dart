import 'package:eciftci/product/bloc/logregpass_bloc/login_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/router/logregpass_router/login_router/login_router.dart';
import 'package:flutter/material.dart';

mixin AuthSignInBlocListenerMixin {
  LoginServiceRouter routerService = LoginServiceRouter();
  void authSignInListenerBloc(context, state) {
    if (state is AuthSignInSuccess) {
      routerService.loginViewNavigatorRouter(context);
    } else if (state is AuthSignInUserNotFound) {
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: Text(
          state.valueMessage,
          style: const TextStyle(color: Colors.white),
        ),
        action: SnackBarAction(
          label: "Tamam",
          textColor: Colors.white,
          onPressed: () {},
        ),
        duration: const Duration(
          seconds: 4,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (state is AuthSignInWrongPasswordError) {
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: Text(
          state.valueMessage,
          style: const TextStyle(color: Colors.white),
        ),
        action: SnackBarAction(
          label: "Tamam",
          textColor: Colors.white,
          onPressed: () {},
        ),
        duration: const Duration(
          seconds: 4,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (state is AuthSignInInvalidEmail) {
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: Text(
          state.valueMessage,
          style: const TextStyle(color: Colors.white),
        ),
        action: SnackBarAction(
          label: "Tamam",
          textColor: Colors.white,
          onPressed: () {},
        ),
        duration: const Duration(
          seconds: 4,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (state is AuthSignInTooManyRequest) {
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: Text(
          state.valueMessage,
          style: const TextStyle(color: Colors.white),
        ),
        action: SnackBarAction(
          label: "Tamam",
          textColor: Colors.white,
          onPressed: () {},
        ),
        duration: const Duration(
          seconds: 4,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (state is AuthSignInError) {
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: Text(
          state.valueMessage,
          style: const TextStyle(color: Colors.white),
        ),
        action: SnackBarAction(
          label: "Tamam",
          textColor: Colors.white,
          onPressed: () {},
        ),
        duration: const Duration(
          seconds: 4,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
