import 'package:eciftci/product/constants/color_constant.dart';
import 'package:flutter/material.dart';

class UserCallAndSmsButtonWidget extends StatelessWidget {
  const UserCallAndSmsButtonWidget(
      {required this.data,
      required this.userPhoneNumberCall,
      required this.userSMSSendCall,
      super.key});

  final Map<String, dynamic> data;
  final dynamic userPhoneNumberCall;
  final dynamic userSMSSendCall;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // call button
          buildCallButtonWidget,
          // sms button
          buildSmsButtonWidget,
        ],
      ),
    );
  }

  // call button
  Widget get buildCallButtonWidget => Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: GestureDetector(
          onTap: () {
            userPhoneNumberCall(data['PHONENUMBER']);
          },
          child: SizedBox(
            width: 50,
            height: 50,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(124),
                ),
              ),
              child: Icon(
                Icons.call,
                color: MainAppColorConstant.mainColorBackground,
                size: 18,
              ),
            ),
          ),
        ),
      );

  // sms button
  Widget get buildSmsButtonWidget => Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: GestureDetector(
          onTap: () {
            userSMSSendCall(data['PHONENUMBER']);
          },
          child: SizedBox(
            width: 50,
            height: 50,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(124),
                ),
              ),
              child: Icon(
                Icons.sms,
                color: MainAppColorConstant.mainColorBackground,
                size: 18,
              ),
            ),
          ),
        ),
      );
}
