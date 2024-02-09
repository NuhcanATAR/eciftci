import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/product/enums/mainview_enum/equipmenttracking_enum/equipment_enum/equipment_enum.dart';
import 'package:eciftci/product/utility/database/mainview_db/equipmenttracking_db/equipmenttracking_db.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class EquipmentCategoryListWidget extends StatelessWidget {
  const EquipmentCategoryListWidget(
      {required this.routerService,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final dynamic routerService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: EquipmentTrackingDB.EQUIPMENTCATEGORYS.equipmentCategoryList,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const SizedBox();
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        }

        if (snapshot.hasData &&
            snapshot.data != null &&
            snapshot.data!.docs.isNotEmpty) {
          return Column(
            children: <Widget>[
              // title
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: LabelMediumBlackText(
                            text: EquipmentViewStrings
                                .homeEquipmentCategoryListTitleText.value,
                            textAlign: TextAlign.left,
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        routerService
                            .equipmentCategorysViewNavigatorRouter(context);
                      },
                      child: LabelMediumMainColorText(
                        text: EquipmentViewStrings
                            .homeEquipmentCategoryListBtnText.value,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              // list
              SizedBox(
                width: maxWidth,
                height: dynamicHeight(0.08),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return GestureDetector(
                      onTap: () {
                        routerService
                            .selectCategoryEquipemtnsListViewNavigatorRouter(
                          context,
                          data,
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            right: 10, top: 10, bottom: 10),
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 0.5,
                              offset: const Offset(1, 0),
                              spreadRadius: 0.4,
                            ),
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        child: LabelMediumBlackText(
                          text: data['CATEGORYNAME'],
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        } else {
          return SizedBox(
            child: Container(color: Colors.red),
          );
        }
      },
    );
  }
}
