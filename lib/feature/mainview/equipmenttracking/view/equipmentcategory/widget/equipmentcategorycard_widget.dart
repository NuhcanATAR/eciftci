import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class EquipmentCategoryCardWidget extends StatelessWidget {
  const EquipmentCategoryCardWidget(
      {required this.data, required this.routerService, super.key});

  final Map<String, dynamic> data;
  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        routerService.selectCategoryEquipemtnsListViewNavigatorRouter(
          context,
          data,
        );
      },
      child: Card(
        child: ListTile(
          title: LabelMediumBlackBoldText(
            text: data['CATEGORYNAME'],
            textAlign: TextAlign.left,
          ),
          trailing: GestureDetector(
            onTap: () {
              routerService.equipmentCategoryUpdateViewNavigatorRouter(
                context,
                data,
              );
            },
            child: Icon(
              Icons.edit_outlined,
              color: MainAppColorConstant.mainColorBackground,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
