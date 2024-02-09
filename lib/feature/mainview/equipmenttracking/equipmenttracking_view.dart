import 'package:eciftci/feature/mainview/equipmenttracking/widget/equipmentcategorylist_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/widget/equipmentlist_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/widget/search_widget.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/mainequipmenttracking_base/equipmenttracking_base/equipmenttracking_base.dart';
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
  Widget get buildSearchInputWidget => EquipementSearchInputWidget(
        routerService: routerService,
      );

  // equipment category list
  Widget get buildEquipmentCategoryListWidget => EquipmentCategoryListWidget(
        routerService: routerService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
  // equipment list
  Widget get buildEquipmentListWidget => EquipmentListWidget(
        routerService: routerService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
