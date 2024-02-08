import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/equipment_update/widget/explanationinput_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/equipment_update/widget/footerbutton_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/equipment_update/widget/titleinput_widget.dart';
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

class EquipmentUpdateView extends StatefulWidget {
  const EquipmentUpdateView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<EquipmentUpdateView> createState() => _EquipmentUpdateViewState();
}

class _EquipmentUpdateViewState
    extends MainEquipmentTrackingBase<EquipmentUpdateView> {
  late TextEditingController titleController = TextEditingController(
    text: widget.data['TITLE'],
  );
  late TextEditingController explanationController = TextEditingController(
    text: widget.data['EXPLANATION'],
  );

  late String selectEquipmentStatus = widget.data['STATUS'];
  late String selectCity = widget.data['LOCATION'];
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
          text: "Ekipman Güncelle",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<EquipmentCubit, EquipmentState>(
        listener: equipmentUpdateListenerBloc,
        builder: (context, state) {
          return Form(
            key: modelService.formEquipmentTrackingUpdateKey,
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

  // equipment title
  Widget get buildEquipmentTitleInputWidget => EquipmentTitleInputWidget(
        titleController: titleController,
        modelService: modelService,
      );

  // equipment explanation
  Widget get buildEquipmentExplanationInputWidget =>
      EquipmentExplanationInputWidget(
        explanationController: explanationController,
        modelService: modelService,
      );

  // equipment status
  Widget get buildEquipmentStatusWidget => Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: DropdownMenu<String>(
          initialSelection: selectEquipmentStatus,
          onSelected: (String? value) {
            setState(() {
              selectEquipmentStatus = value!;
            });
          },
          label: LabelMediumBlackText(
            text: EquipmentViewStrings.equipmentStatusInputText.value,
            textAlign: TextAlign.left,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            border: InputBorder.none,
          ),
          width: dynamicWidth(0.98),
          textStyle: GoogleFonts.nunito(
            textStyle: context.general.textTheme.labelMedium?.copyWith(
              color: Colors.black,
            ),
          ),
          dropdownMenuEntries: modelService.equipmentStatusList
              .map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
        ),
      );

  // equipment location
  Widget get buildEquipmentLocationWidget => Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: DropdownMenu<String>(
          initialSelection: selectCity,
          onSelected: (String? value) {
            setState(() {
              selectCity = value!;
            });
          },
          label: LabelMediumBlackText(
            text: EquipmentViewStrings.equipmentLocationCityInputText.value,
            textAlign: TextAlign.left,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            border: InputBorder.none,
          ),
          width: dynamicWidth(0.98),
          textStyle: GoogleFonts.nunito(
            textStyle: context.general.textTheme.labelMedium?.copyWith(
              color: Colors.black,
            ),
          ),
          dropdownMenuEntries: modelService.cityList
              .map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
        ),
      );

  // footer button
  Widget get buildFooterButtonWidget => EquipmentFooterUpdateButtonWidget(
        data: widget.data,
        modelService: modelService,
        titleController: titleController,
        explanationController: explanationController,
        selectEquipmentStatus: selectEquipmentStatus,
        selectCity: selectCity,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
