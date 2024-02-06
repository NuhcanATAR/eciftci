import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class EventCreateButtonWidget extends StatelessWidget {
  const EventCreateButtonWidget(
      {required this.showNoteDialog,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final dynamic showNoteDialog;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showNoteDialog();
      },
      child: Card(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
        child: SizedBox(
          width: maxWidth,
          height: dynamicHeight(0.07),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: MainAppColorConstant.mainColorBackground,
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 21,
                ),
                LabelMediumWhiteText(
                  text: "Etkinlik Oluştur!",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
