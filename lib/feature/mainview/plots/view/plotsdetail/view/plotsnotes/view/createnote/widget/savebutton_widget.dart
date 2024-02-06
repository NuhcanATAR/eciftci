import 'package:eciftci/product/bloc/mainview_bloc/mainplots_bloc/plotsnote_bloc/cubit/cubit.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../../product/enums/mainview_enum/plots_enum/plots_enum.dart';
import '../../../../../../../../../../product/widget/text_widget/label_medium_text.dart';

class PlotsNoteSaveButtonWidget extends StatelessWidget {
  const PlotsNoteSaveButtonWidget(
      {required this.data,
      required this.plotsNoteModel,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final Map<String, dynamic> data;
  final dynamic plotsNoteModel;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: GestureDetector(
        onTap: () {
          if (plotsNoteModel.formNoteAddKey.currentState!.validate()) {
            BlocProvider.of<PlotsNoteCubit>(context).noteAdd(
              plotsNoteModel.noteTitleController.text,
              plotsNoteModel.noteExplanationController.text,
              plotsNoteModel.futureDateListSelect,
              plotsNoteModel.selectedDate.day,
              plotsNoteModel.selectedDate.month,
              plotsNoteModel.selectedDate.year,
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
              text: PlotsViewStrings.plotsNoteSaveButtonText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
