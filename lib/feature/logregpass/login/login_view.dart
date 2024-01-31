import 'package:eciftci/feature/logregpass/login/widget/email_widget.dart';
import 'package:eciftci/feature/logregpass/login/widget/loginbutton_widget.dart';
import 'package:eciftci/feature/logregpass/login/widget/logo_widget.dart';
import 'package:eciftci/feature/logregpass/login/widget/password_widget.dart';
import 'package:eciftci/feature/logregpass/login/widget/registerbtn_widget.dart';
import 'package:eciftci/feature/logregpass/login/widget/remembermeforgotpass_widget.dart';
import 'package:eciftci/feature/logregpass/login/widget/titlesubtitle_widget.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/logregpass_base/login_base/login_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends MainLoginBase<LoginView> {
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
          text: "Giriş Yap",
          textAlign: TextAlign.left,
        ),
      ),
      body: Form(
        key: serviceModel.formLoginKey,
        child: Padding(
          padding: context.padding.low,
          child: ListView(
            children: <Widget>[
              // logo
              buildLogoWidget,
              // title & sub title
              buildTitleSubTitleWidget,
              // email
              buildEmailWidget,
              // password
              buildPasswordWidget,
              // remeber me & forgot password
              buildRememberMeForgotPasswordWidget,
              // login button
              buildLoginButtonWidget,
              // register button
              buildRegisterButtonWidget,
            ],
          ),
        ),
      ),
    );
  }

  // logo
  Widget get buildLogoWidget => const LoginLogoWidget();

  // title & sub title
  Widget get buildTitleSubTitleWidget => const TitleSubTitleWidget();

  // email
  Widget get buildEmailWidget => LoginEmailWidget(
        serviceModel: serviceModel,
      );

  // password
  Widget get buildPasswordWidget => const LoginPasswordInputWidget();

  // remeber me & forgot password
  Widget get buildRememberMeForgotPasswordWidget =>
      const RememberMeForgotPasswordWidget();

  // login button
  Widget get buildLoginButtonWidget => LoginButtonWidget(
        serviceModel: serviceModel,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );

  // register button
  Widget get buildRegisterButtonWidget => RegisterButtonWidget(
        serviceRouter: serviceRouter,
      );
}
