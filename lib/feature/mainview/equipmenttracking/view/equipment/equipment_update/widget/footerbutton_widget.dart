import 'package:eciftci/product/bloc/mainview_bloc/mainequipment_bloc/equipment_bloc/cubit/cubit.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/equipmenttracking_enum/equipment_enum/equipment_enum.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EquipmentFooterUpdateButtonWidget extends StatelessWidget {
  const EquipmentFooterUpdateButtonWidget(
      {required this.data,
      required this.modelService,
      required this.titleController,
      required this.explanationController,
      required this.selectEquipmentStatus,
      required this.selectCity,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final Map<String, dynamic> data;
  final dynamic modelService;
  final TextEditingController titleController;
  final TextEditingController explanationController;
  final String selectEquipmentStatus;
  final String selectCity;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          if (modelService.formEquipmentTrackingUpdateKey.currentState!
              .validate()) {
            BlocProvider.of<EquipmentCubit>(context).equipmentUpdate(
              titleController.text,
              explanationController.text,
              selectEquipmentStatus,
              selectCity,
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
              text: EquipmentViewStrings.equipmentUpdateButtonText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
