import 'package:eciftci/product/enums/logregpass_enum/register_enum/register_enum.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class RegisterEmailWidget extends StatelessWidget {
  const RegisterEmailWidget({required this.serviceModel, super.key});

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
        keyboardType: TextInputType.emailAddress,
        controller: serviceModel.emailController,
        validator: serviceModel.emailValidator,
        style: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.black,
          ),
        ),
        decoration: InputDecoration(
          icon: const Icon(
            Icons.mail_outline,
            color: Colors.grey,
            size: 18,
          ),
          border: InputBorder.none,
          hintText: RegisterViewStrings.emailInputText.value,
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
