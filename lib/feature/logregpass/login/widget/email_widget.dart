import 'package:eciftci/product/enums/logregpass_enum/login_enum/login_enum.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class LoginEmailWidget extends StatelessWidget {
  const LoginEmailWidget({required this.serviceModel, super.key});

  final dynamic serviceModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
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
          hintText: LoginViewStrings.emailText.value,
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
