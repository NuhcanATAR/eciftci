import 'package:eciftci/product/enums/logregpass_enum/login_enum/login_enum.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class RegisterButtonWidget extends StatelessWidget {
  const RegisterButtonWidget({required this.serviceRouter, super.key});

  final dynamic serviceRouter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: LabelMediumBlackText(
              text: LoginViewStrings.registerText.value,
              textAlign: TextAlign.right,
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: GestureDetector(
                onTap: () {
                  serviceRouter.registerViewNavigatorRouter(context);
                },
                child: LabelMediumMainColorText(
                  text: LoginViewStrings.registerBtnText.value,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
