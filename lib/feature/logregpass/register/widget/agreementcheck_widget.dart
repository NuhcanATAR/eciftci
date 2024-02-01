import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/logregpass_enum/register_enum/register_enum.dart';
import 'package:eciftci/product/utility/base/logregpass_base/register_base/register_base.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        RegisterViewStrings.agreementText.value,
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              state.errorText ?? '',
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
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
