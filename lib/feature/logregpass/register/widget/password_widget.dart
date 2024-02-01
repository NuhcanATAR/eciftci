import 'package:eciftci/product/enums/logregpass_enum/register_enum/register_enum.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class RegisterPasswordWidget extends StatefulWidget {
  const RegisterPasswordWidget({required this.serviceModel, super.key});

  final dynamic serviceModel;

  @override
  State<RegisterPasswordWidget> createState() => _RegisterPasswordWidgetState();
}

class _RegisterPasswordWidgetState extends State<RegisterPasswordWidget> {
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
        obscureText: widget.serviceModel.isPasswordHideStatus,
        controller: widget.serviceModel.passwordController,
        validator: widget.serviceModel.passwordValidator,
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
          hintText: RegisterViewStrings.passwordInputText.value,
          hintStyle: GoogleFonts.nunito(
            textStyle: context.general.textTheme.labelMedium?.copyWith(
              color: Colors.black54,
            ),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                widget.serviceModel.isPasswordHideStatus =
                    !widget.serviceModel.isPasswordHideStatus;
              });
            },
            icon: Icon(
              widget.serviceModel.isPasswordHideStatus
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
