import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/constants/string_constant.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget(
      {required this.routerService,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final dynamic routerService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 2,
      child: Padding(
        padding: context.padding.low,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // title & sub title
                buildTitleSubTitleWidget,
                // login button
                buildLoginButtonWidget(context),
                // register
                buildRegisterWidget(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // title & sub title
  Widget get buildTitleSubTitleWidget => const Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: BodyMediumBlackBoldText(
                text: AppLogRegStringConstant.titleText,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: LabelMediumBlackText(
                text: AppLogRegStringConstant.subTitleText,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );

  // login button
  Widget buildLoginButtonWidget(context) => GestureDetector(
        onTap: () {
          routerService.loginViewNavigatorRouter(context);
        },
        child: SizedBox(
          width: maxWidth,
          height: dynamicHeight(0.07),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: MainAppColorConstant.mainColorBackground,
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: const LabelMediumWhiteText(
              text: AppLogRegStringConstant.loginBtnText,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );

  // register
  Widget buildRegisterWidget(context) => Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // register text
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Container(
                alignment: Alignment.centerRight,
                child: const LabelMediumBlackText(
                  text: AppLogRegStringConstant.registerText,
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            // register button
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                    onTap: () {
                      routerService.registerViewNavigatorRouter(context);
                    },
                    child: const LabelMediumMainColorText(
                      text: AppLogRegStringConstant.registerBtnText,
                      textAlign: TextAlign.left,
                    )),
              ),
            ),
          ],
        ),
      );
}
