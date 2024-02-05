import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/plots_enum/plots_enum.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class PlotsUpdateButtonWidget extends StatelessWidget {
  const PlotsUpdateButtonWidget(
      {required this.data,
      required this.plotsModelService,
      required this.selectCity,
      required this.selectDistrict,
      required this.routerService,
      required this.maxWidth,
      required this.dynamicHeight,
      required this.titleController,
      required this.explanationController,
      required this.neighborhoodVillageController,
      required this.neighborhoodNumber,
      required this.islandController,
      required this.parcelController,
      required this.titleDeedAreaController,
      required this.qualificationController,
      required this.groundTypeController,
      required this.sheetController,
      required this.locationController,
      required this.plotsSelectStatusType,
      super.key});

  final Map<String, dynamic> data;
  final dynamic plotsModelService;
  final dynamic selectCity;
  final dynamic selectDistrict;
  final dynamic routerService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;
  final TextEditingController titleController;
  final TextEditingController explanationController;
  final TextEditingController neighborhoodVillageController;
  final TextEditingController neighborhoodNumber;
  final TextEditingController islandController;
  final TextEditingController parcelController;
  final TextEditingController titleDeedAreaController;
  final TextEditingController qualificationController;
  final TextEditingController groundTypeController;
  final TextEditingController sheetController;
  final TextEditingController locationController;
  final String plotsSelectStatusType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: GestureDetector(
        onTap: () {
          if (plotsModelService.formPlotsUpdateKey.currentState!.validate()) {
            routerService.plotsUpdateDialog(
              context,
              titleController,
              explanationController,
              neighborhoodVillageController,
              neighborhoodNumber,
              islandController,
              parcelController,
              titleDeedAreaController,
              qualificationController,
              groundTypeController,
              sheetController,
              locationController,
              plotsSelectStatusType,
              plotsModelService.dateTime.day,
              plotsModelService.dateTime.month,
              plotsModelService.dateTime.year,
              data,
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
              text: PlotsViewStrings.plotsUpdateButtonText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
