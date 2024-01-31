import 'package:eciftci/product/enums/logregpass_enum/login_enum/login_enum.dart';
import 'package:eciftci/product/utility/base/logregpass_base/login_base/login_base.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class LoginPasswordInputWidget extends StatefulWidget {
  const LoginPasswordInputWidget({super.key});

  @override
  State<LoginPasswordInputWidget> createState() =>
      _LoginPasswordInputWidgetState();
}

class _LoginPasswordInputWidgetState
    extends MainLoginBase<LoginPasswordInputWidget> {
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
        obscureText: serviceModel.isPasswordHideStatus,
        controller: serviceModel.passwordController,
        validator: serviceModel.passwordValidator,
        style: GoogleFonts.nunito(
          textStyle: context.general.textTheme.labelMedium?.copyWith(
            color: Colors.black,
          ),
        ),
        decoration: InputDecoration(
          icon: const Icon(
            Icons.password_outlined,
            color: Colors.grey,
            size: 18,
          ),
          border: InputBorder.none,
          hintText: LoginViewStrings.passwordText.value,
          hintStyle: GoogleFonts.nunito(
            textStyle: context.general.textTheme.labelMedium?.copyWith(
              color: Colors.black54,
            ),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                serviceModel.isPasswordHideStatus =
                    !serviceModel.isPasswordHideStatus;
              });
            },
            icon: Icon(
              serviceModel.isPasswordHideStatus
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: Colors.grey,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
