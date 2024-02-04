// ignore_for_file: use_build_context_synchronously

import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:eciftci/product/mixin/mainview_mixin/incomecategory_mixin/incomecategory_mixin.dart';
import 'package:eciftci/product/model/mainview_model/incomecategory_model/incomecategory_model.dart';
import 'package:eciftci/product/router/mainview_router/incomecategory_router/incomecategory_router.dart';
import 'package:flutter/material.dart';
import '../../../../../../product/extension/view_extension.dart';

abstract class MainIncomeCategoryBase<T extends StatefulWidget> extends State<T>
    with IncomeCategoryBlocMixin {
  // model service
  IncomeCategoryModelService incomeCategoryModelService =
      IncomeCategoryModelService();
  // router service
  IncomeCategoryRouterService routerService = IncomeCategoryRouterService();
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
      incomeCategoryModelService.logger.i("İnternet Bağlandı!!");
    } else {
      routerService.connectionErrorViewNavigatorRouter(context);
    }
  }
}
