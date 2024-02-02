import 'package:eciftci/product/constants/image_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/connectionerror_enum/connectionerror_enum.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class ConnectionErrorView extends StatefulWidget {
  const ConnectionErrorView({super.key});

  @override
  State<ConnectionErrorView> createState() => _ConnectionErrorViewState();
}

class _ConnectionErrorViewState extends State<ConnectionErrorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // image
            Padding(
              padding: const EdgeInsets.only(
                left: 45,
                right: 45,
              ),
              child: AppConnectionErrorImgConstant.connectionErrorImg.toImg,
            ),
            // title
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: BodyMediumBlackBoldText(
                text: ConnectionErrorViewStrings.titleText.value,
                textAlign: TextAlign.center,
              ),
            ),
            // sub title
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: LabelMediumBlackText(
                text: ConnectionErrorViewStrings.subTitleText.value,
                textAlign: TextAlign.center,
              ),
            ),
            // button
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: LabelMediumMainColorText(
                text: ConnectionErrorViewStrings.btnText.value,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
