import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/logregpass_enum/register_enum/register_enum.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class RegisterButtonWidget extends StatelessWidget {
  const RegisterButtonWidget(
      {required this.serviceModel,
      required this.maxWidth,
      required this.dynamicHeight,
      required this.selectCity,
      required this.selectDistrict,
      required this.registerSignUpCubitService,
      super.key});

  final dynamic serviceModel;
  final dynamic maxWidth;
  final dynamic dynamicHeight;
  final String? selectCity;
  final String? selectDistrict;

  final dynamic registerSignUpCubitService;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (serviceModel.formRegisterKey.currentState!.validate()) {
          if (selectCity != null && selectDistrict != null) {
            registerSignUpCubitService.signUp(
              serviceModel.nameController.text,
              serviceModel.surnameController.text,
              selectCity,
              selectDistrict,
              serviceModel.emailController.text,
              serviceModel.phoneNumberController.text,
              serviceModel.passwordController,
              context,
            );
          } else {
            serviceModel.logger.e("Şehir ve İleç NULL!");
          }
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
            text: RegisterViewStrings.registerBtnText.value,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
