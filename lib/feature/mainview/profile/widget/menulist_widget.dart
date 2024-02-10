import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

import '../../../../product/enums/mainview_enum/profile_enum/profile_enum.dart';

class ProfileMenuListWidget extends StatelessWidget {
  const ProfileMenuListWidget(
      {required this.data, required this.serviceRouter, super.key});

  final dynamic serviceRouter;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // name surname edit menu
        buildNameSurnameEditMenuWidget(context, data),
        // email edit menu
        buildEmailEditMenuWidget(context),
        // city district edit menu
        buildCityDistrictEditMenuWidget(context),
        // phone number edit menu
        buildPhoneNumberEditMenuWidget(context, data),
        // account exit menu
        buildAccountExitMenuWidget(context),
      ],
    );
  }

  // name surname edit menu
  Widget buildNameSurnameEditMenuWidget(
          BuildContext context, Map<String, dynamic> data) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: GestureDetector(
          onTap: () {
            serviceRouter.profileNameSurnameUpdateViewNavigatorRouter(
                context, data);
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 15, top: 15),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.account_circle_outlined,
                    color: MainAppColorConstant.mainColorBackground,
                    size: 18,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: LabelMediumBlackText(
                        text: ProfileViewStrings.menuNameSurnameEditText.value,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: MainAppColorConstant.mainColorBackground,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  // email edit menu
  Widget buildEmailEditMenuWidget(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: GestureDetector(
          onTap: () {
            serviceRouter.profileEmailUpdateViewNavigatorRouter(context);
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 15, top: 15),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.mail_outline,
                    color: MainAppColorConstant.mainColorBackground,
                    size: 18,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: LabelMediumBlackText(
                        text: ProfileViewStrings.menuEmailEditText.value,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: MainAppColorConstant.mainColorBackground,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  // city district edit menu
  Widget buildCityDistrictEditMenuWidget(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: GestureDetector(
          onTap: () {
            serviceRouter.profileCityDistrictUpdateViewNavigatorRouter(context);
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 15, top: 15),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on_outlined,
                    color: MainAppColorConstant.mainColorBackground,
                    size: 18,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: LabelMediumBlackText(
                        text: ProfileViewStrings.menuCityDistrictEditText.value,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: MainAppColorConstant.mainColorBackground,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  // phone number edit menu
  Widget buildPhoneNumberEditMenuWidget(
          BuildContext context, Map<String, dynamic> data) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: GestureDetector(
          onTap: () {
            serviceRouter.profilePhoneNumberViewNavigatorRouter(context, data);
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 15, top: 15),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.call_outlined,
                    color: MainAppColorConstant.mainColorBackground,
                    size: 18,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: LabelMediumBlackText(
                        text: ProfileViewStrings.menuPhoneNumberEditText.value,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: MainAppColorConstant.mainColorBackground,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  // account exit menu
  Widget buildAccountExitMenuWidget(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: GestureDetector(
          onTap: () {
            serviceRouter.exitAccountDialog(context);
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 15, top: 15),
              child: Row(
                children: <Widget>[
                  const Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                    size: 18,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: LabelMediumRedText(
                        text: ProfileViewStrings.menuAccountExitText.value,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.red,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
