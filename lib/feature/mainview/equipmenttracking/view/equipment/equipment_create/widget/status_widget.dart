import 'package:eciftci/product/enums/mainview_enum/equipmenttracking_enum/equipment_enum/equipment_enum.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class EquipmentStatusWidget extends StatefulWidget {
  const EquipmentStatusWidget(
      {required this.modelService, required this.dynamicWidth, super.key});

  final dynamic modelService;
  final dynamic dynamicWidth;

  @override
  State<EquipmentStatusWidget> createState() => _EquipmentStatusWidgetState();
}

class _EquipmentStatusWidgetState extends State<EquipmentStatusWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: DropdownMenu<String>(
        initialSelection: widget.modelService.selectEquipmentStatus,
        onSelected: (String? value) {
          setState(() {
            widget.modelService.selectEquipmentStatus = value!;
          });
        },
        label: LabelMediumBlackText(
          text: EquipmentViewStrings.equipmentStatusInputText.value,
          textAlign: TextAlign.left,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
        ),
        width: widget.dynamicWidth(0.98),
        textStyle: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.black,
          ),
        ),
        dropdownMenuEntries: widget.modelService.equipmentStatusList
            .map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),
      ),
    );
  }
}
