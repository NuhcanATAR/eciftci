import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/equipment_create/widget/explanationinput_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/equipment_create/widget/location_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/equipment_create/widget/status_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/equipment_create/widget/titleinput_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainequipment_bloc/equipment_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainequipment_bloc/equipment_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/equipmenttracking_enum/equipment_enum/equipment_enum.dart';
import 'package:eciftci/product/utility/base/mainview_base/mainequipmenttracking_base/equipmenttracking_base/equipmenttracking_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../../product/model/mainview_model/mainequipmenttracking_model/equipmenttracking_model/equipmenttracking_model.dart';

class EquipmentCreateView extends StatefulWidget {
  const EquipmentCreateView({super.key});

  @override
  State<EquipmentCreateView> createState() => _EquipmentCreateViewState();
}

class _EquipmentCreateViewState
    extends MainEquipmentTrackingBase<EquipmentCreateView> {
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
          text: "Ekipman Oluştur",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<EquipmentCubit, EquipmentState>(
        listener: equipmentAddListenerBloc,
        builder: (context, state) {
          return Form(
            key: modelService.formEquiptmentTrackingAddKey,
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
            // equipment category select
            buildEquipmentCategorySelectWidget,
            // equipment title
            buildEquipmentTitleInputWidget,
            // equipment explanation
            buildEquipmentExplanationInputWidget,
            // equipment status
            buildEquipmentStatusWidget,
            // equipment location
            buildEquipmentLocationWidget,
          ],
        ),
      );

  // equipment category select
  Widget get buildEquipmentCategorySelectWidget => Container(
        padding: const EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: DropdownButtonFormField<MainEquipmentCategory>(
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          validator: (value) => value == null ? "* Zorunlu alan" : null,
          value: selectMainEquipmentCategory,
          isExpanded: true,
          hint: LabelMediumBlackText(
            text: EquipmentViewStrings.equipmentCategoryInputText.value,
            textAlign: TextAlign.left,
          ),
          onChanged: (MainEquipmentCategory? categoryMain) {
            setState(() {
              selectMainEquipmentCategory = categoryMain;
            });
          },
          items: mainEquipmentCategory
              .map<DropdownMenuItem<MainEquipmentCategory>>(
                  (MainEquipmentCategory categoryM) {
            return DropdownMenuItem<MainEquipmentCategory>(
              value: categoryM,
              child: Text(
                categoryM.categoryName,
                style: GoogleFonts.nunito(
                  textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.black,
                      ),
                ),
              ),
            );
          }).toList(),
        ),
      );

  // equipment title
  Widget get buildEquipmentTitleInputWidget => EquipmentTitleInputWidget(
        modelService: modelService,
      );

  // equipment explanation
  Widget get buildEquipmentExplanationInputWidget =>
      EquipmentExplanationInputWidget(
        modelService: modelService,
      );

  // equipment status
  Widget get buildEquipmentStatusWidget => EquipmentStatusWidget(
        modelService: modelService,
        dynamicWidth: dynamicWidth,
      );

  // equipment location
  Widget get buildEquipmentLocationWidget => EquipmentLocationWidget(
        modelService: modelService,
        dynamicWidth: dynamicWidth,
      );

  // footer button
  Widget get buildFooterButtonWidget => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: GestureDetector(
          onTap: () {
            if (modelService.formEquiptmentTrackingAddKey.currentState!
                .validate()) {
              BlocProvider.of<EquipmentCubit>(context).equipmentAdd(
                selectMainEquipmentCategory!.id,
                modelService.titleController.text,
                modelService.explanationController.text,
                modelService.selectEquipmentStatus,
                modelService.selectCity,
              );
            }
          },
          child: SizedBox(
            width: maxWidth,
            height: dynamicHeight(0.07),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: MainAppColorConstant.mainColorBackground,
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: LabelMediumWhiteText(
                text: EquipmentViewStrings.equipmentSaveButtonText.value,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );
}
