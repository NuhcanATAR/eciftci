// ignore_for_file: use_build_context_synchronously

import 'package:eciftci/feature/logregpass/login/login_view.dart';
import 'package:eciftci/feature/mainview/connectionerror/connectionerror_view.dart';
import 'package:eciftci/feature/mainview/profile/view/citydistrict_update/citydistrictupdate_view.dart';
import 'package:eciftci/feature/mainview/profile/view/email_update/emailupdate_view.dart';
import 'package:eciftci/feature/mainview/profile/view/namesurname_update/namesurnameupdate_view.dart';
import 'package:eciftci/feature/mainview/profile/view/phonenumber_update/phonenumberupdate_view.dart';
import 'package:eciftci/product/enums/mainview_enum/profile_enum/profile_enum.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileServiceRouter {
  // connection error view
  void connectionErrorViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ConnectionErrorView(),
      ),
    );
  }

  // name surname update view
  void profileNameSurnameUpdateViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileNameSurnameUpdateView(
          data: data,
        ),
      ),
    );
  }

  // email update view
  void profileEmailUpdateViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfileEmailUpdateView(),
      ),
    );
  }

  // city district update view
  void profileCityDistrictUpdateViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfileCityDistrictUpdateView(),
      ),
    );
  }

  // phone number update view
  void profilePhoneNumberViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePhoneNumberUpdateView(
          data: data,
        ),
      ),
    );
  }

  // exit account dialog
  void exitAccountDialog(BuildContext context) {
    var alertDialog = AlertDialog(
      title: LabelMediumBlackBoldText(
        text: ProfileViewStrings.exitDialogTitleText.value,
        textAlign: TextAlign.center,
      ),
      content: LabelMediumBlackText(
        text: ProfileViewStrings.exitDialogSubTitleText.value,
        textAlign: TextAlign.center,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const LabelMediumGreyText(
                      text: "Vazgeç",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setBool("remember_me", false);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ),
                          (Route<dynamic> route) => false);
                    },
                    child: const LabelMediumRedText(
                      text: "Çıkış Yap",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }
}
