import 'package:eciftci/product/enums/mainview_enum/maingoes_enum/goes_enum/goes_enum.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class GoesValueWidget extends StatelessWidget {
  const GoesValueWidget({required this.modelService, super.key});

  final dynamic modelService;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 20),
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: TextFormField(
        controller: modelService.goesValueController,
        validator: modelService.goesValueValidator,
        style: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.black,
          ),
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: GoesViewStrings.goesValueInputText.value,
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
