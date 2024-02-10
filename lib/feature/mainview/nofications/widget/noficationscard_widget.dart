import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class NoficationsCardWidget extends StatelessWidget {
  const NoficationsCardWidget(
      {required this.data,
      required this.noficationsUrl,
      required this.maxWidth,
      super.key});

  final Map<String, dynamic> data;
  final dynamic noficationsUrl;
  final dynamic maxWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        noficationsUrl(data);
      },
      child: Container(
        width: maxWidth,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.grey,
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
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
                  // sub title
                  SizedBox(
                    width: maxWidth,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: LabelMediumBlackText(
                        text: data['SUBTITLE'],
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5),
              child: Icon(
                Icons.notifications_on_outlined,
                color: Color.fromARGB(255, 200, 200, 8),
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
