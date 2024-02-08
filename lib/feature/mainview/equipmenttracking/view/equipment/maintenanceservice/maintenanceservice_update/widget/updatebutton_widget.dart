import 'package:eciftci/product/bloc/mainview_bloc/mainequipment_bloc/maintenanceservice_bloc/cubit/cubit.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/equipmenttracking_enum/maintenanceservice_enum/maintenanceservice_enum.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaintenanceServiceUpdateButtonWidget extends StatelessWidget {
  const MaintenanceServiceUpdateButtonWidget(
      {required this.modelService,
      required this.maxWidth,
      required this.dynamicHeight,
      required this.maintenancePeriodController,
      required this.companyNameController,
      required this.companyPhoneNumberController,
      required this.caregiverController,
      required this.explanationController,
      required this.completionStatusSelect,
      required this.data,
      super.key});

  final dynamic modelService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;
  final TextEditingController maintenancePeriodController;
  final TextEditingController companyNameController;
  final TextEditingController companyPhoneNumberController;
  final TextEditingController caregiverController;
  final TextEditingController explanationController;
  final String completionStatusSelect;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: GestureDetector(
        onTap: () {
          if (modelService.formServiceUpdateKey.currentState!.validate()) {
            BlocProvider.of<MaintenanceServiceCubit>(context)
                .maintenanceServiceUpdate(
              maintenancePeriodController.text,
              companyNameController.text,
              companyPhoneNumberController.text,
              caregiverController.text,
              explanationController.text,
              completionStatusSelect.toString(),
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
                  .maintenanceServiceUpdateButtonText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
