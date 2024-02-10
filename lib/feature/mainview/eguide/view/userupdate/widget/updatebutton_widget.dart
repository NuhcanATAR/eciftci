import 'package:eciftci/product/bloc/mainview_bloc/eguide_bloc/cubit/cubit.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/eguide_enum/eguide_enum.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserUpdateButtonWidget extends StatelessWidget {
  const UserUpdateButtonWidget(
      {required this.modelService,
      required this.nameController,
      required this.surnameController,
      required this.phoneNumberController,
      required this.companyNameController,
      required this.explanationController,
      required this.maxWidth,
      required this.dynamicHeight,
      required this.data,
      super.key});

  final dynamic modelService;
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController phoneNumberController;
  final TextEditingController companyNameController;
  final TextEditingController explanationController;
  final Map<String, dynamic> data;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: GestureDetector(
        onTap: () {
          if (modelService.formUserUpdateKey.currentState!.validate()) {
            BlocProvider.of<EGuideCubit>(context).userUpdate(
              nameController.text,
              surnameController.text,
              phoneNumberController.text,
              companyNameController.text,
              explanationController.text,
              data,
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
              text: EGuideViewStrings.userUpdateButtonText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
