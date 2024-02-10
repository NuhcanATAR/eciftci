// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:eciftci/product/model/mainview_model/home_model/home_model.dart';
import 'package:eciftci/product/router/mainview_router/home_router/home_router.dart';
import 'package:eciftci/product/utility/database/mainview_db/home_db/home_db.dart';
import 'package:flutter/material.dart';
import '../../../../extension/view_extension.dart';

abstract class MainHomeBase<T extends StatefulWidget> extends State<T> {
  // model service
  HomeServiceModel modelService = HomeServiceModel();

  // router service
  HomeServiceRouter routerService = HomeServiceRouter();

  // screens size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;

  @override
  void initState() {
    super.initState();
    getPlotsTotalValue();
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

  void getPlotsTotalValue() async {
    try {
      QuerySnapshot querySnapshot = await HomeDB.LANDPLOTS.plotsRef;

      double plotsValue = querySnapshot.size / 10.0;
      int plotsNumber = querySnapshot.size;

      setState(() {
        modelService.plotsValue = plotsValue;
        modelService.plotsNumber = plotsNumber;
      });
    } catch (e) {
      modelService.logger.e(e.toString());
    }
  }

  Future<List> getGoesPriceList() async {
    QuerySnapshot querySnapshot = await HomeDB.INCOMEGOES.goesRefTable;

    List priceList = querySnapshot.docs.map((doc) {
      return doc['VALUE'] ?? 0;
    }).toList();

    return priceList;
  }

  Future<int> calculateGoesTotalPrice() async {
    List priceList = await getGoesPriceList();

    int total = priceList.fold(
        0, (previousValue, element) => previousValue + element as int);

    return total;
  }

  Future<List> getIncomePriceList() async {
    QuerySnapshot querySnapshot = await HomeDB.INCOMEGOES.incomeRefTable;

    List priceList = querySnapshot.docs.map((doc) {
      return doc['VALUE'] ?? 0;
    }).toList();

    return priceList;
  }

  Future<int> calculateIncomeTotalPrice() async {
    List priceList = await getIncomePriceList();

    int total = priceList.fold(
        0, (previousValue, element) => previousValue + element as int);

    return total;
  }
}
