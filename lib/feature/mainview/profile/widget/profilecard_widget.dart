import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/constants/icon_constant.dart';
import 'package:eciftci/product/utility/database/mainview_db/profile_db/profile_db.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({required this.maxWidth, super.key});

  final dynamic maxWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        children: <Widget>[
          // profile img
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: AppHomeIconConstant.appAccountIcon.toImg),
          ),
          // profile name, surname, email
          Expanded(
            flex: 3,
            child: FutureBuilder<DocumentSnapshot>(
              future: ProfileDB.USERS.userRef,
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const SizedBox();
                }

                if (snapshot.hasData && !snapshot.data!.exists) {
                  return const SizedBox();
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // name surname
                      SizedBox(
                        width: maxWidth,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: LabelMediumBlackBoldText(
                            text: "${data['NAME']} ${data['SURNAME']}",
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      // location
                      SizedBox(
                        width: maxWidth,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on_outlined,
                                color: MainAppColorConstant.mainColorBackground,
                                size: 18,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: LabelMediumBlackText(
                                    text:
                                        "${data['CITY']} / ${data['DISTRICT']}",
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // email
                      SizedBox(
                        width: maxWidth,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.mail_outline,
                                color: MainAppColorConstant.mainColorBackground,
                                size: 18,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: LabelMediumBlackText(
                                    text: "${data['EMAIL']}",
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
