import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/model/logregpass_model/login_model/login_model.dart';
import 'package:eciftci/product/router/logregpass_router/login_router/login_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../product/extension/view_extension.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class MainLoginBase<T extends StatefulWidget> extends State<T> {
  // model service
  LoginServiceModel serviceModel = LoginServiceModel();

  // router service
  LoginServiceRouter serviceRouter = LoginServiceRouter();

  // screens size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;

  // remember me on changed
  void rememberMeOnChanged(bool? value) {
    setState(() {
      serviceModel.isRememberMeStatus = value!;
    });

    serviceModel.isRememberMeStatus = value!;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', serviceModel.emailController.text);
        prefs.setString('password', serviceModel.passwordController.text);
      },
    );
    setState(() {
      serviceModel.isRememberMeStatus = value;
    });
  }

  // connection control
  getConnnectivityStatus() => serviceModel.subscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) async {
        serviceModel.isDeviceConnected =
            await InternetConnectionChecker().hasConnection;
        if (!serviceModel.isDeviceConnected &&
            serviceModel.isAlertDialog == false) {
          showDialogBox();
          setState(() {
            serviceModel.isAlertDialog = true;
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
                  setState(() => serviceModel.isAlertDialog = false);
                  serviceModel.isDeviceConnected =
                      await InternetConnectionChecker().hasConnection;
                  if (!serviceModel.isDeviceConnected &&
                      serviceModel.isAlertDialog == false) {
                    showDialogBox();
                    setState(() => serviceModel.isAlertDialog = true);
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
