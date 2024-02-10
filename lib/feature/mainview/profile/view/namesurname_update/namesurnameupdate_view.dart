import 'package:eciftci/feature/mainview/profile/view/namesurname_update/widget/footerbutton_widget.dart';
import 'package:eciftci/feature/mainview/profile/view/namesurname_update/widget/nameinput_widget.dart';
import 'package:eciftci/feature/mainview/profile/view/namesurname_update/widget/surnameinput_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/profile_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/profile_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/profile_base/profile_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class ProfileNameSurnameUpdateView extends StatefulWidget {
  const ProfileNameSurnameUpdateView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<ProfileNameSurnameUpdateView> createState() =>
      _ProfileNameSurnameUpdateViewState();
}

class _ProfileNameSurnameUpdateViewState
    extends MainProfileBase<ProfileNameSurnameUpdateView> {
  late TextEditingController nameController = TextEditingController(
    text: widget.data['NAME'],
  );
  late TextEditingController surnameController = TextEditingController(
    text: widget.data['SURNAME'],
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
          text: "Ad Soyad Güncelle",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: profileNameSurnameUpdateListenerBloc,
        builder: (context, state) {
          return Form(
            key: modelService.formNameSurnameUpdateKey,
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
            // name ınput
            buildNameInputWidget,
            // surname ınput
            buildSurnameInputWidget,
          ],
        ),
      );

  // name input
  Widget get buildNameInputWidget => ProfileNameInputWidget(
        nameController: nameController,
        modelService: modelService,
      );

  // surname input
  Widget get buildSurnameInputWidget => ProfileSurnameInputWidget(
        surnameController: surnameController,
        modelService: modelService,
      );

  // footer button
  Widget get buildFooterButtonWidget => NameSurnameUpdateFooterButtonWidget(
        modelService: modelService,
        data: widget.data,
        nameController: nameController,
        surnameController: surnameController,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
