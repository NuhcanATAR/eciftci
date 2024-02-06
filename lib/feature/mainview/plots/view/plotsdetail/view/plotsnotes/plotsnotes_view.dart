import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/view/plotsnotes/view/notelisterorr_view.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/view/plotsnotes/view/notelistloading_view.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/view/plotsnotes/view/notelistno_view.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/view/plotsnotes/widget/notecard_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainplots_bloc/plotsnote_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainplots_bloc/plotsnote_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/plots_enum/plots_enum.dart';
import 'package:eciftci/product/utility/base/mainview_base/plots_base/plots_base.dart';
import 'package:eciftci/product/utility/database/mainview_db/plots_db/plots_db.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class PlotsNotesView extends StatefulWidget {
  const PlotsNotesView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<PlotsNotesView> createState() => _PlotsNotesViewState();
}

class _PlotsNotesViewState extends MainPlotsBase<PlotsNotesView> {
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
          text: "Arazi Notları",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<PlotsNoteCubit, PlotsNoteState>(
        listener: noteDeleteListenerBloc,
        builder: (context, state) {
          return Padding(
            padding: context.padding.low,
            child: StreamBuilder<QuerySnapshot>(
              stream: PlotsServiceDB.LANDPLOTS.plotsNoteListQuery(widget.data),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return buildPlotsNoteListErrorWidget;
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return buildPlotsNoteListLoadingWidget;
                }

                if (snapshot.hasData &&
                    snapshot.data != null &&
                    snapshot.data!.docs.isNotEmpty) {
                  return ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return buildNoteCardWidget(context, data);
                    }).toList(),
                  );
                } else {
                  return buildPlotsNoteListWidget;
                }
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        onPressed: () {
          routerService.plotsNoteCreateViewNavigatorRouter(
            context,
            widget.data,
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }

  // note card
  Widget buildNoteCardWidget(BuildContext context, Map<String, dynamic> data) =>
      NoteCardWidget(
        data: data,
        routerService: routerService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );

  // list error
  Widget get buildPlotsNoteListErrorWidget => NoteListErrorView(
        title: PlotsViewStrings.plotsNoteListErrorTitleText.value,
        subTitle: PlotsViewStrings.plotsNoteListErrorSubTitleText.value,
      );

  // list loading
  Widget get buildPlotsNoteListLoadingWidget => const NoteListLoadingView();

  // no list
  Widget get buildPlotsNoteListWidget => NoteListNoView(
        title: PlotsViewStrings.plotsNoteListNoTitleText.value,
        subTitle: PlotsViewStrings.plotsNoteListNoSubTitleText.value,
      );
}
