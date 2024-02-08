import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class EquipmentInformationTableWidget extends StatelessWidget {
  const EquipmentInformationTableWidget(
      {required this.maxWidth, required this.data, super.key});

  final Map<String, dynamic> data;
  final dynamic maxWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // status
        SizedBox(
          width: maxWidth,
          child: Container(
            padding: const EdgeInsets.only(bottom: 10, top: 20),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: <Widget>[
                const Expanded(
                  child: LabelMediumBlackBoldText(
                    text: "Durumu",
                    textAlign: TextAlign.left,
                  ),
                ),
                LabelMediumBlackText(
                  text: data['STATUS'],
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
        // location
        SizedBox(
          width: maxWidth,
          child: Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: <Widget>[
                const Expanded(
                  child: LabelMediumBlackBoldText(
                    text: "Konumu",
                    textAlign: TextAlign.left,
                  ),
                ),
                LabelMediumBlackText(
                  text: data['LOCATION'],
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
