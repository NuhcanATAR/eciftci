import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/constants/image_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/goes_enum/goes_enum.dart';
import 'package:eciftci/product/utility/database/mainview_db/goes_db/goes_db.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class GoesListWidget extends StatelessWidget {
  const GoesListWidget(
      {required this.routerService,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final dynamic routerService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: GoesServiceDB.INCOMEGOES.goesListTable,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return buildListErrorWidget;
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return buildListLoadingWidget;
        }

        if (snapshot.hasData &&
            snapshot.data != null &&
            snapshot.data!.docs.isNotEmpty) {
          return Column(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return buildGoesCardWidget(context, data);
            }).toList(),
          );
        } else {
          return buildListNoWidget;
        }
      },
    );
  }

  // goes card widget
  Widget buildGoesCardWidget(BuildContext context, Map<String, dynamic> data) =>
      Card(
        child: SizedBox(
          width: maxWidth,
          height: dynamicHeight(0.1),
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
                // title & date
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      routerService.goesDetailViewNavigatorRouter(
                          context, data);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // title
                        SizedBox(
                          width: maxWidth,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: LabelMediumBlackBoldText(
                              text: data['TITLE'],
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        // date
                        SizedBox(
                          width: maxWidth,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: LabelMediumBlackText(
                              text:
                                  "${data['DAY'].toString()}.${data['MONTH'].toString()}.${data['YEAR'].toString()}",
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // goes value
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: LabelMediumMainColorText(
                    text: "${data['VALUE'].toString()}₺",
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  // list error widget
  Widget get buildListErrorWidget => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // img
          Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: AppIncomeGoesImgConstant.errorList.toImg),
          // title
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            child: BodyMediumBlackBoldText(
              text: GoesViewStrings.errorGoesListTitleText.value,
              textAlign: TextAlign.center,
            ),
          ),
          // sub title
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: LabelMediumBlackText(
              text: GoesViewStrings.errorGoesListSubTitleText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );

  // loading error widget
  Widget get buildListLoadingWidget => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // img
          LoadingAnimationWidget.hexagonDots(
            color: MainAppColorConstant.mainColorBackground,
            size: 45,
          ),
          // title
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 5),
            child: BodyMediumBlackBoldText(
              text: "Yükleniyor",
              textAlign: TextAlign.center,
            ),
          ),
          // sub title
          const Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: LabelMediumBlackText(
              text: "Lütfen Bekleyiniz...",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );

  // no list widget
  Widget get buildListNoWidget => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // img
          Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: AppIncomeGoesImgConstant.noList.toImg),
          // title
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            child: BodyMediumBlackBoldText(
              text: GoesViewStrings.noGoesListTitleText.value,
              textAlign: TextAlign.center,
            ),
          ),
          // sub title
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: LabelMediumBlackText(
              text: GoesViewStrings.noGoesListSubTitleText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
}
