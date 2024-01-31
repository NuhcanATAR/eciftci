import 'package:eciftci/product/constants/icon_constant.dart';
import 'package:flutter/material.dart';

class LoginLogoWidget extends StatelessWidget {
  const LoginLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 100, right: 100),
      child: AppIconConstant.appLogoWhite.toImg,
    );
  }
}
