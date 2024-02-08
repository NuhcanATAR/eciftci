import 'package:eciftci/product/mixin/mainview_mixin/maineqipmenttracking_mixin/eqipmenttracking_mixin/eqipmenttracking_mixin.dart';
import 'package:eciftci/product/mixin/mainview_mixin/maineqipmenttracking_mixin/eqipmenttrackingcategory_mixin/eqipmenttrackingcategory_mixin.dart';
import 'package:eciftci/product/model/mainview_model/mainequipmenttracking_model/equipmentcategory_model/equipmentcategory_model.dart';
import 'package:eciftci/product/model/mainview_model/mainequipmenttracking_model/equipmenttracking_model/equipmenttracking_model.dart';
import 'package:eciftci/product/router/mainview_router/mainequipmenttracking_router/equipmenttracking_router/equipmenttracking_router.dart';
import 'package:eciftci/product/utility/database/mainview_db/equipmenttracking_db/equipmenttracking_db.dart';
import 'package:flutter/material.dart';
import '../../../../../extension/view_extension.dart';

abstract class MainEquipmentTrackingBase<T extends StatefulWidget>
    extends State<T>
    with EquipmentTrackingCategoryBlocMixin, EquipmentTrackingBlocMixin {
  // model service
  EquipmentTrackingModelService modelService = EquipmentTrackingModelService();
  EquipmentCategoryModel modelCategoryService = EquipmentCategoryModel();

  // router service
  EquipmentTrackingRouterService routerService =
      EquipmentTrackingRouterService();

  // screens size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;

  @override
  void initState() {
    super.initState();
    fetchMainIncomeCategories();
    mainEquipmentCategory = [];
  }

  late List<MainEquipmentCategory> mainEquipmentCategory;
  MainEquipmentCategory? selectMainEquipmentCategory;

  void fetchMainIncomeCategories() async {
    final snapshotCategory =
        await EquipmentTrackingDB.EQUIPMENTCATEGORYS.equipmentCategoryRef;
    setState(() {
      mainEquipmentCategory = snapshotCategory.docs
          .map((docCategory) => MainEquipmentCategory.fromSnapshot(docCategory))
          .toList();
    });
  }
}
