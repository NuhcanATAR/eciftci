import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class UserCommunicationCardWidget extends StatelessWidget {
  const UserCommunicationCardWidget(
      {required this.data,
      required this.userPhoneNumberCall,
      required this.userSMSSendCall,
      required this.maxWidth,
      super.key});

  final Map<String, dynamic> data;
  final dynamic userPhoneNumberCall;
  final dynamic userSMSSendCall;
  final dynamic maxWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: Column(
            children: <Widget>[
              // phone number
              buildPhoneNumberWidget,
              // company name
              buildCompanyNameWidget,
              // explanation
              buildExplanationWidget,
            ],
          ),
        ),
      ),
    );
  }

  // phone number
  Widget get buildPhoneNumberWidget => Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          onTap: () {
            userPhoneNumberCall(data['PHONENUMBER']);
          },
          child: Row(
            children: <Widget>[
              Icon(
                Icons.call,
                color: MainAppColorConstant.mainColorBackground,
                size: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: maxWidth,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: LabelMediumBlackText(
                            text: "+90 ${data['PHONENUMBER']}",
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: maxWidth,
                        child: const Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: LabelMediumGreyText(
                            text: "Mobil",
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  userSMSSendCall(data['PHONENUMBER']);
                },
                child: const Icon(
                  Icons.sms_outlined,
                  color: Colors.black54,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      );

  // company name
  Widget get buildCompanyNameWidget => Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.store,
              color: MainAppColorConstant.mainColorBackground,
              size: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: SizedBox(
                  width: maxWidth,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: LabelMediumBlackText(
                      text: "${data['COMPANYNAME']}",
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  // explanation
  Widget get buildExplanationWidget => Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.text_fields,
              color: MainAppColorConstant.mainColorBackground,
              size: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: maxWidth,
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: LabelMediumBlackText(
                          text: "Açıklama",
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: maxWidth,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: LabelMediumBlackText(
                          text: "${data['EXPLANATION']}",
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
