import 'package:eciftci/product/bloc/mainview_bloc/mainplots_bloc/plotsnote_bloc/cubit/cubit.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/plots_enum/plots_enum.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlotsNoteUpdateButtonWidget extends StatelessWidget {
  const PlotsNoteUpdateButtonWidget(
      {required this.plotsNoteModel,
      required this.noteTitleController,
      required this.noteExplanationController,
      required this.data,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final dynamic plotsNoteModel;
  final TextEditingController noteTitleController;
  final TextEditingController noteExplanationController;
  final Map<String, dynamic> data;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: GestureDetector(
        onTap: () {
          if (plotsNoteModel.formNoteAddKey.currentState!.validate()) {
            BlocProvider.of<PlotsNoteCubit>(context).noteUpdate(
              noteTitleController.text,
              noteExplanationController.text,
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
              text: PlotsViewStrings.plotsNoteUpdateButtonText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
