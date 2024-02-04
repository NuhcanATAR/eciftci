import 'package:eciftci/product/enums/mainview_enum/mainincome_enum/incomecategory_enum/incomecategory_enum.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class CategoryInputWidget extends StatelessWidget {
  const CategoryInputWidget(
      {required this.incomeCategoryModelService, super.key});

  final dynamic incomeCategoryModelService;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: TextFormField(
        controller: incomeCategoryModelService.categoryNameController,
        validator: incomeCategoryModelService.categoryNameValidator,
        style: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.black,
          ),
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: IncomeCategoryViewStrings.incomecategoryInputText.value,
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
