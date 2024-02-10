import 'package:animate_do/animate_do.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/home_enum/home_enum.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeIncomeGoesCardsWidget extends StatelessWidget {
  const HomeIncomeGoesCardsWidget(
      {required this.calculateGoesTotalPrice,
      required this.calculateIncomeTotalPrice,
      required this.routerService,
      super.key});

  final dynamic calculateGoesTotalPrice;
  final dynamic calculateIncomeTotalPrice;
  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Row(
        children: <Widget>[
          // goes card
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: FadeInLeft(
              child: GestureDetector(
                onTap: () {
                  routerService.goesListViewNavigatorRouter(context);
                },
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        FutureBuilder<int>(
                          future: calculateGoesTotalPrice(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const SizedBox();
                            } else if (snapshot.hasError) {
                              return const BodyMediumBlackBoldText(
                                  text: "Hata oluştu!",
                                  textAlign: TextAlign.left);
                            } else {
                              return CircularPercentIndicator(
                                radius: 40.0,
                                lineWidth: 5.0,
                                percent: 1.0,
                                animation: true,
                                circularStrokeCap: CircularStrokeCap.round,
                                center: BodyMediumBlackBoldText(
                                  text: "${snapshot.data}₺",
                                  textAlign: TextAlign.center,
                                ),
                                progressColor: Colors.redAccent,
                              );
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: LabelMediumBlackBoldText(
                            text: HomeViewStrings.goesCardText.value,
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
          // income card
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: FadeInRight(
              child: GestureDetector(
                onTap: () {
                  routerService.incomeLitViewNavigatorRouter(context);
                },
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        FutureBuilder<int>(
                          future: calculateIncomeTotalPrice(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const SizedBox();
                            } else if (snapshot.hasError) {
                              return const BodyMediumBlackBoldText(
                                  text: "Hata oluştu!",
                                  textAlign: TextAlign.left);
                            } else {
                              return CircularPercentIndicator(
                                radius: 40.0,
                                lineWidth: 5.0,
                                percent: 1.0,
                                animation: true,
                                circularStrokeCap: CircularStrokeCap.round,
                                center: BodyMediumBlackBoldText(
                                  text: "${snapshot.data}₺",
                                  textAlign: TextAlign.center,
                                ),
                                progressColor:
                                    MainAppColorConstant.mainColorBackground,
                              );
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: LabelMediumBlackBoldText(
                            text: HomeViewStrings.incomeCardText.value,
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
        ],
      ),
    );
  }
}
