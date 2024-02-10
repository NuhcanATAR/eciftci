import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget(
      {required this.data,
      required this.routerService,
      required this.userPhoneNumberCall,
      super.key});

  final Map<String, dynamic> data;
  final dynamic routerService;
  final dynamic userPhoneNumberCall;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        routerService.userDetailViewNavigatorRouter(
          context,
          data,
        );
      },
      child: Card(
        child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.account_circle,
              color: MainAppColorConstant.mainColorBackground,
              size: 25,
            ),
          ),
          title: LabelMediumBlackText(
            text: "${data['NAME']} ${data['SURNAME']}",
            textAlign: TextAlign.left,
          ),
          subtitle: LabelMediumGreyText(
            text: "0 ${data['PHONENUMBER']}",
            textAlign: TextAlign.left,
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                userPhoneNumberCall(data['PHONENUMBER'].toString());
              },
              child: Icon(
                Icons.call,
                color: MainAppColorConstant.mainColorBackground,
                size: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
