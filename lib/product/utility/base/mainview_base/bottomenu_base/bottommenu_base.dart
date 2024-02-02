// ignore_for_file: use_build_context_synchronously

import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:eciftci/product/model/mainview_model/bottommenu_model/bottommenu_model.dart';
import 'package:eciftci/product/router/mainview_router/bottommenu_router/bottommenu_router.dart';
import 'package:eciftci/product/router/mainview_router/connectionerror_router/connectionerror_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class MainBottomMenuBase<T extends StatefulWidget> extends State<T> {
  // service model
  BottomMenuModelService modelService = BottomMenuModelService();
  // router service
  ConnectionErrorRouterService routerService = ConnectionErrorRouterService();
  BottomMenuRouterService menuRouterService = BottomMenuRouterService();

  @override
  void initState() {
    super.initState();
    setState(() {
      checkControl();
    });
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
