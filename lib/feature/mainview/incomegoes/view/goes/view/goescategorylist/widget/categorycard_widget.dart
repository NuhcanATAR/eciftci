import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class GoesCategoryCardWidget extends StatelessWidget {
  const GoesCategoryCardWidget(
      {required this.data, required this.routerService, super.key});

  final Map<String, dynamic> data;
  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: LabelMediumBlackText(
        text: data['CATEGORYNAME'],
        textAlign: TextAlign.left,
      ),
      trailing: GestureDetector(
        onTap: () {
          routerService.categoryUpdateViewNavigatorRouter(context, data);
        },
        child: Icon(
          Icons.edit,
          color: MainAppColorConstant.mainColorBackground,
          size: 18,
        ),
      ),
    );
  }
}
