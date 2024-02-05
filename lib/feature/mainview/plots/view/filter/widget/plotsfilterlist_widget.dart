import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/feature/mainview/plots/view/filter/view/errorplots_view.dart';
import 'package:eciftci/feature/mainview/plots/view/filter/view/loadingplots_view.dart';
import 'package:eciftci/feature/mainview/plots/view/filter/view/noplots_view.dart';
import 'package:eciftci/feature/mainview/plots/widget/plotscard_widget.dart';
import 'package:eciftci/product/enums/mainview_enum/plots_enum/plots_enum.dart';
import 'package:eciftci/product/utility/database/mainview_db/plots_db/plots_db.dart';
import 'package:flutter/material.dart';

class PlotsFilterListWidget extends StatelessWidget {
  const PlotsFilterListWidget(
      {required this.routerService,
      required this.plotsModelService,
      super.key});

  final dynamic plotsModelService;
  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: PlotsServiceDB.LANDPLOTS.plotsListFilterQuery(
            plotsModelService.plotsSelectStatusType,
            plotsModelService.selectedYear),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return buildPlotsFilterListErrorWidget;
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return buildPlotsFilterListLoadingWidget;
          }

          if (snapshot.hasData &&
              snapshot.data != null &&
              snapshot.data!.docs.isNotEmpty) {
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                return buildPlotsCardWidget(context, data);
              }).toList(),
            );
          } else {
            return buildPlotsFilterlistNoWidget;
          }
        },
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
  // plots filter list error
  Widget get buildPlotsFilterListErrorWidget => ErrorPlotsView(
        title: PlotsViewStrings.plotsListErrorTitleText.value,
        subTitle: PlotsViewStrings.plotsListErrorSubTitleText.value,
      );

  // plots filter list loading
  Widget get buildPlotsFilterListLoadingWidget => const LoadingPlotsView();

  // plots filter list no
  Widget get buildPlotsFilterlistNoWidget => NoPlotsView(
        title: PlotsViewStrings.plotsFilterNoTitleText.value,
        subTitle: PlotsViewStrings.plotsFilterNoSubTitleText.value,
      );
}
