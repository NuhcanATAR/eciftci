import 'package:eciftci/product/bloc/mainview_bloc/maingoes_bloc/goes_bloc/cubit/cubit.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../../product/enums/mainview_enum/maingoes_enum/goes_enum/goes_enum.dart';

class GoesUpdateButtonWidget extends StatelessWidget {
  const GoesUpdateButtonWidget(
      {required this.modelService,
      required this.selectMainGoesCategory,
      required this.maxWidth,
      required this.dynamicHeight,
      required this.data,
      required this.titleController,
      required this.explanationController,
      required this.valueController,
      super.key});

  final dynamic modelService;
  final dynamic selectMainGoesCategory;
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
        if (modelService.formGoesUpdateKey.currentState!.validate()) {
          int value = int.parse(valueController.text);
          BlocProvider.of<GoesCubit>(context).goesUpdate(
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
            text: GoesViewStrings.goesUpdateButtonText.value,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
