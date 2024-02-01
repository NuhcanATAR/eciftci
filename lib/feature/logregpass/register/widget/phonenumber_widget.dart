import 'package:eciftci/product/enums/logregpass_enum/register_enum/register_enum.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class RegisterPhoneNumberWidget extends StatelessWidget {
  const RegisterPhoneNumberWidget({required this.serviceModel, super.key});

  final dynamic serviceModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: serviceModel.phoneNumberController,
        validator: serviceModel.phoneNumberValidator,
        style: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.black,
          ),
        ),
        decoration: InputDecoration(
          icon: const Icon(
            Icons.call_outlined,
            color: Colors.grey,
            size: 18,
          ),
          border: InputBorder.none,
          hintText: RegisterViewStrings.phoneNumberInputText.value,
          hintStyle: GoogleFonts.nunito(
            textStyle: context.general.textTheme.labelMedium?.copyWith(
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
