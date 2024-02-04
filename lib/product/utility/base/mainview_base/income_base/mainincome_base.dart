// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:eciftci/product/mixin/mainview_mixin/income_mixin/income_mixin.dart';
import 'package:eciftci/product/model/mainview_model/income_model/income_model.dart';
import 'package:eciftci/product/router/mainview_router/income_router/income_router.dart';
import 'package:eciftci/product/utility/database/mainview_db/incomegoes_db/incomegoes_db.dart';
import 'package:flutter/material.dart';
import '../../../../../product/extension/view_extension.dart';

abstract class MainIncomeBase<T extends StatefulWidget> extends State<T>
    with IncomeBlocMixin {
  // model service
  IncomeModelService modelService = IncomeModelService();
  // router service
  IncomeRouterService routerService = IncomeRouterService();
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

  late List<MainIncomeCategory> mainIncomeCategory;
  MainIncomeCategory? selectMainIncomeCategory;

  void checkControl() async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result == true) {
      modelService.logger.i("İnternet Bağlandı!!");
    } else {
      routerService.connectionErrorViewNavigatorRouter(context);
    }
  }

  Future<List> getPriceList() async {
    QuerySnapshot querySnapshot =
        await IncomeGoesServiceDB.INCOMEGOES.incomeRefTable;

    List priceList = querySnapshot.docs.map((doc) {
      return doc['VALUE'] ?? 0;
    }).toList();

    return priceList;
  }

  Future<int> calculateTotalPrice() async {
    List priceList = await getPriceList();

    int total = priceList.fold(
        0, (previousValue, element) => previousValue + element as int);

    return total;
  }

  void fetchMainIncomeCategories() async {
    final snapshotCategory =
        await IncomeGoesServiceDB.INCOMEGOESCATEGORYS.incomeCategoryRefTable;
    setState(() {
      mainIncomeCategory = snapshotCategory.docs
          .map((docCategory) => MainIncomeCategory.fromSnapshot(docCategory))
          .toList();
    });
  }
}
