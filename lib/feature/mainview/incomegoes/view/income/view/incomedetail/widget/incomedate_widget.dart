import 'package:flutter/material.dart';

import '../../../../../../../../product/widget/text_widget/label_medium_text.dart';

class IncomeDateWidget extends StatelessWidget {
  const IncomeDateWidget({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          const Expanded(
            child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: LabelMediumBlackText(
                  text: "Gelir Tarihi",
                  textAlign: TextAlign.left,
                )),
          ),
          LabelMediumMainColorText(
            text:
                "${data['DAY'].toString()}.${data['MONTH'].toString()}.${data['YEAR'].toString()}",
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
