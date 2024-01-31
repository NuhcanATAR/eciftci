import 'package:eciftci/product/constants/image_constant.dart';
import 'package:flutter/material.dart';

class BackImgWidget extends StatelessWidget {
  const BackImgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AppLogRegImgsConstant.backImg.toImg,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
