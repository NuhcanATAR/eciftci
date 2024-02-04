// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:eciftci/product/mixin/mainview_mixin/maingoes_mixins/goes_mixin/goes_mixin.dart';
import 'package:eciftci/product/model/mainview_model/maingoes_model/goes_model/goes_model.dart';
import 'package:eciftci/product/router/mainview_router/maingoes_router/goes_router/goes_router.dart';
import 'package:eciftci/product/utility/database/mainview_db/goes_db/goes_db.dart';
import 'package:flutter/material.dart';
import '../../../../../extension/view_extension.dart';

abstract class MainGoesBase<T extends StatefulWidget> extends State<T>
    with GoesBlocMixin {
  // model service
  GoesModelService modelService = GoesModelService();
  // router service
  GoesRouterService routerService = GoesRouterService();
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
    mainGoesCategory = [];
  }

  late List<MainGoesCategory> mainGoesCategory;
  MainGoesCategory? selectMainGoesCategory;

  void checkControl() async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result == true) {
      modelService.logger.i("İnternet Bağlandı!!");
    } else {
      routerService.connectionErrorViewNavigatorRouter(context);
    }
  }

  Future<List> getPriceList() async {
    QuerySnapshot querySnapshot = await GoesServiceDB.INCOMEGOES.goesRefTable;

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
        await GoesServiceDB.INCOMEGOESCATEGORYS.goesCategoryRefTable;
    setState(() {
      mainGoesCategory = snapshotCategory.docs
          .map((docCategory) => MainGoesCategory.fromSnapshot(docCategory))
          .toList();
    });
  }
}
