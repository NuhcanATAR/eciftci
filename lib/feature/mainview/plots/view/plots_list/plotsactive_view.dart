import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/feature/mainview/plots/view/plots_list/view/errorplots_view.dart';
import 'package:eciftci/feature/mainview/plots/view/plots_list/view/loadingplots_view.dart';
import 'package:eciftci/feature/mainview/plots/view/plots_list/view/noplots_view.dart';
import 'package:eciftci/feature/mainview/plots/widget/plotscard_widget.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/plots_enum/plots_enum.dart';
import 'package:eciftci/product/utility/base/mainview_base/plots_base/plots_base.dart';
import 'package:eciftci/product/utility/database/mainview_db/plots_db/plots_db.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class PlotsActiveListView extends StatefulWidget {
  const PlotsActiveListView({super.key});

  @override
  State<PlotsActiveListView> createState() => _PlotsActiveListViewState();
}

class _PlotsActiveListViewState extends MainPlotsBase<PlotsActiveListView> {
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
          text: "Aktif Arazilerim",
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: context.padding.low,
        child: StreamBuilder<QuerySnapshot>(
          stream: PlotsServiceDB.LANDPLOTS.plotsRef
              .where("ACTIVE", isEqualTo: true)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return buildPlotsListErrorWidget;
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return buildPlotsListLoadingWidget;
            }

            if (snapshot.hasData &&
                snapshot.data != null &&
                snapshot.data!.docs.isNotEmpty) {
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return buildPlotsCardWidget(context, data);
                }).toList(),
              );
            } else {
              return buildPlotsListNoWidget;
            }
          },
        ),
      ),
    );
  }

  // plots card
  Widget buildPlotsCardWidget(
          BuildContext context, Map<String, dynamic> data) =>
      PlotsCardWidget(
        data: data,
        routerService: routerService,
      );

  // plots list error
  Widget get buildPlotsListErrorWidget => ErrorPlotsView(
        title: PlotsViewStrings.plotsListErrorTitleText.value,
        subTitle: PlotsViewStrings.plotsListErrorSubTitleText.value,
      );

  // plots list loading
  Widget get buildPlotsListLoadingWidget => const LoadingPlotsView();

  // plots list no
  Widget get buildPlotsListNoWidget => NoPlotsView(
        title: PlotsViewStrings.noActivePlotsListTitleText.value,
        subTitle: PlotsViewStrings.noActivePlotsListSubTitleText.value,
      );
}
