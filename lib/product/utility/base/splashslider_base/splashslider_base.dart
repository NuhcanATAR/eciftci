// ignore_for_file: use_build_context_synchronously

import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/constants/image_constant.dart';
import 'package:eciftci/product/constants/string_constant.dart';
import 'package:eciftci/product/model/logregpass_model/login_model/login_model.dart';
import 'package:eciftci/product/router/logregpass_router/login_router/login_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:kartal/kartal.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MainSplashSliderBase<T extends StatefulWidget> extends State<T> {
  List<Slide> slides = [];
  // connection model
  LoginServiceModel serviceModel = LoginServiceModel();
  // router service
  LoginServiceRouter routerService = LoginServiceRouter();

  @override
  void initState() {
    super.initState();
    loadUserEmailPassword();
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    slides.add(
      Slide(
        textAlignTitle: TextAlign.center,
        textAlignDescription: TextAlign.center,
        styleTitle: GoogleFonts.nunito(
          textStyle: context.general.textTheme.bodyMedium?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        styleDescription: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.grey,
          ),
        ),
        marginTitle:
            const EdgeInsets.only(bottom: 40, left: 10, right: 10, top: 75),
        marginDescription: const EdgeInsets.all(20),
        title: AppSplashSliderConstant.splashSliderTitle1Text,
        description: AppSplashSliderConstant.splashSliderSubTitle1Text,
        pathImage: AppSplashSliderImgs.sliderImg1.toPng,
        heightImage: 350,
        widthImage: 350,
        backgroundColor: const Color.fromARGB(255, 251, 251, 251),
      ),
    );
    slides.add(
      Slide(
        textAlignTitle: TextAlign.center,
        textAlignDescription: TextAlign.center,
        styleTitle: GoogleFonts.nunito(
          textStyle: context.general.textTheme.bodyMedium?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        styleDescription: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.grey,
          ),
        ),
        marginTitle:
            const EdgeInsets.only(bottom: 40, left: 10, right: 10, top: 75),
        marginDescription: const EdgeInsets.all(20),
        title: AppSplashSliderConstant.splashSliderTitle2Text,
        description: AppSplashSliderConstant.splashSliderSubTitle2Text,
        pathImage: AppSplashSliderImgs.sliderImg2.toPng,
        heightImage: 350,
        widthImage: 350,
        backgroundColor: const Color.fromARGB(255, 251, 251, 251),
      ),
    );
    slides.add(
      Slide(
        textAlignTitle: TextAlign.center,
        textAlignDescription: TextAlign.center,
        styleTitle: GoogleFonts.nunito(
          textStyle: context.general.textTheme.bodyMedium?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        styleDescription: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.grey,
          ),
        ),
        marginTitle:
            const EdgeInsets.only(bottom: 40, left: 10, right: 10, top: 75),
        marginDescription: const EdgeInsets.all(20),
        title: AppSplashSliderConstant.splashSliderTitle3Text,
        description: AppSplashSliderConstant.splashSliderSubTitle3Text,
        pathImage: AppSplashSliderImgs.sliderImg4.toPng,
        heightImage: 350,
        widthImage: 350,
        backgroundColor: const Color.fromARGB(255, 251, 251, 251),
      ),
    );
    slides.add(
      Slide(
        textAlignTitle: TextAlign.center,
        textAlignDescription: TextAlign.center,
        styleTitle: GoogleFonts.nunito(
          textStyle: context.general.textTheme.bodyMedium?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        styleDescription: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.grey,
          ),
        ),
        marginTitle:
            const EdgeInsets.only(bottom: 40, left: 10, right: 10, top: 75),
        marginDescription: const EdgeInsets.all(20),
        title: AppSplashSliderConstant.splashSliderTitle4Text,
        description: AppSplashSliderConstant.splashSliderSubTitle4Text,
        pathImage: AppSplashSliderImgs.sliderImg6.toPng,
        heightImage: 350,
        widthImage: 350,
        backgroundColor: const Color.fromARGB(255, 251, 251, 251),
      ),
    );
    slides.add(
      Slide(
        textAlignTitle: TextAlign.center,
        textAlignDescription: TextAlign.center,
        styleTitle: GoogleFonts.nunito(
          textStyle: context.general.textTheme.bodyMedium?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        styleDescription: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.grey,
          ),
        ),
        marginTitle:
            const EdgeInsets.only(bottom: 40, left: 10, right: 10, top: 75),
        marginDescription: const EdgeInsets.all(20),
        title: AppSplashSliderConstant.splashSliderTitle5Text,
        description: AppSplashSliderConstant.splashSliderSubTitle5Text,
        pathImage: AppSplashSliderImgs.sliderImg7.toPng,
        heightImage: 350,
        widthImage: 350,
        backgroundColor: const Color.fromARGB(255, 251, 251, 251),
      ),
    );
  }
}
