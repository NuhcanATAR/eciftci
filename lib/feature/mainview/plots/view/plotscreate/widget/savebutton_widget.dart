import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/plots_enum/plots_enum.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class PlotsSaveButtonWidget extends StatelessWidget {
  const PlotsSaveButtonWidget(
      {required this.plotsModelService,
      required this.selectCity,
      required this.selectDistrict,
      required this.routerService,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final dynamic plotsModelService;
  final dynamic selectCity;
  final dynamic selectDistrict;
  final dynamic routerService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: GestureDetector(
        onTap: () {
          if (plotsModelService.formPlotsSaveKey.currentState!.validate()) {
            routerService.plotsSaveDialog(
              context,
              plotsModelService.titleController,
              plotsModelService.explanationController,
              selectCity!.cityName,
              selectDistrict!.districtName,
              plotsModelService.neighborhoodVillageController,
              plotsModelService.neighborhoodNumber,
              plotsModelService.islandController,
              plotsModelService.parcelController,
              plotsModelService.titleDeedAreaController,
              plotsModelService.qualificationController,
              plotsModelService.groundTypeController,
              plotsModelService.sheetController,
              plotsModelService.locationController,
              plotsModelService.plotsSelectStatusType,
              plotsModelService.dateTime.day,
              plotsModelService.dateTime.month,
              plotsModelService.dateTime.year,
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
              text: PlotsViewStrings.plotsSaveButtonText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
