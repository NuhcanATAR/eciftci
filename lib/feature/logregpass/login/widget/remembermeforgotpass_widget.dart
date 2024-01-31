import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/logregpass_enum/login_enum/login_enum.dart';
import 'package:eciftci/product/utility/base/logregpass_base/login_base/login_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class RememberMeForgotPasswordWidget extends StatefulWidget {
  const RememberMeForgotPasswordWidget({super.key});

  @override
  State<RememberMeForgotPasswordWidget> createState() =>
      _RememberMeForgotPasswordWidgetState();
}

class _RememberMeForgotPasswordWidgetState
    extends MainLoginBase<RememberMeForgotPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          // remember me
          Flexible(
            child: Row(
              children: <Widget>[
                Checkbox(
                  activeColor: MainAppColorConstant.mainColorBackground,
                  value: serviceModel.isRememberMeStatus,
                  onChanged: rememberMeOnChanged,
                ),
                LabelMediumBlackText(
                  text: LoginViewStrings.rememberMeText.value,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          // forgot password
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {
                  serviceRouter.forgotPasswordViewNavigatorRouter(context);
                },
                child: LabelMediumMainColorText(
                  text: LoginViewStrings.forgotPasswordBtnText.value,
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
