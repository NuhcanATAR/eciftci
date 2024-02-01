import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/logregpass_enum/register_enum/register_enum.dart';
import 'package:eciftci/product/utility/base/logregpass_base/register_base/register_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class RegisterAgreementCheckWidget extends StatefulWidget {
  const RegisterAgreementCheckWidget({super.key});

  @override
  State<RegisterAgreementCheckWidget> createState() =>
      _RegisterAgreementCheckWidgetState();
}

class _RegisterAgreementCheckWidgetState
    extends MainRegisterBase<RegisterAgreementCheckWidget> {
  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (state) {
        return Column(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Checkbox(
                    activeColor: MainAppColorConstant.mainColorBackground,
                    value: serviceModel.isAgreementCheck,
                    onChanged: (value) {
                      serviceModel.isAgreementCheck = value!;
                      state.didChange(value);
                    },
                  ),
                  Expanded(
                    child: LabelMediumBlackText(
                      text: RegisterViewStrings.agreementText.value,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                state.errorText ?? '',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          ],
        );
      },
      validator: (value) {
        if (!serviceModel.isAgreementCheck) {
          return RegisterViewStrings.agrementValidatorText.value;
        }
        return null;
      },
    );
  }
}
