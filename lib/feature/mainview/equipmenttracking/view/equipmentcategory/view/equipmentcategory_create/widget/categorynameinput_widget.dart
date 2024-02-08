import 'package:eciftci/product/enums/mainview_enum/equipmenttracking_enum/equipmentcategory_enum/equipmentcategory_enum.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class EquipmentCategoryNameInputWidget extends StatelessWidget {
  const EquipmentCategoryNameInputWidget(
      {required this.modelCategoryService, super.key});

  final dynamic modelCategoryService;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: TextFormField(
        controller: modelCategoryService.categoryNameController,
        validator: modelCategoryService.categoryNameValidator,
        style: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.black,
          ),
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: EquipmentCategoryViewStrings.categoryNameInputText.value,
          hintStyle: GoogleFonts.nunito(
            textStyle: context.general.textTheme.labelMedium?.copyWith(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
