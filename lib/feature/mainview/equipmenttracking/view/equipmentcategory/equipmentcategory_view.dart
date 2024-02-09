import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipmentcategory/view/equipmentcategorylisterror_view.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipmentcategory/view/equipmentcategorylistloading_view.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipmentcategory/widget/equipmentcategorycard_widget.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/mainequipmenttracking_base/equipmenttracking_base/equipmenttracking_base.dart';
import 'package:eciftci/product/utility/database/mainview_db/equipmenttracking_db/equipmenttracking_db.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class EquipmentCategoryView extends StatefulWidget {
  const EquipmentCategoryView({super.key});

  @override
  State<EquipmentCategoryView> createState() => _EquipmentCategoryViewState();
}

class _EquipmentCategoryViewState
    extends MainEquipmentTrackingBase<EquipmentCategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: MainAppColorConstant.mainColorBackground,
            size: 18,
          ),
        ),
        title: const LabelMediumMainColorText(
          text: "Ekipman Kategorileri",
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: context.padding.low,
        child: StreamBuilder<QuerySnapshot>(
          stream: EquipmentTrackingDB.EQUIPMENTCATEGORYS.equipmentCategoryList,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return buildEquipmentCategoryListErrorWidget;
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return buildEquipmentCategoryListLoadingWidget;
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return buildEquipmentCardWidget(context, data);
              }).toList(),
            );
          },
        ),
      ),
    );
  }

  // equipment category card widget
  Widget buildEquipmentCardWidget(
          BuildContext context, Map<String, dynamic> data) =>
      EquipmentCategoryCardWidget(
        data: data,
        routerService: routerService,
      );

  // equipment category list error
  Widget get buildEquipmentCategoryListErrorWidget =>
      const EquipmentCategoryListErrorView();

  // equipment category list loading
  Widget get buildEquipmentCategoryListLoadingWidget =>
      const EquipmentCategoryListLoadingView();
}
