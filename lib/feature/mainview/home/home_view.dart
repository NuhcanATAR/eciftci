import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/feature/mainview/home/widget/eguidecard_widget.dart';
import 'package:eciftci/feature/mainview/home/widget/headcontent_widget.dart';
import 'package:eciftci/feature/mainview/home/widget/incomegoescards_widget.dart';
import 'package:eciftci/feature/mainview/home/widget/totalplotscard_widget.dart';
import 'package:eciftci/product/constants/icon_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/home_enum/home_enum.dart';
import 'package:eciftci/product/utility/base/mainview_base/home_base/home_base.dart';
import 'package:eciftci/product/utility/database/mainview_db/home_db/home_db.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends MainHomeBase<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                routerService.profileViewNavigatorRouter(context);
              },
              child: SizedBox(
                width: 45,
                height: 45,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: AppHomeIconConstant.appAccountIcon.toImg,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: maxWidth,
                      child: LabelMediumWhiteText(
                        text: HomeViewStrings.welcomeText.value,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    FutureBuilder<DocumentSnapshot>(
                      future: HomeDB.USERS.userRef,
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
                          return SizedBox(
                            width: maxWidth,
                            child: GestureDetector(
                              onTap: () {
                                routerService
                                    .profileViewNavigatorRouter(context);
                              },
                              child: LabelMediumWhiteBoldText(
                                text: "${data['NAME']} ${data['SURNAME']}",
                                textAlign: TextAlign.left,
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              routerService.applicationNoficationsViewNavigatorRouter(context);
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.notifications,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // head content
            buildHeadContentWidget,
            // total plots card
            buildTotalPlotsCardWidget,
            // income and goes cards
            buildIncomeAndGoesCardsWidget,
            // e-guide card
            buildEGuideCardWidget,
          ],
        ),
      ),
    );
  }

  // head content
  Widget get buildHeadContentWidget => HomeHeadContentWidget(
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );

  // total plots card
  Widget get buildTotalPlotsCardWidget => HomeTotalPlotsCardWidget(
        modelService: modelService,
        routerService: routerService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );

  // income and goes cards
  Widget get buildIncomeAndGoesCardsWidget => HomeIncomeGoesCardsWidget(
        calculateGoesTotalPrice: calculateGoesTotalPrice,
        calculateIncomeTotalPrice: calculateIncomeTotalPrice,
        routerService: routerService,
      );

  // e-guide card
  Widget get buildEGuideCardWidget => EGuideCardWidget(
        routerService: routerService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
