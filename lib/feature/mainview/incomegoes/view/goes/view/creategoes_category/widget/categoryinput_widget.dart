import 'package:eciftci/product/enums/mainview_enum/goescategory_enum/goescategory_enum.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class CategoryInputWidget extends StatelessWidget {
  const CategoryInputWidget(
      {required this.goesCategoryModelService, super.key});

  final dynamic goesCategoryModelService;

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
        controller: goesCategoryModelService.categoryNameController,
        validator: goesCategoryModelService.categoryNameValidator,
        style: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.black,
          ),
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: GoesCategoryViewStrings.goescategoryInputText.value,
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
