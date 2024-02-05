// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:eciftci/product/mixin/mainview_mixin/mainplots_mixin/plots_mixin/plots_mixin.dart';
import 'package:eciftci/product/model/mainview_model/mainplots_model/note_model/note_model.dart';
import 'package:eciftci/product/model/mainview_model/mainplots_model/plots_model/plots_model.dart';
import 'package:eciftci/product/router/mainview_router/plots_router/plots_router.dart';
import 'package:eciftci/product/utility/database/mainview_db/plots_db/plots_db.dart';
import 'package:flutter/material.dart';
import '../../../../../../product/extension/view_extension.dart';

abstract class MainPlotsBase<T extends StatefulWidget> extends State<T>
    with PlotsBloxMixin {
  // model service
  PlotsModelService plotsModelService = PlotsModelService();
  PlotsNoteModel plotsNoteModel = PlotsNoteModel();

  // router service
  PlotsRouterService routerService = PlotsRouterService();

  // screens size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;

  @override
  void initState() {
    super.initState();
    getPlotsActiveValue();
    getPlotsCloseValue();
    checkControl();
  }

  void checkControl() async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result == true) {
      plotsModelService.logger.i("İnternet Bağlandı!!");
    } else {
      routerService.connectionErrorViewNavigatorRouter(context);
    }
  }

  // city & district
  mainUserCity? selectCity;
  mainUserDistrict? selectDistrict;
  List<String> selectDistrictList = [];

  void getPlotsActiveValue() async {
    try {
      QuerySnapshot querySnapshot = await PlotsServiceDB.LANDPLOTS.plotsRef
          .where("ACTIVE", isEqualTo: true)
          .get();

      double plotsValue = querySnapshot.size / 10.0;
      int plotsNumber = querySnapshot.size;

      setState(() {
        plotsModelService.plotsActiveValue = plotsValue;
        plotsModelService.plotsActiveNumber = plotsNumber;
      });
    } catch (e) {
      plotsModelService.logger.e("Hata: $e");
    }
  }

  void getPlotsCloseValue() async {
    try {
      QuerySnapshot querySnapshot = await PlotsServiceDB.LANDPLOTS.plotsRef
          .where("ACTIVE", isEqualTo: false)
          .get();

      double plotsValue = querySnapshot.size / 10.0;
      int plotsNumber = querySnapshot.size;
      setState(() {
        plotsModelService.plotsCloseValue = plotsValue;
        plotsModelService.plotsCloseNumber = plotsNumber;
      });
    } catch (e) {
      plotsModelService.logger.e("Hata: $e");
    }
  }
}
