import 'package:eciftci/feature/logregpass/login/widget/titlesubtitle_widget.dart';
import 'package:eciftci/feature/logregpass/register/widget/agreementcheck_widget.dart';
import 'package:eciftci/feature/logregpass/register/widget/email_widget.dart';
import 'package:eciftci/feature/logregpass/register/widget/loginbutton_widget.dart';
import 'package:eciftci/feature/logregpass/register/widget/namesurname_widget.dart';
import 'package:eciftci/feature/logregpass/register/widget/password_widget.dart';
import 'package:eciftci/feature/logregpass/register/widget/phonenumber_widget.dart';
import 'package:eciftci/product/bloc/logregpass_bloc/register_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/logregpass_bloc/register_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/logregpass_enum/register_enum/register_enum.dart';
import 'package:eciftci/product/model/logregpass_model/register_model/register_model.dart';
import 'package:eciftci/product/utility/base/logregpass_base/register_base/register_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends MainRegisterBase<RegisterView> {
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
          text: "Kayıt Ol",
          textAlign: TextAlign.left,
        ),
      ),
      body: BlocConsumer<AuthSignUpCubit, AuthSignUpState>(
        listener: authSignUpListenerBloc,
        builder: (context, state) {
          return Form(
            key: serviceModel.formRegisterKey,
            child: Padding(
              padding: context.padding.normal,
              child: ListView(
                children: <Widget>[
                  // title & sub title
                  buildTitleSubTitleWidget,
                  // name surname widget
                  buildNameSurnameWidget,
                  // city district select
                  buildCityDistrictSelectWidget,
                  // email
                  buildEmailWidget,
                  // phone number
                  buildPhoneNumberWidget,
                  // password
                  buildPasswordWidget,
                  // agreement check
                  buildAgreementCheckWiget,
                  // register button
                  buildRegisterButtonWidget(context),
                  // login button
                  buildLoginButtonWidget,
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

  // name surname
  Widget get buildNameSurnameWidget => RegisterNameSurnameWidget(
        serviceModel: serviceModel,
      );

  // city district select
  Widget get buildCityDistrictSelectWidget => Column(
        children: <Widget>[
          // city
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<mainUserCity>(
                  validator: (value) => value == null ? "Zorunlu Alan *" : null,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  hint: LabelMediumGreyText(
                    text: RegisterViewStrings.cityInputText.value,
                    textAlign: TextAlign.left,
                  ),
                  icon: const Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 18,
                  ),
                  elevation: 16,
                  style: GoogleFonts.nunito(
                    textStyle:
                        Theme.of(context).textTheme.labelMedium!.copyWith(
                              color: Colors.black,
                            ),
                  ),
                  onChanged: (mainUserCity? value) {
                    setState(() {
                      selectCity = value;
                      selectDistrict = null;
                      selectDistrictList.clear();
                    });
                  },
                  items: cityList.map((mainUserCity city) {
                    return DropdownMenuItem(
                      value: city,
                      child: Text(city.cityName),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),

          // district control
          selectCity != null
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField<mainUserDistrict>(
                        validator: (value) =>
                            value == null ? "Zorunlu Alan *" : null,
                        isExpanded: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        hint: LabelMediumGreyText(
                          text: RegisterViewStrings.districtInputText.value,
                          textAlign: TextAlign.left,
                        ),
                        style: GoogleFonts.nunito(
                          textStyle:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                        icon: const Icon(
                          Icons.location_city,
                          color: Colors.grey,
                          size: 18,
                        ),
                        elevation: 16,
                        value: selectDistrict,
                        onChanged: (mainUserDistrict? value) {
                          setState(() {
                            selectDistrict = value;
                            selectDistrictList.clear();
                          });
                        },
                        items: selectCity!.subDistrictList
                            .map((mainUserDistrict district) {
                          return DropdownMenuItem(
                            value: district,
                            child: Text(district.districtName),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      );

  // email
  Widget get buildEmailWidget => RegisterEmailWidget(
        serviceModel: serviceModel,
      );

  // phone number
  Widget get buildPhoneNumberWidget => RegisterPhoneNumberWidget(
        serviceModel: serviceModel,
      );

  // password
  Widget get buildPasswordWidget => RegisterPasswordWidget(
        serviceModel: serviceModel,
      );

  // agreement check
  Widget get buildAgreementCheckWiget => const RegisterAgreementCheckWidget();

  // register button
  Widget buildRegisterButtonWidget(BuildContext context) => GestureDetector(
        onTap: () {
          if (serviceModel.formRegisterKey.currentState!.validate()) {
            BlocProvider.of<AuthSignUpCubit>(context).signUp(
              serviceModel.emailController.text,
              serviceModel.passwordController.text,
              serviceModel.nameController.text,
              serviceModel.surnameController.text,
              selectCity!.cityName.toString(),
              selectDistrict!.districtName.toString(),
              serviceModel.phoneNumberController.text,
              context,
            );
          }
        },
        child: SizedBox(
          width: maxWidth,
          height: dynamicHeight(0.07),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: MainAppColorConstant.mainColorBackground,
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: LabelMediumWhiteText(
              text: RegisterViewStrings.registerBtnText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );

  // login button
  Widget get buildLoginButtonWidget => LoginButtonWidget(
        routerService: routerService,
      );
}
