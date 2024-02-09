// ignore_for_file: use_build_context_synchronously

import 'package:eciftci/feature/mainview/connectionerror/connectionerror_view.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/equipment_create/equipmentcreate_view.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/equipment_update/equipmentupdate_view.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/equipmentdetail/equipmentdetail_view.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/maintenanceservice/maintenanceservicelist/maintenanceservicelist_view.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipmentcategory/equipmentcategory_view.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipmentcategory/view/categoryequipmentslist/categoryequipmentslist_view.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipmentcategory/view/equipmentcategory_create/equipmentcategorycreate_view.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipmentcategory/view/equipmentcategory_update/equipmentcategoryupdate_view.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/search/search_view.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainequipment_bloc/equipment_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainequipment_bloc/equipmentcategory_bloc/cubit/cubit.dart';
import 'package:eciftci/product/enums/mainview_enum/equipmenttracking_enum/equipment_enum/equipment_enum.dart';
import 'package:eciftci/product/enums/mainview_enum/equipmenttracking_enum/equipmentcategory_enum/equipmentcategory_enum.dart';
import 'package:eciftci/product/utility/database/mainview_db/equipmenttracking_db/equipmenttracking_db.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EquipmentTrackingRouterService {
  // connection error view router
  void connectionErrorViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ConnectionErrorView(),
      ),
    );
  }

  // crate dialog
  void createDialog(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () async {
              final equipmentCategoryTable = await EquipmentTrackingDB
                  .EQUIPMENTCATEGORYS.equipmentCategoryRef;

              if (equipmentCategoryTable.docs.isEmpty) {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EquipmentCategoryCreateView(),
                  ),
                );
              } else {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EquipmentCreateView(),
                  ),
                );
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.add,
                    color: Colors.grey,
                    size: 18,
                  ),
                  Expanded(
                    child: LabelMediumBlackText(
                      text: "Ekipman Oluştur",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EquipmentCategoryCreateView(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.add,
                    color: Colors.grey,
                    size: 18,
                  ),
                  Expanded(
                    child: LabelMediumBlackText(
                      text: "Ekipman Kategorisi Oluştur",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }

  // equipments create view
  void equipmentCreateViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EquipmentCreateView(),
      ),
    );
  }

  // equipment update view
  void equipmentUpdateViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EquipmentUpdateView(
          data: data,
        ),
      ),
    );
  }

  // equipment categorys view
  void equipmentCategorysViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EquipmentCategoryView(),
      ),
    );
  }

  // category equipments list view
  void selectCategoryEquipemtnsListViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryEquipmentsListView(
          data: data,
        ),
      ),
    );
  }

  // search equipment view
  void equipmentSearchViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EquipmentSearchView(),
      ),
    );
  }

  // equipment detail view
  void equipmentDetailViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EquipmentDetailView(
          data: data,
        ),
      ),
    );
  }

  // equipment maintenance service list view
  void equipmentMaintenanceServiceListView(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MaintenanceServiceListView(data: data),
      ),
    );
  }

  // equipment category create view
  void equipmentCategoryCreateViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EquipmentCategoryCreateView(),
      ),
    );
  }

  // equipment category update view
  void equipmentCategoryUpdateViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EquipmentCategoryUpdateView(
          data: data,
        ),
      ),
    );
  }

  // equipment category create dialog
  void eqipmentCategoryCreateDialog(
    BuildContext context,
    TextEditingController categoryNameController,
  ) {
    dynamic alertDialog = AlertDialog(
      title: BodyMediumBlackBoldText(
        text: EquipmentCategoryViewStrings.createDialogTitleText.value,
        textAlign: TextAlign.center,
      ),
      content: LabelMediumBlackText(
        text: EquipmentCategoryViewStrings.createDialogSubTitleText.value,
        textAlign: TextAlign.center,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const LabelMediumBlackBoldText(
                    text: "Kapat",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<EquipmentCategoryCubit>(context)
                        .equiptmentCategorySave(
                      categoryNameController.text,
                    );
                    Navigator.pop(context);
                    categoryNameController.clear();
                  },
                  child: const LabelMediumMainColorText(
                    text: "Kaydet",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }

  // equipment delete dialog
  void equipmentDeleteDialog(BuildContext context, Map<String, dynamic> data) {
    dynamic alertDialog = AlertDialog(
      title: BodyMediumBlackBoldText(
        text: EquipmentViewStrings.equipmentDeleteDialogTitleText.value,
        textAlign: TextAlign.center,
      ),
      content: LabelMediumBlackText(
        text: EquipmentViewStrings.equipmentDeleteDialogSubTitleText.value,
        textAlign: TextAlign.center,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const LabelMediumBlackBoldText(
                    text: "Kapat",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<EquipmentCubit>(context)
                        .equipmentDelete(data);
                    Navigator.pop(context);
                  },
                  child: const LabelMediumMainColorText(
                    text: "Kaldır",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }
}
