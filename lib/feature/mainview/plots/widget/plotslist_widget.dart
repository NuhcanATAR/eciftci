import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/feature/mainview/plots/widget/plotscard_widget.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/constants/image_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/plots_enum/plots_enum.dart';
import 'package:eciftci/product/utility/database/mainview_db/plots_db/plots_db.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PlotsSubListWidget extends StatelessWidget {
  const PlotsSubListWidget({required this.routerService, super.key});

  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: PlotsServiceDB.LANDPLOTS.plotsListQuery,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return buildPlotsListErrorWidget;
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return buildPlotsListLoadingWidget;
        }

        if (snapshot.hasData &&
            snapshot.data != null &&
            snapshot.data!.docs.isNotEmpty) {
          return Column(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return PlotsCardWidget(
                data: data,
                routerService: routerService,
              );
            }).toList(),
          );
        } else {
          return buildPlotsListNoWidget;
        }
      },
    );
  }

  // plots list error
  Widget get buildPlotsListErrorWidget => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // img
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
            ),
            child: AppPlotsImgConstant.noList.toImg,
          ),
          // title
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            child: BodyMediumBlackBoldText(
              text: PlotsViewStrings.plotsListErrorTitleText.value,
              textAlign: TextAlign.center,
            ),
          ),

          // sub title
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            child: LabelMediumBlackText(
              text: PlotsViewStrings.plotsListErrorSubTitleText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );

  // plots list loading
  Widget get buildPlotsListLoadingWidget => Column(
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
              text: "Araziler Yükleniyor",
              textAlign: TextAlign.center,
            ),
          ),

          // sub title
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 5),
            child: LabelMediumBlackText(
              text: "Lütfen Bekleyiniz...",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );

  // plots list no
  Widget get buildPlotsListNoWidget => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // img
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
            ),
            child: AppPlotsImgConstant.noList.toImg,
          ),
          // title
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            child: BodyMediumBlackBoldText(
              text: PlotsViewStrings.plotsListNoTitleText.value,
              textAlign: TextAlign.center,
            ),
          ),

          // sub title
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            child: LabelMediumBlackText(
              text: PlotsViewStrings.plotsListNoSubTitleText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
}
