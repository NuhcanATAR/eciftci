import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class UserCompanyNameWidget extends StatelessWidget {
  const UserCompanyNameWidget({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: LabelMediumBlackText(
        text: "${data['COMPANYNAME']}",
        textAlign: TextAlign.center,
      ),
    );
  }
}
