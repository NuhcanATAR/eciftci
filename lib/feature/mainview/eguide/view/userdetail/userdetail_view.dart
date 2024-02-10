import 'package:eciftci/feature/mainview/eguide/view/userdetail/widget/callsmsbutton_widget.dart';
import 'package:eciftci/feature/mainview/eguide/view/userdetail/widget/communicationcard_widget.dart';
import 'package:eciftci/feature/mainview/eguide/view/userdetail/widget/companyname_widget.dart';
import 'package:eciftci/feature/mainview/eguide/view/userdetail/widget/namesurname_widget.dart';
import 'package:eciftci/feature/mainview/eguide/view/userdetail/widget/userdeletemenu_widget.dart';
import 'package:eciftci/feature/mainview/eguide/view/userdetail/widget/usereditmenu_widget.dart';
import 'package:eciftci/feature/mainview/eguide/view/userdetail/widget/usericon_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/eguide_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/eguide_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/eguide_base/eguide_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class UserDetailView extends StatefulWidget {
  const UserDetailView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<UserDetailView> createState() => _UserDetailViewState();
}

class _UserDetailViewState extends MainEGuideBase<UserDetailView> {
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
          text: "Kişi Detayı",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<EGuideCubit, EGuideState>(
        listener: userDeleteListenerBloc,
        builder: (context, state) {
          return Padding(
            padding: context.padding.low,
            child: ListView(
              children: <Widget>[
                // user ıcon
                buildUserIconWidget,
                // name surname
                buildNameSurnameWidget,
                // company name
                buildCompanyNameWidget,
                // call, sms button
                buildCallAndSmsButtonWidget,
                // communication card
                buildCommunicationCardWidget,
                // user edit
                buildUserEditMenuWidget,
                // user delete
                buildUserDeleteMenuWidget,
              ],
            ),
          );
        },
      ),
    );
  }

  // user ıcon
  Widget get buildUserIconWidget => UserIconWidget(
        dynamicHeight: dynamicHeight,
      );

  // name surname
  Widget get buildNameSurnameWidget => UserNameSurnameWidget(
        data: widget.data,
      );

  // company name
  Widget get buildCompanyNameWidget => UserCompanyNameWidget(
        data: widget.data,
      );

  // call, sms button
  Widget get buildCallAndSmsButtonWidget => UserCallAndSmsButtonWidget(
        data: widget.data,
        userPhoneNumberCall: userPhoneNumberCall,
        userSMSSendCall: userSMSSendCall,
      );

  // communication card
  Widget get buildCommunicationCardWidget => UserCommunicationCardWidget(
        data: widget.data,
        userPhoneNumberCall: userPhoneNumberCall,
        userSMSSendCall: userSMSSendCall,
        maxWidth: maxWidth,
      );

  // user edit
  Widget get buildUserEditMenuWidget => UserEditMenuWidget(
        data: widget.data,
        routerService: routerService,
      );

  // user delete
  Widget get buildUserDeleteMenuWidget => UserDeleteMenuWidget(
        data: widget.data,
        routerService: routerService,
      );
}
