import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/widget/equipmentcard_widget.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/mainequipmenttracking_base/equipmenttracking_base/equipmenttracking_base.dart';
import 'package:eciftci/product/utility/database/mainview_db/equipmenttracking_db/equipmenttracking_db.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class EquipmentTrackingView extends StatefulWidget {
  const EquipmentTrackingView({super.key});

  @override
  State<EquipmentTrackingView> createState() => _EquipmentTrackingViewState();
}

class _EquipmentTrackingViewState
    extends MainEquipmentTrackingBase<EquipmentTrackingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const LabelMediumMainColorText(
          text: "Tarımsal Ekipman ve Malzeme Takibi",
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: context.padding.low,
        child: ListView(
          children: <Widget>[
            // search
            buildSearchInputWidget,
            // equipment category list
            buildEquipmentCategoryListWidget,
            // last maintanence and service list
            buildLastMaintanenceandServiceListWidget,
            // equipment list
            buildEquipmentListWidget,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          routerService.createDialog(context);
        },
        backgroundColor: MainAppColorConstant.mainColorBackground,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }

  // search
  Widget get buildSearchInputWidget => GestureDetector(
        onTap: () {
          routerService.equipmentSearchViewNavigatorRouter(context);
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: const Row(
            children: <Widget>[
              Icon(
                Icons.search_outlined,
                color: Colors.grey,
                size: 18,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: LabelMediumGreyText(
                    text: "Ekipman ve Malzeme Arayın",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  // equipment category list
  Widget get buildEquipmentCategoryListWidget => StreamBuilder<QuerySnapshot>(
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
                      const Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: LabelMediumBlackText(
                              text: "Ekipman ve Malzeme Kategorileri",
                              textAlign: TextAlign.left,
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          routerService
                              .equipmentCategorysViewNavigatorRouter(context);
                        },
                        child: const LabelMediumMainColorText(
                          text: "Daha fazla",
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

  // last maintanence and service list
  Widget get buildLastMaintanenceandServiceListWidget => const SizedBox();

  // equipment list
  Widget get buildEquipmentListWidget => StreamBuilder<QuerySnapshot>(
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
                      const Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: LabelMediumBlackText(
                              text: "Ekipman ve Malzemeler",
                              textAlign: TextAlign.left,
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          routerService
                              .equipmentSearchViewNavigatorRouter(context);
                        },
                        child: const LabelMediumMainColorText(
                          text: "Daha fazla",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                // list
                Column(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
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
