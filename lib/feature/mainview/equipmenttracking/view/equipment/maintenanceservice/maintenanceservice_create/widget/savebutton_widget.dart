import 'package:eciftci/product/bloc/mainview_bloc/mainequipment_bloc/maintenanceservice_bloc/cubit/cubit.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/equipmenttracking_enum/maintenanceservice_enum/maintenanceservice_enum.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaintenanceServiceSaveButtonWidget extends StatelessWidget {
  const MaintenanceServiceSaveButtonWidget(
      {required this.modelService,
      required this.maxWidth,
      required this.dynamicHeight,
      required this.data,
      super.key});

  final dynamic modelService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: GestureDetector(
        onTap: () {
          if (modelService.formServiceAddKey.currentState!.validate()) {
            BlocProvider.of<MaintenanceServiceCubit>(context)
                .maintenanceServiceAdd(
              modelService.selectedDate.day,
              modelService.selectedDate.month,
              modelService.selectedDate.year,
              modelService.maintenancePeriodController.text,
              modelService.companyNameController.text,
              modelService.companyPhoneNumberController.text,
              modelService.caregiverController.text,
              modelService.explanationController.text,
              modelService.completionStatusSelect.toString(),
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
              text: MaintenanceServiceViewStrings
                  .maintanencaServiceSaveButtonText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
