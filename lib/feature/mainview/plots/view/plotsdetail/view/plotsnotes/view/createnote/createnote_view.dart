import 'package:eciftci/feature/mainview/plots/view/plotsdetail/view/plotsnotes/view/createnote/widget/explanationinput_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/view/plotsnotes/view/createnote/widget/savebutton_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/view/plotsnotes/view/createnote/widget/titleinput_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainplots_bloc/plotsnote_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainplots_bloc/plotsnote_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/model/mainview_model/mainplots_model/note_model/note_model.dart';
import 'package:eciftci/product/utility/base/mainview_base/plots_base/plots_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class CreateNoteView extends StatefulWidget {
  const CreateNoteView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<CreateNoteView> createState() => _CreateNoteViewState();
}

class _CreateNoteViewState extends MainPlotsBase<CreateNoteView> {
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
          text: "Not Oluştur",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<PlotsNoteCubit, PlotsNoteState>(
        listener: noteAddListenerBloc,
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
                  // future date status
                  buildFutureDateStatusWidget,
                  // select date input
                  buildSelectDateInputWidget,
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
  Widget get buildTitleInputWidget => PlotsNoteTitleInputWidget(
        plotsNoteModel: plotsNoteModel,
      );

  // explanation input
  Widget get buildExplanationInputWidget => PlotsNoteExplanationInputWidget(
        plotsNoteModel: plotsNoteModel,
      );

  // future date status
  Widget get buildFutureDateStatusWidget => Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: DropdownMenu<String>(
        initialSelection: plotsNoteModel.futureDateListSelect,
        width: dynamicWidth(0.94),
        textStyle: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.black,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
        ),
        onSelected: (String? value) {
          setState(() {
            plotsNoteModel.futureDateListSelect = value!;
          });
        },
        dropdownMenuEntries:
            futureDateList.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),
      ));

  // select date input
  Widget get buildSelectDateInputWidget =>
      plotsNoteModel.futureDateListSelect == "Hedef Tarih Var"
          ? GestureDetector(
              onTap: () {
                selectFutureDate(context);
              },
              child: SizedBox(
                height: dynamicHeight(0.08),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.date_range,
                        color: Colors.grey,
                        size: 18,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: LabelMediumBlackText(
                            text:
                                "Seçili Tarih: ${plotsNoteModel.selectedDate.day}.${plotsNoteModel.selectedDate.month}.${plotsNoteModel.selectedDate.year}",
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : const SizedBox();

  // save button
  Widget get buildSaveButtonWidget => PlotsNoteSaveButtonWidget(
        data: widget.data,
        plotsNoteModel: plotsNoteModel,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
