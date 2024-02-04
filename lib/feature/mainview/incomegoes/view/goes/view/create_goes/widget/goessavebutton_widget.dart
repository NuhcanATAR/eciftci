import 'package:eciftci/product/bloc/mainview_bloc/maingoes_bloc/goes_bloc/cubit/cubit.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../product/enums/mainview_enum/maingoes_enum/goes_enum/goes_enum.dart';

class GoesSaveButtonWidget extends StatelessWidget {
  const GoesSaveButtonWidget(
      {required this.modelService,
      required this.selectMainGoesCategory,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final dynamic modelService;
  final dynamic selectMainGoesCategory;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (modelService.formGoesAddKey.currentState!.validate()) {
          int value = int.parse(modelService.goesValueController.text);
          BlocProvider.of<GoesCubit>(context)
              .goesAdd(
            modelService.goesTitleController.text,
            modelService.goesExplanationController.text,
            value,
            selectMainGoesCategory?.id,
            modelService.dateTime.day,
            modelService.dateTime.month,
            modelService.dateTime.year,
          )
              .then((value) {
            modelService.goesTitleController.clear();
            modelService.goesExplanationController.clear();
            modelService.goesValueController.clear();
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
            text: GoesViewStrings.goesSavedButtonText.value,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
