// ignore_for_file: use_build_context_synchronously

import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:eciftci/product/model/mainview_model/maingoes_model/goessearch_model/goessearch_model.dart';
import 'package:eciftci/product/router/mainview_router/maingoes_router/goessearch_router/goessearch_router.dart';
import 'package:flutter/material.dart';
import '../../../../../extension/view_extension.dart';

abstract class MainGoesSearchBase<T extends StatefulWidget> extends State<T> {
  // model service
  GoesSearchModelService modelService = GoesSearchModelService();
  // router service
  GoesSearchRouterService routerService = GoesSearchRouterService();

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
