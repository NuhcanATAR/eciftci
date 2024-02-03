// ignore_for_file: use_build_context_synchronously

import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/database/mainview_db/incomegoes_db/incomegoes_db.dart';
import 'package:flutter/material.dart';

import '../../../../../../product/widget/text_widget/label_medium_text.dart';

class CreateIncomeAndCategoryButtonsWidget extends StatelessWidget {
  const CreateIncomeAndCategoryButtonsWidget(
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
              // create income
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    routerService
                        .incomeCategoryListViewNavigatorRouter(context);
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
                                text: "Gelir Kategorilerim",
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
              // create income category
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    routerService
                        .incomeCreateCategoryViewNavigatorRouter(context);
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
                                text: "Gelir Kategorisi Oluştur",
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
              final incomeCategoryRef = await IncomeGoesServiceDB
                  .INCOMEGOESCATEGORYS.incomeCategoryRefTable;

              if (incomeCategoryRef.docs.isEmpty) {
                routerService.incomeCreateCategoryViewNavigatorRouter(context);
              } else {
                routerService.incomeCreateViewNavigatorRouter(context);
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
                          text: "Yeni Gelir Ekle",
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
