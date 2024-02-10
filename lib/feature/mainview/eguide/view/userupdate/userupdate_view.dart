import 'package:eciftci/feature/mainview/eguide/view/userupdate/widget/companynameinput_widget.dart';
import 'package:eciftci/feature/mainview/eguide/view/userupdate/widget/explanationinput_widget.dart';
import 'package:eciftci/feature/mainview/eguide/view/userupdate/widget/namesurnameinput_widget.dart';
import 'package:eciftci/feature/mainview/eguide/view/userupdate/widget/phonenumberinput_widget.dart';
import 'package:eciftci/feature/mainview/eguide/view/userupdate/widget/updatebutton_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/eguide_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/eguide_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/eguide_base/eguide_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class UserUpdateView extends StatefulWidget {
  const UserUpdateView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<UserUpdateView> createState() => _UserUpdateViewState();
}

class _UserUpdateViewState extends MainEGuideBase<UserUpdateView> {
  late TextEditingController nameController = TextEditingController(
    text: widget.data['NAME'],
  );
  late TextEditingController surnameController = TextEditingController(
    text: widget.data['SURNAME'],
  );
  late TextEditingController phoneNumberController = TextEditingController(
    text: widget.data['PHONENUMBER'],
  );
  late TextEditingController companyNameController = TextEditingController(
    text: widget.data['COMPANYNAME'],
  );
  late TextEditingController explanationController = TextEditingController(
    text: widget.data['EXPLANATION'],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: MainAppColorConstant.mainColorBackground,
            size: 18,
          ),
        ),
        title: const LabelMediumMainColorText(
          text: "Kişiyi Güncelle",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<EGuideCubit, EGuideState>(
        listener: userUpdateListenerBloc,
        builder: (context, state) {
          return Form(
            key: modelService.formUserUpdateKey,
            child: Padding(
              padding: context.padding.low,
              child: ListView(
                children: <Widget>[
                  // name surnme inputs
                  buildNameSurnameInputsWidget,
                  // phone number input
                  buildPhoneNumberInputWidget,
                  // company name input
                  buildCompanyNameInputWidget,
                  // explanation input
                  buildExplanationInputWidget,
                  // save button
                  buildSaveButtonWidget,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // name surnme inputs
  Widget get buildNameSurnameInputsWidget => UserUpdateNameSurnameInputWidget(
        nameController: nameController,
        surnameController: surnameController,
        modelService: modelService,
      );

  // phone number input
  Widget get buildPhoneNumberInputWidget => UserUpdatePhoneNumberInputWidget(
        phoneNumberController: phoneNumberController,
        modelService: modelService,
      );

  // company name input
  Widget get buildCompanyNameInputWidget => UserUpdateCompanyNameInputWidget(
        companyNameController: companyNameController,
      );

  // explanation input
  Widget get buildExplanationInputWidget => UserUpdateExplanationInputWidget(
        explanationController: explanationController,
      );

  // save button
  Widget get buildSaveButtonWidget => UserUpdateButtonWidget(
        modelService: modelService,
        nameController: nameController,
        surnameController: surnameController,
        phoneNumberController: phoneNumberController,
        companyNameController: companyNameController,
        explanationController: explanationController,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        data: widget.data,
      );
}
