import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/widget/equipmentcard_widget.dart';
import 'package:eciftci/product/enums/mainview_enum/equipmenttracking_enum/equipment_enum/equipment_enum.dart';
import 'package:eciftci/product/utility/database/mainview_db/equipmenttracking_db/equipmenttracking_db.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class EquipmentListWidget extends StatelessWidget {
  const EquipmentListWidget(
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
      stream: EquipmentTrackingDB.EQUIPMENTTRACKING.equipmentList,
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
                                .homeEquipmentListTitleText.value,
                            textAlign: TextAlign.left,
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        routerService
                            .equipmentSearchViewNavigatorRouter(context);
                      },
                      child: LabelMediumMainColorText(
                        text:
                            EquipmentViewStrings.homeEquipmentListBtnText.value,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              // list
              Column(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return buildEquipmentCardWidget(context, data);
                }).toList(),
              )
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  // equipment card
  Widget buildEquipmentCardWidget(
          BuildContext context, Map<String, dynamic> data) =>
      EquipmentCardWidget(
        data: data,
        routerService: routerService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
