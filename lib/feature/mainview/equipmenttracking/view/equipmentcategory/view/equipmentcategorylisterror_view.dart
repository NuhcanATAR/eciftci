import 'package:eciftci/product/constants/image_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/equipmenttracking_enum/equipmentcategory_enum/equipmentcategory_enum.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class EquipmentCategoryListErrorView extends StatelessWidget {
  const EquipmentCategoryListErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // image
          Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: AppEquipmentImgConstant.errorList.toImg),
          // title
          Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: BodyMediumBlackBoldText(
                text: EquipmentCategoryViewStrings
                    .categoryListErrorTitleText.value,
                textAlign: TextAlign.center,
              )),
          // sub title
          Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: LabelMediumBlackText(
                text: EquipmentCategoryViewStrings
                    .categoryListErrorSubTitleText.value,
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }
}
