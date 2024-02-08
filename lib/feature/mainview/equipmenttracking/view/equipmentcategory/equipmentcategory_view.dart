import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class EquipmentCategoryView extends StatefulWidget {
  const EquipmentCategoryView({super.key});

  @override
  State<EquipmentCategoryView> createState() => _EquipmentCategoryViewState();
}

class _EquipmentCategoryViewState extends State<EquipmentCategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: MainAppColorConstant.mainColorBackground,
            size: 18,
          ),
        ),
        title: const LabelMediumMainColorText(
          text: "Ekipman Kategorileri",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
