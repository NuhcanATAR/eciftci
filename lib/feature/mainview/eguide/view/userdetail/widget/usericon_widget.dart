import 'package:eciftci/product/constants/icon_constant.dart';
import 'package:flutter/material.dart';

class UserIconWidget extends StatelessWidget {
  const UserIconWidget({required this.dynamicHeight, super.key});

  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: dynamicHeight(0.2),
        child: AppEGuideIconConstant.appUserIcon.toImg);
  }
}
