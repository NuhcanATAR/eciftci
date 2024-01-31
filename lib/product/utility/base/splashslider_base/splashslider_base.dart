import 'package:eciftci/product/constants/image_constant.dart';
import 'package:eciftci/product/constants/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:kartal/kartal.dart';

abstract class MainSplashSliderBase<T extends StatefulWidget> extends State<T> {
  List<Slide> slides = [];

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
        pathImage: AppSplashSliderImgs.sliderImg3.toPng,
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
        title: AppSplashSliderConstant.splashSliderTitle5Text,
        description: AppSplashSliderConstant.splashSliderSubTitle5Text,
        pathImage: AppSplashSliderImgs.sliderImg5.toPng,
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
        title: AppSplashSliderConstant.splashSliderTitle6Text,
        description: AppSplashSliderConstant.splashSliderSubTitle6Text,
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
        title: AppSplashSliderConstant.splashSliderTitle7Text,
        description: AppSplashSliderConstant.splashSliderSubTitle7Text,
        pathImage: AppSplashSliderImgs.sliderImg7.toPng,
        heightImage: 350,
        widthImage: 350,
        backgroundColor: const Color.fromARGB(255, 251, 251, 251),
      ),
    );
  }
}
