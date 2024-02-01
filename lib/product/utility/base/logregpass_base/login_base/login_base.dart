// ignore_for_file: use_build_context_synchronously

import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/mixin/logregpass_mixin/login_mixin/login_mixin.dart';
import 'package:eciftci/product/model/connection_model/connection_model.dart';
import 'package:eciftci/product/model/logregpass_model/login_model/login_model.dart';
import 'package:eciftci/product/router/logregpass_router/login_router/login_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../product/extension/view_extension.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class MainLoginBase<T extends StatefulWidget> extends State<T>
    with AuthSignInBlocListenerMixin {
  // model service
  LoginServiceModel serviceModel = LoginServiceModel();

  // connection service
  ConnectionServiceModel serviceConnectionModel = ConnectionServiceModel();

  // router service
  LoginServiceRouter serviceRouter = LoginServiceRouter();

  // screens size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;

  @override
  void initState() {
    super.initState();
    loadUserEmailPassword();
    getConnnectivityStatus();
  }

  void loadUserEmailPassword() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      dynamic email = prefs.getString("email") ?? "";

      dynamic password = prefs.getString("password") ?? "";

      dynamic remeberMe = prefs.getBool("remember_me") ?? false;

      if (remeberMe) {
        setState(() {
          serviceModel.isRememberMeStatus = true;
        });
        serviceModel.emailController.text = email;
        serviceModel.passwordController.text = password;

        FirebaseAuth auth = FirebaseAuth.instance;
        User? user = auth.currentUser;

        if (user != null) {
          if (user.emailVerified) {
            String uid = user.uid;
            serviceModel.logger.i("Kullanıcı UID: $uid");

            routerService.loginViewNavigatorRouter(context);
          } else {
            final snackBar = SnackBar(
              backgroundColor: MainAppColorConstant.mainColorBackground,
              content: const Text(
                "E-mail Adresinizi Doğrulayınız!",
                style: TextStyle(color: Colors.white),
              ),
              action: SnackBarAction(
                label: "Tamam",
                textColor: Colors.white,
                onPressed: () {},
              ),
              duration: const Duration(
                seconds: 4,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        } else {
          serviceModel.logger.i("Mevcut oturumda kullanıcı yok.");
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

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
