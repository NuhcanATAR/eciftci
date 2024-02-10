import 'package:eciftci/feature/mainview/eguide/view/usercreate/widget/companynameinput_widget.dart';
import 'package:eciftci/feature/mainview/eguide/view/usercreate/widget/explanationinput_widget.dart';
import 'package:eciftci/feature/mainview/eguide/view/usercreate/widget/namesurnmainput_widget.dart';
import 'package:eciftci/feature/mainview/eguide/view/usercreate/widget/phonenumberinput_widget.dart';
import 'package:eciftci/feature/mainview/eguide/view/usercreate/widget/savebutton_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/eguide_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/eguide_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/eguide_base/eguide_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class UserCreateView extends StatefulWidget {
  const UserCreateView({super.key});

  @override
  State<UserCreateView> createState() => _UserCreateViewState();
}

class _UserCreateViewState extends MainEGuideBase<UserCreateView> {
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
          text: "Kişi Oluştur",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<EGuideCubit, EGuideState>(
        listener: userAddListenerBloc,
        builder: (context, state) {
          return Form(
            key: modelService.formUserAddKey,
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
  Widget get buildNameSurnameInputsWidget => UserNameSurnameInputWidget(
        modelService: modelService,
      );

  // phone number input
  Widget get buildPhoneNumberInputWidget => UserPhoneNumberInputWidget(
        modelService: modelService,
      );

  // company name input
  Widget get buildCompanyNameInputWidget => UserCompanyNameInputWidget(
        modelService: modelService,
      );

  // explanation input
  Widget get buildExplanationInputWidget => UserExplanationInputWidget(
        modelService: modelService,
      );

  // save button
  Widget get buildSaveButtonWidget => UserSaveButtonWidget(
        modelService: modelService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
