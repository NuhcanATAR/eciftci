import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class FooterButtonsWidget extends StatelessWidget {
  const FooterButtonsWidget(
      {required this.data,
      required this.routerService,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final Map<String, dynamic> data;
  final dynamic routerService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // income edit
        buildIncomeEditButtonWidget(context),
        // income delete
        buildIncomeDeleteButtonWidget(context),
      ],
    );
  }

  // income edit
  Widget buildIncomeEditButtonWidget(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: GestureDetector(
          onTap: () {
            routerService.incomeUpdateViewNavigatorRouter(
              context,
              data,
            );
          },
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
                    Icons.edit_outlined,
                    color: Colors.white,
                    size: 18,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: LabelMediumWhiteText(
                      text: "Geliri Düzenle",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  // income delete
  Widget buildIncomeDeleteButtonWidget(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: GestureDetector(
          onTap: () {
            routerService.incomeDeleteDialog(
              context,
              data,
            );
          },
          child: SizedBox(
            width: maxWidth,
            height: dynamicHeight(0.07),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: MainAppColorConstant.mainColorBackground,
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.delete_outline,
                    color: MainAppColorConstant.mainColorBackground,
                    size: 18,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: LabelMediumMainColorText(
                      text: "Geliri Kaldır",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
