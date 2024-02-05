import 'package:eciftci/product/enums/mainview_enum/plots_enum/plots_enum.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class PlotsQalificationInputWidget extends StatelessWidget {
  const PlotsQalificationInputWidget(
      {required this.qualificationController,
      required this.plotsModelService,
      super.key});

  final dynamic plotsModelService;
  final TextEditingController qualificationController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: TextFormField(
        style: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.black,
          ),
        ),
        controller: qualificationController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: PlotsViewStrings.plotsInputQalificationInputText.value,
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
