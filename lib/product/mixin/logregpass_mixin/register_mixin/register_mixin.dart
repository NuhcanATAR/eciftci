import 'package:eciftci/product/bloc/logregpass_bloc/register_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/router/logregpass_router/register_router/register_router.dart';
import 'package:flutter/material.dart';

mixin AuthSignUpBlocListenerMixin {
  // router service
  RegisterRouterService routerService = RegisterRouterService();
  void authSignUpListenerBloc(context, state) {
    if (state is AuthSignUpSuccess) {
      routerService.registerRouterViewNavigatorRouter(context);
    } else if (state is AuthSignUpEmailAlReadyInUse) {
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
    } else if (state is AuthSignUpError) {
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
