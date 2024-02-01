import 'package:eciftci/feature/logregpass/password/widget/email_widget.dart';
import 'package:eciftci/feature/logregpass/password/widget/resetbtn_wiget.dart';
import 'package:eciftci/feature/logregpass/password/widget/titlesubtitle_widget.dart';
import 'package:eciftci/product/bloc/logregpass_bloc/password_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/logregpass_bloc/password_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/logregpass_base/password_base/password_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class PasswordView extends StatefulWidget {
  const PasswordView({super.key});

  @override
  State<PasswordView> createState() => _PasswordViewState();
}

class _PasswordViewState extends MainPasswordBase<PasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
        centerTitle: true,
        title: const LabelMediumMainColorText(
          text: "Şifremi Unuttum",
          textAlign: TextAlign.left,
        ),
      ),
      body: BlocConsumer<MainAuthPasswordCubit, AuthPasswordState>(
        listener: authResetPasswordListenerBloc,
        builder: (context, state) {
          return Form(
            key: serviceModel.formResetPasswordKey,
            child: Padding(
              padding: context.padding.low,
              child: ListView(
                children: <Widget>[
                  // title & sub title
                  buildTitleSubTitleWidget,
                  // email
                  buildEmailWidget,

                  // reset button
                  buildResetButtonWidget,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // title & sub title
  Widget get buildTitleSubTitleWidget => const TitleSubTitleWidget();

  // email
  Widget get buildEmailWidget => ResetPasswordEmailWidget(
        serviceModel: serviceModel,
      );

  // reset button
  Widget get buildResetButtonWidget => ResetPasswordButtonWidget(
        serviceModel: serviceModel,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
