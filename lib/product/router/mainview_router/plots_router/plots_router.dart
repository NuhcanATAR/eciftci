import 'package:eciftci/feature/mainview/connectionerror/connectionerror_view.dart';
import 'package:eciftci/feature/mainview/plots/view/filter/filter_view.dart';
import 'package:eciftci/feature/mainview/plots/view/plots_list/plotsactive_view.dart';
import 'package:eciftci/feature/mainview/plots/view/plots_list/plotsclose_view.dart';
import 'package:eciftci/feature/mainview/plots/view/plotscreate/plotscreate_view.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/plotsdetail_view.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/view/plotsnotes/plotsnotes_view.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/view/plotsupdate/plotsupdate_view.dart';
import 'package:eciftci/feature/mainview/plots/view/search/search_view.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainplots_bloc/plots_bloc/cubit/cubit.dart';
import 'package:eciftci/product/enums/mainview_enum/plots_enum/plots_enum.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlotsRouterService {
  // active plots list view
  void activePlotsListViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PlotsActiveListView(),
      ),
    );
  }

  // close plots list view
  void closePlotsListViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PlotsCloseListView(),
      ),
    );
  }

  // plots search view
  void plotsSearchViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PlotsSearchView(),
      ),
    );
  }

  // plots filter view
  void plotsFilterViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PlotsFilterView(),
      ),
    );
  }

  // plots detail view
  void plotsDetailViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlotsDetailView(
          data: data,
        ),
      ),
    );
  }

  // plots create view
  void plotsCreateViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PlotsCreateView(),
      ),
    );
  }

  // plots save dialog
  void plotsSaveDialog(
    BuildContext context,
    TextEditingController plotsTitle,
    TextEditingController plotsExplanation,
    String city,
    String district,
    TextEditingController neighborhoodVillage,
    TextEditingController neighborhoodNumber,
    TextEditingController island,
    TextEditingController parcel,
    TextEditingController titleDeedArea,
    TextEditingController qalification,
    TextEditingController groundType,
    TextEditingController sheet,
    TextEditingController location,
    String selectPlotsStatus,
    int day,
    int month,
    int year,
  ) {
    var alertDialog = AlertDialog(
      title: BodyMediumBlackBoldText(
        text: PlotsViewStrings.createPlotsDialogTitle.value,
        textAlign: TextAlign.center,
      ),
      content: LabelMediumBlackText(
        text: PlotsViewStrings.createPlotsDialogSubTitle.value,
        textAlign: TextAlign.center,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const LabelMediumBlackBoldText(
                    text: "Kapat",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<PlotsCubit>(context).plotsAdd(
                      plotsTitle.text,
                      plotsExplanation.text,
                      city,
                      district,
                      neighborhoodVillage.text,
                      neighborhoodNumber.text,
                      island.text,
                      parcel.text,
                      titleDeedArea.text,
                      qalification.text,
                      groundType.text,
                      sheet.text,
                      location.text,
                      selectPlotsStatus,
                      day,
                      month,
                      year,
                    );
                    Navigator.pop(context);
                  },
                  child: const LabelMediumMainColorText(
                    text: "Araziyi Ekle",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }

  // plots notes list view
  void plotsNotesListViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlotsNotesView(
          data: data,
        ),
      ),
    );
  }

  // plots update view
  void plotsUpdateViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlotsUpdateView(
          data: data,
        ),
      ),
    );
  }

  // plots delete
  void plotsDeleteDialog(BuildContext context, Map<String, dynamic> data) {
    var alertDialog = AlertDialog(
      title: BodyMediumBlackBoldText(
        text: PlotsViewStrings.deleteDialogTitleText.value,
        textAlign: TextAlign.center,
      ),
      content: LabelMediumBlackText(
        text: PlotsViewStrings.deleteDialogSubTitleText.value,
        textAlign: TextAlign.center,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const LabelMediumBlackBoldText(
                    text: "Kapat",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<PlotsCubit>(context).plotsDelete(data);
                    Navigator.pop(context);
                  },
                  child: const LabelMediumMainColorText(
                    text: "Araziyi Kaldır",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }

  void plotsUpdateDialog(
    BuildContext context,
    TextEditingController plotsTitle,
    TextEditingController plotsExplanation,
    TextEditingController neighborhoodVillage,
    TextEditingController neighborhoodNumber,
    TextEditingController island,
    TextEditingController parcel,
    TextEditingController titleDeedArea,
    TextEditingController qalification,
    TextEditingController groundType,
    TextEditingController sheet,
    TextEditingController location,
    String selectPlotsStatus,
    int day,
    int month,
    int year,
    Map<String, dynamic> data,
  ) {
    var alertDialog = AlertDialog(
      title: BodyMediumBlackBoldText(
        text: PlotsViewStrings.updateDialogTitleText.value,
        textAlign: TextAlign.center,
      ),
      content: LabelMediumBlackText(
        text: PlotsViewStrings.updateDialogSubTitleText.value,
        textAlign: TextAlign.center,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const LabelMediumBlackBoldText(
                    text: "Kapat",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<PlotsCubit>(context).plotsUpdate(
                      plotsTitle.text,
                      plotsExplanation.text,
                      neighborhoodVillage.text,
                      neighborhoodNumber.text,
                      island.text,
                      parcel.text,
                      titleDeedArea.text,
                      qalification.text,
                      groundType.text,
                      sheet.text,
                      location.text,
                      selectPlotsStatus,
                      day,
                      month,
                      year,
                      data,
                    );
                    Navigator.pop(context);
                  },
                  child: const LabelMediumMainColorText(
                    text: "Araziyi Güncelle",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }

  // connection error view
  void connectionErrorViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ConnectionErrorView(),
      ),
    );
  }
}
