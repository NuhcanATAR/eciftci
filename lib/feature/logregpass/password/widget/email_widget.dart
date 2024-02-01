import 'package:eciftci/product/enums/logregpass_enum/password_enum/password_enum.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class ResetPasswordEmailWidget extends StatelessWidget {
  const ResetPasswordEmailWidget({required this.serviceModel, super.key});

  final dynamic serviceModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: serviceModel.mailController,
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
          hintText: PasswordViewStrings.emailInputText.value,
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
