import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/feature/mainview/eguide/widget/usercard_widget.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/eguide_base/eguide_base.dart';
import 'package:eciftci/product/utility/database/mainview_db/eguide_db/eguide_db.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class EGuideView extends StatefulWidget {
  const EGuideView({super.key});

  @override
  State<EGuideView> createState() => _EGuideViewState();
}

class _EGuideViewState extends MainEGuideBase<EGuideView> {
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
          text: "E-Rehber",
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          routerService.userCreateViewNavigatorRouter(context);
        },
        backgroundColor: MainAppColorConstant.mainColorBackground,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 20,
        ),
      ),
      body: Column(
        children: <Widget>[
          // search widget
          buildSearchWidget,
          // user list
          buildUserListWidget,
        ],
      ),
    );
  }

  // search widget
  Widget get buildSearchWidget => Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: TextField(
          textAlign: TextAlign.left,
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.labelMedium?.copyWith(
              color: Colors.black54,
            ),
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
              size: 18,
            ),
            hintText: 'Kişi Arayın',
            hintStyle: GoogleFonts.nunito(
              textStyle: context.general.textTheme.labelMedium?.copyWith(
                color: Colors.grey,
              ),
            ),
          ),
          onChanged: (val) {
            setState(() {
              modelService.searchUser = val;
            });
          },
        ),
      );

  // user list
  Widget get buildUserListWidget => Expanded(
        flex: 3,
        child: StreamBuilder<QuerySnapshot>(
          stream: EGuideDB.EGUIDE.eguideListQuery,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox();
            }

            return SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Padding(
                padding: context.padding.low,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.docs[index].data()
                        as Map<String, dynamic>;

                    if (data['NAME'] != null &&
                        data['NAME'].toString().toLowerCase().startsWith(
                            modelService.searchUser.toLowerCase())) {
                      return UserCardWidget(
                        data: data,
                        routerService: routerService,
                        userPhoneNumberCall: userPhoneNumberCall,
                      );
                    }

                    return const Center();
                  },
                ),
              ),
            );
          },
        ),
      );
}
