import 'package:flutter/material.dart';

enum AppSplashSliderImgs {
  sliderImg1('sliderimg1'),
  sliderImg2('sliderimg2'),
  sliderImg3('sliderimg3'),
  sliderImg4('sliderimg4'),
  sliderImg5('sliderimg5'),
  sliderImg6('sliderimg6'),
  sliderImg7('sliderimg7');

  final String value;
  const AppSplashSliderImgs(this.value);

  String get toPng => "assets/images/splashslider_img/$value.png";
  Image get toImg => Image.asset(toPng);
}

enum AppLogRegImgsConstant {
  backImg('backimg');

  final String value;
  const AppLogRegImgsConstant(this.value);

  String get toPng => "assets/images/logreg_img/$value.jpg";
  AssetImage get toImg => AssetImage(toPng);
}

enum AppConnectionErrorImgConstant {
  connectionErrorImg('undraw_Signal_searching_re_yl8n');

  final String value;
  const AppConnectionErrorImgConstant(this.value);

  String get toPng => "assets/images/connectionerror_img/$value.png";
  Image get toImg => Image.asset(toPng);
}
