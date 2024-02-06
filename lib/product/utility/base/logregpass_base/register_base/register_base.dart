// ignore_for_file: overridden_fields, annotate_overrides

import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/mixin/logregpass_mixin/register_mixin/register_mixin.dart';
import 'package:eciftci/product/model/connection_model/connection_model.dart';
import 'package:eciftci/product/model/logregpass_model/register_model/register_model.dart';
import 'package:eciftci/product/router/logregpass_router/register_router/register_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../product/extension/view_extension.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class MainRegisterBase<T extends StatefulWidget> extends State<T>
    with AuthSignUpBlocListenerMixin {
  // model service
  RegisterServiceModel serviceModel = RegisterServiceModel();

  // connection model
  ConnectionServiceModel serviceConnectionModel = ConnectionServiceModel();

  // router service
  RegisterRouterService routerService = RegisterRouterService();

  // screens size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;

  @override
  void initState() {
    super.initState();
    getConnnectivityStatus();
  }

  // city & district
  mainUserCity? selectCity;
  mainUserDistrict? selectDistrict;
  List<String> selectDistrictList = [];

  // connection control
  getConnnectivityStatus() =>
      serviceConnectionModel.subscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) async {
        serviceConnectionModel.isDeviceConnected =
            await InternetConnectionChecker().hasConnection;
        if (!serviceConnectionModel.isDeviceConnected &&
            serviceConnectionModel.isAlertDialog == false) {
          showDialogBox();
          setState(() {
            serviceConnectionModel.isAlertDialog = true;
          });
        }
      });

  showDialogBox() => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Icon(
            Icons.wifi_off_rounded,
            color: Colors.redAccent,
            size: 55,
          ),
          content: Text(
            'İnternet bağlantınız yok! Lütfen tekrar deneyiniz.',
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                onPressed: () async {
                  Navigator.pop(context, 'Cancel');
                  setState(() => serviceConnectionModel.isAlertDialog = false);
                  serviceConnectionModel.isDeviceConnected =
                      await InternetConnectionChecker().hasConnection;
                  if (!serviceConnectionModel.isDeviceConnected &&
                      serviceConnectionModel.isAlertDialog == false) {
                    showDialogBox();
                    setState(() => serviceConnectionModel.isAlertDialog = true);
                  }
                },
                child: Text(
                  'Tekrar Dene',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: MainAppColorConstant.mainColorBackground,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      );
}
