import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:flutter/material.dart';

class UserNameSurnameWidget extends StatelessWidget {
  const UserNameSurnameWidget({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      child: BodyMediumBlackBoldText(
        text: "${data['NAME']} ${data['SURNAME']}",
        textAlign: TextAlign.center,
      ),
    );
  }
}
