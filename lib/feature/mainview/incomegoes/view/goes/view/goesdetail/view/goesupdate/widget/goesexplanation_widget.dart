import 'package:eciftci/product/enums/mainview_enum/maingoes_enum/goes_enum/goes_enum.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class GoesExplanationWidget extends StatelessWidget {
  const GoesExplanationWidget(
      {required this.explanationController,
      required this.modelService,
      super.key});
  final dynamic modelService;
  final TextEditingController explanationController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: TextFormField(
        controller: explanationController,
        validator: modelService.goesExplanationValidator,
        style: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.black,
          ),
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: GoesViewStrings.goesExplanationInputText.value,
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
