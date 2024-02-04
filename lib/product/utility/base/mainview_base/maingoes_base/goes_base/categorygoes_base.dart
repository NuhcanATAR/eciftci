// ignore_for_file: use_build_context_synchronously

import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:eciftci/product/mixin/mainview_mixin/maingoes_mixins/goescategory_mixin/goescategory_mixin.dart';
import 'package:eciftci/product/model/mainview_model/maingoes_model/goescategory_model/goescategory_model.dart';
import 'package:eciftci/product/router/mainview_router/maingoes_router/goescategory_router/goescategory_router.dart';
import 'package:flutter/material.dart';
import '../../../../../extension/view_extension.dart';

abstract class MainGoesCategoryBase<T extends StatefulWidget> extends State<T>
    with GoesCategoryBlocMixin {
  // model service
  GoesCategoryModelService goesCategoryModelService =
      GoesCategoryModelService();
  // router service
  GoesCategoryRouterService routerService = GoesCategoryRouterService();
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
      goesCategoryModelService.logger.i("İnternet Bağlandı!!");
    } else {
      routerService.connectionErrorViewNavigatorRouter(context);
    }
  }
}
