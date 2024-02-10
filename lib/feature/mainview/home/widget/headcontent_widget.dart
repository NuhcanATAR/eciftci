import 'package:eciftci/product/constants/color_constant.dart';
import 'package:flutter/material.dart';

class HomeHeadContentWidget extends StatelessWidget {
  const HomeHeadContentWidget(
      {required this.maxWidth, required this.dynamicHeight, super.key});

  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth,
      height: dynamicHeight(0.15),
      child: Container(
        decoration: BoxDecoration(
          color: MainAppColorConstant.mainColorBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
      ),
    );
  }
}
