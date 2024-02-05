import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class PlotsDetailFooterButtonsWidget extends StatelessWidget {
  const PlotsDetailFooterButtonsWidget(
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
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          // plots notes
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: () {
                routerService.plotsNotesListViewNavigatorRouter(
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
                        Icons.notes_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: LabelMediumWhiteText(
                          text: "Arazi Notlarım",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // plots edit
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: () {
                routerService.plotsUpdateViewNavigatorRouter(
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
                        Icons.edit_outlined,
                        color: MainAppColorConstant.mainColorBackground,
                        size: 18,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: LabelMediumMainColorText(
                          text: "Araziyi Düzenle",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // plots remove
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: () {
                routerService.plotsDeleteDialog(context, data);
              },
              child: SizedBox(
                width: maxWidth,
                height: dynamicHeight(0.07),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                        size: 18,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: LabelMediumRedText(
                          text: "Araziyi Kaldır",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
