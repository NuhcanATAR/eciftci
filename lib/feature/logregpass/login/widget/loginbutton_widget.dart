import 'package:eciftci/product/bloc/logregpass_bloc/login_bloc/cubit/cubit.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/logregpass_enum/login_enum/login_enum.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget(
      {required this.serviceModel,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});
  final dynamic serviceModel;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (serviceModel.formLoginKey.currentState!.validate()) {
          BlocProvider.of<AuthSignInCubit>(context).signIn(
            serviceModel.emailController.text.trim(),
            serviceModel.passwordController.text.trim(),
          );
        }
      },
      child: SizedBox(
        width: maxWidth,
        height: dynamicHeight(0.07),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: MainAppColorConstant.mainColorBackground,
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: LabelMediumWhiteText(
            text: LoginViewStrings.loginButtonText.value,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
