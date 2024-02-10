import 'package:eciftci/feature/mainview/profile/view/phonenumber_update/widget/footerbutton_widget.dart';
import 'package:eciftci/feature/mainview/profile/view/phonenumber_update/widget/phonenumberinput_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/profile_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/profile_bloc/state/state.dart';
import 'package:eciftci/product/utility/base/mainview_base/profile_base/profile_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../../../product/constants/color_constant.dart';

class ProfilePhoneNumberUpdateView extends StatefulWidget {
  const ProfilePhoneNumberUpdateView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<ProfilePhoneNumberUpdateView> createState() =>
      _ProfilePhoneNumberUpdateViewState();
}

class _ProfilePhoneNumberUpdateViewState
    extends MainProfileBase<ProfilePhoneNumberUpdateView> {
  late TextEditingController phoneNumberController = TextEditingController(
    text: widget.data['PHONENUMBER'],
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
          text: "Telefon Numarası Güncelle",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: profilePhoneNumberUpdateListenerBloc,
        builder: (context, state) {
          return Form(
            key: modelService.formPhoneNumberUpdateKey,
            child: Padding(
              padding: context.padding.low,
              child: Column(
                children: <Widget>[
                  // main body
                  buildMainBodyWidget,
                  // footer button
                  buildFooterButtonWidget,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // main body
  Widget get buildMainBodyWidget => Expanded(
        child: ListView(
          children: <Widget>[
            // phone number ınput
            buildPhoneNumberInputWidget,
          ],
        ),
      );

  // phone number ınput
  Widget get buildPhoneNumberInputWidget => PhoneNumberInputWidget(
        phoneNumberController: phoneNumberController,
        modelService: modelService,
      );

  // footer button
  Widget get buildFooterButtonWidget => ProfilePhoneNumberUpdateButtonWidget(
        modelService: modelService,
        phoneNumberController: phoneNumberController,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
