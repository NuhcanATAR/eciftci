import 'package:eciftci/product/router/logregpass_router/logreg_router/logreg_router.dart';
import 'package:flutter/material.dart';
import '../../../../../product/extension/view_extension.dart';

abstract class MainLoginRegisterBase<T extends StatefulWidget>
    extends State<T> {
  // router service
  LogRegRouterService routerService = LogRegRouterService();

  // screens size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;
}
