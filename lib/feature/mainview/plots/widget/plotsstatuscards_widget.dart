import 'package:animate_do/animate_do.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/plots_enum/plots_enum.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PlotsStatusCardsWidget extends StatelessWidget {
  const PlotsStatusCardsWidget(
      {required this.routerService,
      required this.dynamicHeight,
      required this.plotsModelService,
      super.key});

  final dynamic routerService;
  final dynamic dynamicHeight;
  final dynamic plotsModelService;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 15),
      child: Row(
        children: <Widget>[
          // active plots
          buildActivePlotsCardWidget(context),
          //  closed plots
          buildClosePlotsCardWidget(context),
        ],
      ),
    );
  }

  // active plots
  Widget buildActivePlotsCardWidget(BuildContext context) => Flexible(
        fit: FlexFit.tight,
        flex: 1,
        child: FadeInLeft(
          child: GestureDetector(
            onTap: () {
              routerService.activePlotsListViewNavigatorRouter(context);
            },
            child: Card(
              child: SizedBox(
                height: dynamicHeight(0.2),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        plotsModelService.plotsActiveValue == 0
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
                            : plotsModelService.plotsActiveValue >= 0.9
                                ? CircularPercentIndicator(
                                    radius: 40.0,
                                    lineWidth: 5.0,
                                    percent: 1.0,
                                    animation: true,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    center: BodyMediumBlackBoldText(
                                      text: plotsModelService.plotsActiveNumber
                                          .toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                    progressColor: MainAppColorConstant
                                        .mainColorBackground,
                                  )
                                : CircularPercentIndicator(
                                    radius: 40.0,
                                    lineWidth: 5.0,
                                    percent: plotsModelService.plotsActiveValue,
                                    animation: true,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    center: BodyMediumBlackBoldText(
                                      text: plotsModelService.plotsActiveNumber
                                          .toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                    progressColor: MainAppColorConstant
                                        .mainColorBackground,
                                  ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: LabelMediumBlackBoldText(
                            text: PlotsViewStrings.activeTitleText.value,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  // closed plots
  Widget buildClosePlotsCardWidget(BuildContext context) => Flexible(
        fit: FlexFit.tight,
        flex: 1,
        child: FadeInRight(
          child: GestureDetector(
            onTap: () {
              routerService.closePlotsListViewNavigatorRouter(context);
            },
            child: Card(
              child: SizedBox(
                height: dynamicHeight(0.2),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        plotsModelService.plotsCloseValue == 0
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
                            : plotsModelService.plotsCloseValue >= 0.9
                                ? CircularPercentIndicator(
                                    radius: 40.0,
                                    lineWidth: 5.0,
                                    percent: 1.0,
                                    animation: true,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    center: BodyMediumBlackBoldText(
                                      text: plotsModelService.plotsCloseValue
                                          .toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                    progressColor: MainAppColorConstant
                                        .mainColorBackground,
                                  )
                                : CircularPercentIndicator(
                                    radius: 40.0,
                                    lineWidth: 5.0,
                                    percent: plotsModelService.plotsCloseValue,
                                    animation: true,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    center: BodyMediumBlackBoldText(
                                      text: plotsModelService.plotsCloseNumber
                                          .toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                    progressColor: MainAppColorConstant
                                        .mainColorBackground,
                                  ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: LabelMediumBlackBoldText(
                            text: PlotsViewStrings.closeTitleText.value,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
