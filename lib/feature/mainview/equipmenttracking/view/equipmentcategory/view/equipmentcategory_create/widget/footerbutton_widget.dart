import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/equipmenttracking_enum/equipmentcategory_enum/equipmentcategory_enum.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class EquipmentCategoryFooterButtonWidget extends StatelessWidget {
  const EquipmentCategoryFooterButtonWidget(
      {required this.maxWidth,
      required this.dynamicHeight,
      required this.modelCategoryService,
      required this.routerService,
      super.key});

  final dynamic maxWidth;
  final dynamic dynamicHeight;
  final dynamic modelCategoryService;
  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          if (modelCategoryService.formEquipmentCategoryAddKey.currentState!
              .validate()) {
            routerService.eqipmentCategoryCreateDialog(
              context,
              modelCategoryService.categoryNameController,
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
              text: EquipmentCategoryViewStrings.saveButtonText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
