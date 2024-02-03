import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/product/model/mainview_model/incomefilter_model/incomefilter_model.dart';
import 'package:eciftci/product/router/mainview_router/incomefilter_router/incomefilter_router.dart';
import 'package:eciftci/product/utility/database/mainview_db/incomegoes_db/incomegoes_db.dart';
import 'package:flutter/material.dart';
import '../../../../../product/extension/view_extension.dart';

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
    fetchMainIncomeCategories();
    mainIncomeCategory = [];
  }

  late List<MainIncomeCategory> mainIncomeCategory;
  MainIncomeCategory? selectMainIncomeCategory;

  void fetchMainIncomeCategories() async {
    final snapshotCategory =
        await IncomeGoesServiceDB.INCOMEGOESCATEGORYS.incomeCategoryRefTable;
    setState(() {
      mainIncomeCategory = snapshotCategory.docs
          .map((docCategory) => MainIncomeCategory.fromSnapshot(docCategory))
          .toList();
    });
  }

  Future<List> getFilterPriceList() async {
    QuerySnapshot querySnapshot = await IncomeGoesServiceDB.INCOMEGOES
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
