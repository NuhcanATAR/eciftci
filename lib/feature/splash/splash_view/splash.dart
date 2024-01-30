import 'package:eciftci/feature/splash/splashslider_view/splashslider.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/constants/icon_constant.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(
          seconds: 5,
        ), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const SplashSliderView(),
          ),
          (Route<dynamic> route) => false);
    });
    return Scaffold(
      backgroundColor: MainAppColorConstant.mainColorBackground,
      body: Center(
        child: Padding(
            padding: context.padding.high,
            child: AppIconConstant.appLogoTextGreen.toImg),
      ),
    );
  }
}
