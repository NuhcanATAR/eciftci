import 'package:eciftci/feature/mainview/equipmenttracking/view/equipmentcategory/view/equipmentcategory_create/widget/categorynameinput_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipmentcategory/view/equipmentcategory_create/widget/footerbutton_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipmentcategory/view/equipmentcategory_create/widget/titlesubtitle_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainequipment_bloc/equipmentcategory_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainequipment_bloc/equipmentcategory_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/mainequipmenttracking_base/equipmenttracking_base/equipmenttracking_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class EquipmentCategoryCreateView extends StatefulWidget {
  const EquipmentCategoryCreateView({super.key});

  @override
  State<EquipmentCategoryCreateView> createState() =>
      _EquipmentCategoryCreateViewState();
}

class _EquipmentCategoryCreateViewState
    extends MainEquipmentTrackingBase<EquipmentCategoryCreateView> {
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
          text: "Ekipman Kategorisi Oluşturma",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<EquipmentCategoryCubit, EquipmentCategoryState>(
        listener: equipmentCategoryAddListeneBloc,
        builder: (context, state) {
          return Form(
            key: modelCategoryService.formEquipmentCategoryAddKey,
            child: Padding(
              padding: context.padding.low,
              child: Column(
                children: <Widget>[
                  // main body
                  buildMainBodyWidget,
                  // footer button
                  buildFooterButtonWidget,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // main body
  Widget get buildMainBodyWidget => Expanded(
        child: ListView(
          children: <Widget>[
            // title & sub title
            buildEquipmentTitleSubTitleWidget,
            // category name
            buildCategoryNameInputWidget,
          ],
        ),
      );

  // title & sub title
  Widget get buildEquipmentTitleSubTitleWidget =>
      EquipmentCreateTitleSubTitleWidget(
        maxWidth: maxWidth,
      );

  // category name
  Widget get buildCategoryNameInputWidget => EquipmentCategoryNameInputWidget(
        modelCategoryService: modelCategoryService,
      );

  // footer button
  Widget get buildFooterButtonWidget => EquipmentCategoryFooterButtonWidget(
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        modelCategoryService: modelCategoryService,
        routerService: routerService,
      );
}
