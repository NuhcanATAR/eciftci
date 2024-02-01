import 'package:eciftci/product/bloc/logregpass_bloc/password_bloc/cubit/cubit.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/logregpass_enum/password_enum/password_enum.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordButtonWidget extends StatelessWidget {
  const ResetPasswordButtonWidget(
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
        if (serviceModel.formResetPasswordKey.currentState!.validate()) {
          BlocProvider.of<MainAuthPasswordCubit>(context).resetPassword(
            serviceModel.mailController.text,
            context,
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
            text: PasswordViewStrings.sendResetMailBtnText.value,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
