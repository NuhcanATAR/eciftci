import 'package:eciftci/product/enums/mainview_enum/maingoes_enum/goescategory_enum/goescategory_enum.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../product/constants/color_constant.dart';
import '../../../../../../../../product/widget/text_widget/label_medium_text.dart';

class CategorySavedButtonWidget extends StatelessWidget {
  const CategorySavedButtonWidget(
      {required this.goesCategoryModelService,
      required this.routerService,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final dynamic goesCategoryModelService;
  final dynamic routerService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          if (goesCategoryModelService.formGoesCategorySavedKey.currentState!
              .validate()) {
            routerService.categoryAddDialog(
                context, goesCategoryModelService.categoryNameController);
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
              text: GoesCategoryViewStrings.savedCategoryButton.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
