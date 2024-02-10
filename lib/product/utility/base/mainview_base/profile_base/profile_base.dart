// ignore_for_file: use_build_context_synchronously

import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:eciftci/product/mixin/mainview_mixin/profile_mixin/profile_mixin.dart';
import 'package:eciftci/product/model/logregpass_model/register_model/register_model.dart';
import 'package:eciftci/product/model/mainview_model/profile_model/profile_model.dart';
import 'package:eciftci/product/router/mainview_router/profile_router/profile_router.dart';
import 'package:flutter/material.dart';
import '../../../../extension/view_extension.dart';

abstract class MainProfileBase<T extends StatefulWidget> extends State<T>
    with ProfileMixinBloc {
  // router service
  ProfileServiceRouter serviceRouter = ProfileServiceRouter();

  // model service
  ProfileModelService modelService = ProfileModelService();

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

  // city & district
  mainUserCity? selectCity;
  mainUserDistrict? selectDistrict;
  List<String> selectDistrictList = [];

  void checkControl() async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result == true) {
      modelService.logger.i("İnternet Bağlandı!!");
    } else {
      serviceRouter.connectionErrorViewNavigatorRouter(context);
    }
  }
}
