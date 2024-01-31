import 'package:eciftci/feature/logregpass/logreg/logreg_view.dart';
import 'package:eciftci/product/constants/textcolor_constant.dart';
import 'package:eciftci/product/utility/base/splashslider_base/splashslider_base.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:kartal/kartal.dart';

class SplashSliderView extends StatefulWidget {
  const SplashSliderView({super.key});

  @override
  State<SplashSliderView> createState() => _SplashSliderViewState();
}

class _SplashSliderViewState extends MainSplashSliderBase<SplashSliderView> {
  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      colorActiveDot: MainAppTextColorConstant.mainTextColor,
      renderNextBtn: Text(
        'Sonraki',
        style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
          color: MainAppTextColorConstant.mainTextColor,
        )),
      ),
      renderPrevBtn: Text(
        'Önceki',
        style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
          color: MainAppTextColorConstant.mainTextColor,
        )),
      ),
      renderSkipBtn: Text(
        'Bitir',
        style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
          color: MainAppTextColorConstant.mainTextColor,
        )),
      ),
      renderDoneBtn: TextButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LogRegView(),
            ),
            (Route<dynamic> route) => false,
          );
        },
        child: Text(
          'Başla!',
          style: GoogleFonts.nunito(
              textStyle: context.general.textTheme.bodyMedium?.copyWith(
            color: MainAppTextColorConstant.mainTextColor,
          )),
        ),
      ),
    );
  }
}
