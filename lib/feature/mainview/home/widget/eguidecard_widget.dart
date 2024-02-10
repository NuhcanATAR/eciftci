import 'package:animate_do/animate_do.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/home_enum/home_enum.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class EGuideCardWidget extends StatelessWidget {
  const EGuideCardWidget(
      {required this.routerService,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final dynamic routerService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: FadeInUp(
        child: Card(
          child: SizedBox(
            width: maxWidth,
            height: dynamicHeight(0.2),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: maxWidth,
                          child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: BodyMediumBlackBoldText(
                                text: HomeViewStrings.eguideTitleText.value,
                                textAlign: TextAlign.left,
                              )),
                        ),
                        SizedBox(
                          width: maxWidth,
                          child: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: LabelMediumBlackText(
                                text: HomeViewStrings.eguideSubTitleText.value,
                                textAlign: TextAlign.left,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        routerService.eguideViewNavigatorRouter(context);
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: MainAppColorConstant.mainColorBackground,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
