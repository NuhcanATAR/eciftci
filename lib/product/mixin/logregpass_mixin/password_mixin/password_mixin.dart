import 'package:eciftci/product/bloc/logregpass_bloc/password_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/router/logregpass_router/password_router/password_router.dart';
import 'package:flutter/material.dart';

mixin AuthPasswordBlocListenerMixin {
  // router service
  PasswordRouterService routerService = PasswordRouterService();
  void authResetPasswordListenerBloc(context, state) {
    if (state is AuthPasswordSuccess) {
      routerService.resetPassEndMailSuccessViewNavigatorRouter(context);
    } else if (state is AuthPasswordError) {
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: Text(
          state.errorMessage,
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
