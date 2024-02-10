import 'package:animate_do/animate_do.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/home_enum/home_enum.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeTotalPlotsCardWidget extends StatelessWidget {
  const HomeTotalPlotsCardWidget(
      {required this.modelService,
      required this.routerService,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final dynamic modelService;
  final dynamic routerService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: FadeInDown(
        child: Card(
          child: SizedBox(
            width: maxWidth,
            height: dynamicHeight(0.2),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          routerService.plotsListViewNavigatorRouter(context);
                        },
                        child: modelService.plotsValue == 0
                            ? CircularPercentIndicator(
                                radius: 40.0,
                                lineWidth: 5.0,
                                percent: 0.0,
                                animation: true,
                                circularStrokeCap: CircularStrokeCap.round,
                                center: const BodyMediumBlackBoldText(
                                  text: "0%",
                                  textAlign: TextAlign.center,
                                ),
                                progressColor:
                                    MainAppColorConstant.mainColorBackground,
                              )
                            : modelService.plotsValue >= 0.9
                                ? CircularPercentIndicator(
                                    radius: 40.0,
                                    lineWidth: 5.0,
                                    percent: 1.0,
                                    animation: true,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    center: BodyMediumBlackBoldText(
                                      text: modelService.plotsNumber.toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                    progressColor: MainAppColorConstant
                                        .mainColorBackground,
                                  )
                                : CircularPercentIndicator(
                                    radius: 40.0,
                                    lineWidth: 5.0,
                                    percent: modelService.plotsValue,
                                    animation: true,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    center: BodyMediumBlackBoldText(
                                      text: modelService.plotsNumber.toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                    progressColor: MainAppColorConstant
                                        .mainColorBackground,
                                  ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: maxWidth,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: LabelMediumBlackText(
                                text: HomeViewStrings.plotsCardTitleText.value,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: maxWidth,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: GestureDetector(
                                onTap: () {
                                  routerService
                                      .plotsListViewNavigatorRouter(context);
                                },
                                child: BodyMediumBlackBoldText(
                                  text:
                                      "${modelService.plotsNumber.toString()} ${HomeViewStrings.plotsCardSubText.value}",
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ),
                        ],
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
