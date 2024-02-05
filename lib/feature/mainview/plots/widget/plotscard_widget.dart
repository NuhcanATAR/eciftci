import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class PlotsCardWidget extends StatelessWidget {
  const PlotsCardWidget(
      {required this.data, required this.routerService, super.key});

  final Map<String, dynamic> data;
  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        routerService.plotsDetailViewNavigatorRouter(
          context,
          data,
        );
      },
      child: Card(
        child: ListTile(
          title: BodyMediumBlackBoldText(
            text: data['TITLE'],
            textAlign: TextAlign.left,
          ),
          subtitle: Row(
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: MainAppColorConstant.mainColorBackground,
                size: 18,
              ),
              Expanded(
                child: LabelMediumBlackText(
                  text:
                      "${data['CITY'].toString()} / ${data['DISTRICT'].toString()}",
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          trailing: Icon(
            Icons.circle,
            size: 13,
            color: data['ACTIVE'] == true
                ? MainAppColorConstant.mainColorBackground
                : Colors.grey,
          ),
        ),
      ),
    );
  }
}
