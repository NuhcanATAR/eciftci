import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../product/bloc/mainview_bloc/income_bloc/cubit/cubit.dart';
import '../../../../../../../../product/enums/mainview_enum/income_enum/income_enum.dart';

class IncomeSaveButtonWidget extends StatelessWidget {
  const IncomeSaveButtonWidget(
      {required this.modelService,
      required this.selectMainIncomeCategory,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final dynamic modelService;
  final dynamic selectMainIncomeCategory;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (modelService.formIncomeAddKey.currentState!.validate()) {
          int value = int.parse(modelService.incomeValueController.text);
          BlocProvider.of<IncomeCubit>(context)
              .incomeAdd(
            modelService.incomeTitleController.text,
            modelService.incomeExplanationController.text,
            value,
            selectMainIncomeCategory?.id,
            modelService.dateTime.day,
            modelService.dateTime.month,
            modelService.dateTime.year,
          )
              .then((value) {
            modelService.incomeTitleController.clear();
            modelService.incomeExplanationController.clear();
            modelService.incomeValueController.clear();
          });
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
            text: IncomeViewStrings.incomeSavedButtonText.value,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
