import 'package:eciftci/feature/mainview/equipmenttracking/view/equipmentcategory/view/equipmentcategory_update/widget/categorynameinput_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipmentcategory/view/equipmentcategory_update/widget/footerbutton_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainequipment_bloc/equipmentcategory_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainequipment_bloc/equipmentcategory_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/mainequipmenttracking_base/equipmenttracking_base/equipmenttracking_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class EquipmentCategoryUpdateView extends StatefulWidget {
  const EquipmentCategoryUpdateView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<EquipmentCategoryUpdateView> createState() =>
      _EquipmentCategoryUpdateViewState();
}

class _EquipmentCategoryUpdateViewState
    extends MainEquipmentTrackingBase<EquipmentCategoryUpdateView> {
  late TextEditingController categoryNameController = TextEditingController(
    text: widget.data['CATEGORYNAME'],
  );
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
          text: "Ekipman Kategori Güncelleme",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<EquipmentCategoryCubit, EquipmentCategoryState>(
        listener: equipmentCategoryUpdateListeneBloc,
        builder: (context, state) {
          return Form(
            key: modelCategoryService.formEquipmentCategoryUpdateKey,
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
            // category name
            buildCategoryNameInputWidget,
          ],
        ),
      );

  // category name
  Widget get buildCategoryNameInputWidget => EquipmentCategoryNameInputWidget(
        modelCategoryService: modelCategoryService,
        categoryNameController: categoryNameController,
      );

  // footer button
  Widget get buildFooterButtonWidget => EquipmentCategoryFooterButtonWidget(
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        modelCategoryService: modelCategoryService,
        routerService: routerService,
        categoryNameController: categoryNameController,
        data: widget.data,
      );
}
