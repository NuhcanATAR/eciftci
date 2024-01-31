import 'package:eciftci/product/constants/textcolor_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class LabelMediumBlackText extends StatelessWidget {
  const LabelMediumBlackText(
      {required this.text, required this.textAlign, super.key});

  final String text;
  final dynamic textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.labelMedium?.copyWith(
          color: Colors.black,
        ),
      ),
    );
  }
}

class LabelMediumMainColorText extends StatelessWidget {
  const LabelMediumMainColorText(
      {required this.text, required this.textAlign, super.key});

  final String text;
  final dynamic textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.labelMedium?.copyWith(
          color: MainAppTextColorConstant.mainTextColor,
        ),
      ),
    );
  }
}

class LabelMediumWhiteText extends StatelessWidget {
  const LabelMediumWhiteText(
      {required this.text, required this.textAlign, super.key});

  final String text;
  final dynamic textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.labelMedium?.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}

class LabelMediumGreyText extends StatelessWidget {
  const LabelMediumGreyText(
      {required this.text, required this.textAlign, super.key});

  final String text;
  final dynamic textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.labelMedium?.copyWith(
          color: Colors.grey,
        ),
      ),
    );
  }
}

class LabelMediumBlackBoldText extends StatelessWidget {
  const LabelMediumBlackBoldText(
      {required this.text, required this.textAlign, super.key});

  final String text;
  final dynamic textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.labelMedium?.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
