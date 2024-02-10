import 'package:eciftci/product/enums/mainview_enum/eguide_enum/eguide_enum.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class UserUpdateNameSurnameInputWidget extends StatelessWidget {
  const UserUpdateNameSurnameInputWidget(
      {required this.nameController,
      required this.surnameController,
      required this.modelService,
      super.key});

  final TextEditingController nameController;
  final TextEditingController surnameController;
  final dynamic modelService;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // name
        buildNameInputWidget(context, context.general),
        // surname
        buildSurnameInputWidget(context, context.general),
      ],
    );
  }

  // name
  Widget buildNameInputWidget(BuildContext context, dynamic contextgeneral) =>
      Flexible(
        fit: FlexFit.tight,
        flex: 1,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10, right: 10),
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: TextFormField(
            controller: nameController,
            validator: modelService.nameValidator,
            style: GoogleFonts.nunito(
              textStyle: contextgeneral.textTheme.labelMedium?.copyWith(
                color: Colors.black,
              ),
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: EGuideViewStrings.nameInputText.value,
              hintStyle: GoogleFonts.nunito(
                textStyle: contextgeneral.textTheme.labelMedium?.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      );

  // surname
  Widget buildSurnameInputWidget(
          BuildContext context, dynamic contextgeneral) =>
      Flexible(
        fit: FlexFit.tight,
        flex: 1,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10, left: 10),
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: TextFormField(
            controller: surnameController,
            validator: modelService.surnameValidator,
            style: GoogleFonts.nunito(
              textStyle: contextgeneral.textTheme.labelMedium?.copyWith(
                color: Colors.black,
              ),
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: EGuideViewStrings.surnameInputText.value,
              hintStyle: GoogleFonts.nunito(
                textStyle: contextgeneral.textTheme.labelMedium?.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      );
}
