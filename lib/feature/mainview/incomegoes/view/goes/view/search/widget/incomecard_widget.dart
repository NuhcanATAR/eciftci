import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class SearchGoesCardWidget extends StatelessWidget {
  const SearchGoesCardWidget(
      {required this.data,
      required this.maxWidth,
      required this.dynamicHeight,
      required this.routerService,
      super.key});

  final Map<String, dynamic> data;
  final dynamic maxWidth;
  final dynamic dynamicHeight;
  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                      context,
                      data,
                    );
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
  }
}
