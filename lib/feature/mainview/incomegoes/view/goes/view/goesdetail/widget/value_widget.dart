import 'package:flutter/material.dart';

import '../../../../../../../../product/widget/text_widget/label_medium_text.dart';

class GoesValueWidget extends StatelessWidget {
  const GoesValueWidget({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
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
            child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: LabelMediumBlackText(
                  text: "Gider Değeri",
                  textAlign: TextAlign.left,
                )),
          ),
          LabelMediumMainColorText(
            text: data['VALUE'].toString(),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
