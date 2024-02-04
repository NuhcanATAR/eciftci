// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:eciftci/product/model/mainview_model/mainincome_model/incomefilter_model/incomefilter_model.dart';
import 'package:eciftci/product/router/mainview_router/mainincome_router/incomefilter_router/incomefilter_router.dart';
import 'package:eciftci/product/utility/database/mainview_db/income_db/income_db.dart';
import 'package:flutter/material.dart';
import '../../../../../../product/extension/view_extension.dart';

abstract class MainIncomeFilterBase<T extends StatefulWidget> extends State<T> {
  // model service
  IncomeFilterModelService modelService = IncomeFilterModelService();

  // router service
  IncomeFilterRouterService routerService = IncomeFilterRouterService();

  // screens size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;

  @override
  void initState() {
    super.initState();
    checkControl();
    fetchMainIncomeCategories();
    mainIncomeCategory = [];
  }

  void checkControl() async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result == true) {
      modelService.logger.i("İnternet Bağlandı!!");
    } else {
      routerService.connectionErrorViewNavigatorRouter(context);
    }
  }

  late List<MainIncomeCategory> mainIncomeCategory;
  MainIncomeCategory? selectMainIncomeCategory;

  void fetchMainIncomeCategories() async {
    final snapshotCategory =
        await IncomeServiceDB.INCOMEGOESCATEGORYS.incomeCategoryRefTable;
    setState(() {
      mainIncomeCategory = snapshotCategory.docs
          .map((docCategory) => MainIncomeCategory.fromSnapshot(docCategory))
          .toList();
    });
  }

  Future<List> getFilterPriceList() async {
    QuerySnapshot querySnapshot = await IncomeServiceDB.INCOMEGOES
        .incomeFilterRefTable(
            selectMainIncomeCategory?.id, modelService.selectedYear);

    List priceList = querySnapshot.docs.map((doc) {
      return doc['VALUE'] ?? 0;
    }).toList();

    return priceList;
  }

  Future<int> calculateFilterTotalPrice() async {
    List priceList = await getFilterPriceList();

    int total = priceList.fold(
        0, (previousValue, element) => previousValue + element as int);

    return total;
  }
}
