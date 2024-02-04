// ignore_for_file: use_build_context_synchronously

import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:eciftci/product/model/mainview_model/incomesearch_model/incomesearch_model.dart';

import 'package:flutter/material.dart';
import '../../../../../product/extension/view_extension.dart';
import '../../../../router/mainview_router/incomesearch_router/incomesearch_router.dart';

abstract class MainIncomeSearchBase<T extends StatefulWidget> extends State<T> {
  // model service
  IncomeSearchModelService modelService = IncomeSearchModelService();
  // router service
  IncomeSearchRouterService routerService = IncomeSearchRouterService();

  // screens size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;

  @override
  void initState() {
    super.initState();
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
}
