import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';

import 'package:flutter/material.dart';

class EventNoteCardWidget extends StatelessWidget {
  const EventNoteCardWidget(
      {required this.agriculturalCalendarEventDelete,
      required this.maxWidth,
      required this.serviceModel,
      super.key});

  final dynamic maxWidth;
  final dynamic serviceModel;
  final dynamic agriculturalCalendarEventDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: maxWidth,
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: BodyMediumBlackBoldText(
                    text: "Kayıtlı Etkinlik",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              // title
              buildEventTitleWidget,
              // explanation
              buildEventExplanationWidget,
            ],
          ),
        ),
        // delete button
        buildEventDeleteButtonWidget,
      ],
    );
  }

  // event title
  Widget get buildEventTitleWidget => Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 5,
          top: 10,
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: maxWidth,
              child: const Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: LabelMediumMainColorText(
                  textAlign: TextAlign.left,
                  text: "Başlık:",
                ),
              ),
            ),
            SizedBox(
              width: maxWidth,
              child: LabelMediumBlackBoldText(
                text: serviceModel.selectedNote,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      );

  // event explanation
  Widget get buildEventExplanationWidget => Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: maxWidth,
              child: const Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: LabelMediumMainColorText(
                  textAlign: TextAlign.left,
                  text: "Açıklama:",
                ),
              ),
            ),
            SizedBox(
              width: maxWidth,
              child: LabelMediumBlackText(
                text: serviceModel.selectedExplanation,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      );

  // delete button
  Widget get buildEventDeleteButtonWidget => Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          onTap: () {
            agriculturalCalendarEventDelete();
          },
          child: const Icon(
            Icons.delete,
            color: Colors.red,
            size: 21,
          ),
        ),
      );
}
