import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/filter/view/filterlisterror_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/filter/view/filterlistloading_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/filter/view/filterlistno_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/filter/widget/filtergoescard_widget.dart';

import 'package:eciftci/product/utility/database/mainview_db/goes_db/goes_db.dart';

import 'package:flutter/material.dart';

class GoesFilterListWidget extends StatelessWidget {
  const GoesFilterListWidget(
      {required this.selectMainGoesCategory,
      required this.modelService,
      required this.maxWidth,
      required this.dynamicHeight,
      required this.routerService,
      super.key});
  final dynamic selectMainGoesCategory;
  final dynamic modelService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;
  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: GoesServiceDB.INCOMEGOES.goesListFilterTable(
          selectMainGoesCategory?.id.toString(),
          modelService.selectedYear,
        ),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return buildFilterListErrorWidget;
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return buildFilterListLoadingWidget;
          }

          if (snapshot.hasData &&
              snapshot.data != null &&
              snapshot.data!.docs.isNotEmpty) {
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return buildGoesCardWidget(context, data);
              }).toList(),
            );
          } else {
            return buildFilterListNoWidget;
          }
        },
      ),
    );
  }

  // goes card widget
  Widget buildGoesCardWidget(BuildContext context, Map<String, dynamic> data) =>
      FilterGoesCardWidget(
        data: data,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        routerService: routerService,
      );
  // filter list error
  Widget get buildFilterListErrorWidget => const FilterListErrorView();
  // filter list loading
  Widget get buildFilterListLoadingWidget => const FilterListLoadingView();
  // filter list no
  Widget get buildFilterListNoWidget => const FilterListNoView();
}
