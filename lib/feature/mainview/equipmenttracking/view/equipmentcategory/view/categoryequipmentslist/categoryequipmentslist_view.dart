import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipmentcategory/view/categoryequipmentslist/view/equipmentloading_view.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/widget/equipmentcard_widget.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/mainequipmenttracking_base/equipmenttracking_base/equipmenttracking_base.dart';
import 'package:eciftci/product/utility/database/mainview_db/equipmenttracking_db/equipmenttracking_db.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CategoryEquipmentsListView extends StatefulWidget {
  const CategoryEquipmentsListView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<CategoryEquipmentsListView> createState() =>
      _CategoryEquipmentsListViewState();
}

class _CategoryEquipmentsListViewState
    extends MainEquipmentTrackingBase<CategoryEquipmentsListView> {
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
        title: LabelMediumMainColorText(
          text: widget.data['CATEGORYNAME'],
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: context.padding.low,
        child: StreamBuilder<QuerySnapshot>(
          stream: EquipmentTrackingDB.EQUIPMENTTRACKING
              .selectCategoryEquipmentList(widget.data),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const SizedBox();
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return buildEquipmentLoadingWidget;
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> dataEquipment =
                    document.data()! as Map<String, dynamic>;
                return buildEquipmentCardWidget(context, dataEquipment);
              }).toList(),
            );
          },
        ),
      ),
    );
  }

  // equipment card widget
  Widget buildEquipmentCardWidget(
          BuildContext context, Map<String, dynamic> data) =>
      EquipmentCardWidget(
        data: data,
        routerService: routerService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );

  // equipment loading
  Widget get buildEquipmentLoadingWidget => const EquipmentLoadingView();
}
