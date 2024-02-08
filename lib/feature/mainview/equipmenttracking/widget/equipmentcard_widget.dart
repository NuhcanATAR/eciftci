import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/database/mainview_db/equipmenttracking_db/equipmenttracking_db.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class EquipmentCardWidget extends StatelessWidget {
  const EquipmentCardWidget(
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
    return GestureDetector(
      onTap: () {
        routerService.equipmentDetailViewNavigatorRouter(context, data);
      },
      child: Card(
        child: SizedBox(
          width: maxWidth,
          height: dynamicHeight(0.15),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 8,
                  child: Container(
                    decoration: BoxDecoration(
                        color: MainAppColorConstant.mainColorBackground,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(4),
                          bottomRight: Radius.circular(4),
                        )),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: context.padding.low,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          // category
                          SizedBox(
                            width: maxWidth,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: FutureBuilder<DocumentSnapshot>(
                                future: EquipmentTrackingDB.EQUIPMENTCATEGORYS
                                    .equipmentCategoryIDRef(data),
                                builder: (BuildContext context,
                                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                                  if (snapshot.hasError) {
                                    return const SizedBox();
                                  }

                                  if (snapshot.hasData &&
                                      !snapshot.data!.exists) {
                                    return const SizedBox();
                                  }

                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    Map<String, dynamic> dataCategory =
                                        snapshot.data!.data()
                                            as Map<String, dynamic>;
                                    return LabelMediumGreyText(
                                      text: dataCategory['CATEGORYNAME'],
                                      textAlign: TextAlign.left,
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                },
                              ),
                            ),
                          ),
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
                          // status
                          SizedBox(
                            width: maxWidth,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: LabelMediumBlackText(
                                text: "Durumu: ${data['STATUS']}",
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          // location
                          SizedBox(
                            width: maxWidth,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: LabelMediumBlackText(
                                text: "Konumu: ${data['LOCATION']}",
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
