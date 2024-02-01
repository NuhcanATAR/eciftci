import 'package:eciftci/feature/logregpass/register/view/registerendrouter_view.dart';
import 'package:eciftci/product/bloc/logregpass_bloc/register_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:flutter/material.dart';

mixin AuthSignUpBlocListenerMixin {
  void authSignUpListenerBloc(context, state) {
    if (state is AuthSignUpSuccess) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const RegisterEndRouterView(),
          ),
          (Route<dynamic> route) => false);
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
