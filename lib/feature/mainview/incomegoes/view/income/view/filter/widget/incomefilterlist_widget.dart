import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/filter/view/filterlisterror_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/filter/view/filterlistloading_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/filter/view/filterlistno_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/filter/widget/filterincomecard_widget.dart';
import 'package:eciftci/product/utility/database/mainview_db/income_db/income_db.dart';

import 'package:flutter/material.dart';

class IncomeFilterListWidget extends StatelessWidget {
  const IncomeFilterListWidget(
      {required this.selectMainIncomeCategory,
      required this.modelService,
      required this.maxWidth,
      required this.dynamicHeight,
      required this.routerService,
      super.key});
  final dynamic selectMainIncomeCategory;
  final dynamic modelService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;
  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: IncomeServiceDB.INCOMEGOES.incomeListFilterTable(
          selectMainIncomeCategory?.id.toString(),
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
                return buildIncomeCardWidget(context, data);
              }).toList(),
            );
          } else {
            return buildFilterListNoWidget;
          }
        },
      ),
    );
  }

  // income card widget
  Widget buildIncomeCardWidget(
          BuildContext context, Map<String, dynamic> data) =>
      FilterIncomeCardWidget(
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
