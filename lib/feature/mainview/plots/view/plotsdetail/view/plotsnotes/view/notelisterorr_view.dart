import 'package:eciftci/product/constants/image_constant.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class NoteListErrorView extends StatelessWidget {
  const NoteListErrorView(
      {required this.title, required this.subTitle, super.key});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // img
          Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: AppPlotsImgConstant.errorList.toImg),
          // title
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            child: BodyMediumBlackBoldText(
              text: title,
              textAlign: TextAlign.center,
            ),
          ),
          // sub title
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: LabelMediumBlackText(
              text: subTitle,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
