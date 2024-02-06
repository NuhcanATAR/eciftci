import 'package:eciftci/feature/mainview/plots/view/plotsdetail/view/plotsnotes/view/updatenote/widget/explanationinput_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/view/plotsnotes/view/updatenote/widget/titleinput_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/view/plotsnotes/view/updatenote/widget/updatebutton_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainplots_bloc/plotsnote_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainplots_bloc/plotsnote_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/plots_base/plots_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class UpdateNoteView extends StatefulWidget {
  const UpdateNoteView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<UpdateNoteView> createState() => _UpdateNoteViewState();
}

class _UpdateNoteViewState extends MainPlotsBase<UpdateNoteView> {
  late TextEditingController noteTitleController = TextEditingController(
    text: widget.data['TITLE'],
  );
  late TextEditingController noteExplanationController = TextEditingController(
    text: widget.data['EXPLANATION'],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: MainAppColorConstant.mainColorBackground,
            size: 18,
          ),
        ),
        title: const LabelMediumMainColorText(
          text: "Not Güncelle",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<PlotsNoteCubit, PlotsNoteState>(
        listener: noteUpdateListenerBloc,
        builder: (context, state) {
          return Form(
            key: plotsNoteModel.formNoteAddKey,
            child: Padding(
              padding: context.padding.low,
              child: ListView(
                children: <Widget>[
                  // title input
                  buildTitleInputWidget,
                  // explanation input
                  buildExplanationInputWidget,

                  // save button
                  buildSaveButtonWidget,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // title input
  Widget get buildTitleInputWidget => PlotsNoteUpdateTitleInputWidget(
        noteTitleController: noteTitleController,
        plotsNoteModel: plotsNoteModel,
      );

  // explanation input
  Widget get buildExplanationInputWidget =>
      PlotsNoteUpdateExplanationInputWidget(
        noteExplanationController: noteExplanationController,
        plotsNoteModel: plotsNoteModel,
      );

  // save button
  Widget get buildSaveButtonWidget => PlotsNoteUpdateButtonWidget(
        plotsNoteModel: plotsNoteModel,
        noteTitleController: noteTitleController,
        noteExplanationController: noteExplanationController,
        data: widget.data,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
