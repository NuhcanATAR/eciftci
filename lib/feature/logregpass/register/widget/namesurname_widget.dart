import 'package:eciftci/product/enums/logregpass_enum/register_enum/register_enum.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class RegisterNameSurnameWidget extends StatelessWidget {
  const RegisterNameSurnameWidget({required this.serviceModel, super.key});

  final dynamic serviceModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: TextFormField(
                controller: serviceModel.nameController,
                validator: serviceModel.nameValidator,
                style: GoogleFonts.nunito(
                  textStyle: context.general.textTheme.labelMedium?.copyWith(
                    color: Colors.black,
                  ),
                ),
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.account_circle_outlined,
                    color: Colors.grey,
                    size: 18,
                  ),
                  border: InputBorder.none,
                  hintText: RegisterViewStrings.nameInputText.value,
                  hintStyle: GoogleFonts.nunito(
                    textStyle: context.general.textTheme.labelMedium?.copyWith(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: TextFormField(
                controller: serviceModel.surnameController,
                validator: serviceModel.surnameValidator,
                style: GoogleFonts.nunito(
                  textStyle: context.general.textTheme.labelMedium?.copyWith(
                    color: Colors.black,
                  ),
                ),
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.account_circle_outlined,
                    color: Colors.grey,
                    size: 18,
                  ),
                  border: InputBorder.none,
                  hintText: RegisterViewStrings.surnameInputText.value,
                  hintStyle: GoogleFonts.nunito(
                    textStyle: context.general.textTheme.labelMedium?.copyWith(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
