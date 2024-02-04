// ignore_for_file: use_build_context_synchronously

import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/database/mainview_db/goes_db/goes_db.dart';
import 'package:flutter/material.dart';

import '../../../../../../product/widget/text_widget/label_medium_text.dart';

class CreateGoesAndCategoryButtonsWidget extends StatelessWidget {
  const CreateGoesAndCategoryButtonsWidget(
      {required this.routerService,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final dynamic routerService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              // create goes
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    routerService.goesCategoryListViewNavigatorRouter(context);
                  },
                  child: Card(
                    child: SizedBox(
                      width: maxWidth,
                      height: dynamicHeight(0.06),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: MainAppColorConstant.mainColorBackground,
                            width: 0.8,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.list_outlined,
                              color: MainAppColorConstant.mainColorBackground,
                              size: 18,
                            ),
                            const Expanded(
                              child: LabelMediumMainColorText(
                                text: "Gider Kategorilerim",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // create goes category
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    routerService
                        .goesCreateCategoryViewNavigatorRouter(context);
                  },
                  child: Card(
                    child: SizedBox(
                      width: maxWidth,
                      height: dynamicHeight(0.06),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: MainAppColorConstant.mainColorBackground,
                            width: 0.8,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.add,
                              color: MainAppColorConstant.mainColorBackground,
                              size: 18,
                            ),
                            const Expanded(
                              child: LabelMediumMainColorText(
                                text: "Gider Kategorisi Oluştur",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          //
          GestureDetector(
            onTap: () async {
              final goesCategoryRef =
                  await GoesServiceDB.INCOMEGOESCATEGORYS.goesCategoryRefTable;

              if (goesCategoryRef.docs.isEmpty) {
                routerService.goesCreateCategoryViewNavigatorRouter(context);
              } else {
                routerService.goesCreateViewNavigatorRouter(context);
              }
            },
            child: Card(
              child: SizedBox(
                width: maxWidth,
                height: dynamicHeight(0.06),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: MainAppColorConstant.mainColorBackground,
                      width: 0.8,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        color: MainAppColorConstant.mainColorBackground,
                        size: 18,
                      ),
                      const Expanded(
                        child: LabelMediumMainColorText(
                          text: "Yeni Gider Ekle",
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
