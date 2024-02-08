import 'package:eciftci/product/enums/mainview_enum/equipmenttracking_enum/equipmentcategory_enum/equipmentcategory_enum.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class EquipmentCreateTitleSubTitleWidget extends StatelessWidget {
  const EquipmentCreateTitleSubTitleWidget({required this.maxWidth, super.key});

  final dynamic maxWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: <Widget>[
          // title
          SizedBox(
            width: maxWidth,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: BodyMediumBlackBoldText(
                text: EquipmentCategoryViewStrings.createTitleText.value,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          // sub title
          SizedBox(
            width: maxWidth,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: LabelMediumBlackText(
                text: EquipmentCategoryViewStrings.createSubTitleText.value,
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
