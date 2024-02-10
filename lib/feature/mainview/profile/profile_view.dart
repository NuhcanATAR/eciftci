import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/feature/mainview/profile/widget/menulist_widget.dart';
import 'package:eciftci/feature/mainview/profile/widget/profilecard_widget.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/profile_base/profile_base.dart';
import 'package:eciftci/product/utility/database/mainview_db/profile_db/profile_db.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends MainProfileBase<ProfileView> {
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
          text: "Profil Sayfası",
          textAlign: TextAlign.center,
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: ProfileDB.USERS.userRef,
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const SizedBox();
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const SizedBox();
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Padding(
              padding: context.padding.low,
              child: ListView(
                children: <Widget>[
                  // profile card
                  buildProfileCardWidget,
                  // menu list
                  buildMenuListWidget(context, data),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  // profile card
  Widget get buildProfileCardWidget => ProfileCardWidget(
        maxWidth: maxWidth,
      );

  // menu list
  Widget buildMenuListWidget(BuildContext context, Map<String, dynamic> data) =>
      ProfileMenuListWidget(
        serviceRouter: serviceRouter,
        data: data,
      );
}
