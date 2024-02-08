import 'package:eciftci/product/enums/mainview_enum/equipmenttracking_enum/maintenanceservice_enum/maintenanceservice_enum.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class MaintenanceServicePeriodInputWidget extends StatelessWidget {
  const MaintenanceServicePeriodInputWidget(
      {required this.modelService,
      required this.maintenancePeriodController,
      super.key});

  final dynamic modelService;
  final TextEditingController maintenancePeriodController;

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
        controller: maintenancePeriodController,
        validator: modelService.maintenancePeriodValidator,
        style: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.black,
          ),
        ),
        decoration: InputDecoration(
          labelText:
              MaintenanceServiceViewStrings.maintenancePeriodInputText.value,
          border: InputBorder.none,
          hintText:
              MaintenanceServiceViewStrings.maintenancePeriodInputText.value,
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
