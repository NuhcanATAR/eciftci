import 'package:eciftci/product/bloc/mainview_bloc/mainincome_bloc/income_bloc/cubit/cubit.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../../product/enums/mainview_enum/mainincome_enum/income_enum/income_enum.dart';

class IncomeUpdateButtonWidget extends StatelessWidget {
  const IncomeUpdateButtonWidget(
      {required this.modelService,
      required this.selectMainIncomeCategory,
      required this.maxWidth,
      required this.dynamicHeight,
      required this.data,
      required this.titleController,
      required this.explanationController,
      required this.valueController,
      super.key});

  final dynamic modelService;
  final dynamic selectMainIncomeCategory;
  final dynamic maxWidth;
  final dynamic dynamicHeight;
  final Map<String, dynamic> data;
  final TextEditingController titleController;
  final TextEditingController explanationController;
  final TextEditingController valueController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (modelService.formIncomeUpdateKey.currentState!.validate()) {
          int value = int.parse(valueController.text);
          BlocProvider.of<IncomeCubit>(context).incomeUpdate(
            data,
            titleController.text,
            explanationController.text,
            value,
            modelService.dateTime.day,
            modelService.dateTime.month,
            modelService.dateTime.year,
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
            text: IncomeViewStrings.incomeUpdateButtonText.value,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
