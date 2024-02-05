import 'package:eciftci/product/enums/mainview_enum/plots_enum/plots_enum.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class PlotsTitleInputWidget extends StatelessWidget {
  const PlotsTitleInputWidget(
      {required this.titleController,
      required this.plotsModelService,
      super.key});

  final dynamic plotsModelService;
  final TextEditingController titleController;

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
        controller: titleController,
        validator: plotsModelService.titleValidator,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: PlotsViewStrings.plotsInputTitleInputText.value,
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
