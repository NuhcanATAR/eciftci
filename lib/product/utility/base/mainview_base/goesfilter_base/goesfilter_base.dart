// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:eciftci/product/model/mainview_model/goesfilter_model/goesfilter_model.dart';
import 'package:eciftci/product/router/mainview_router/goesfilter_router/goesfilter_router.dart';
import 'package:eciftci/product/utility/database/mainview_db/goes_db/goes_db.dart';
import 'package:flutter/material.dart';
import '../../../../../product/extension/view_extension.dart';

abstract class MainGoesFilterBase<T extends StatefulWidget> extends State<T> {
  // model service
  GoesFilterModelService modelService = GoesFilterModelService();

  // router service
  GoesFilterRouterService routerService = GoesFilterRouterService();

  // screens size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;

  @override
  void initState() {
    super.initState();
    fetchMainGoesCategories();
    mainGoesCategory = [];
    checkControl();
  }

  void checkControl() async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result == true) {
      modelService.logger.i("İnternet Bağlandı!!");
    } else {
      routerService.connectionErrorViewNavigatorRouter(context);
    }
  }

  late List<MainGoesCategory> mainGoesCategory;
  MainGoesCategory? selectMainGoesCategory;

  void fetchMainGoesCategories() async {
    final snapshotCategory =
        await GoesServiceDB.INCOMEGOESCATEGORYS.goesCategoryRefTable;
    setState(() {
      mainGoesCategory = snapshotCategory.docs
          .map((docCategory) => MainGoesCategory.fromSnapshot(docCategory))
          .toList();
    });
  }

  Future<List> getFilterPriceList() async {
    QuerySnapshot querySnapshot = await GoesServiceDB.INCOMEGOES
        .goesFilterRefTable(
            selectMainGoesCategory?.id, modelService.selectedYear);

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
