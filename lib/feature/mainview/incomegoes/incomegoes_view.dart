import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/goes_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/income_view.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class IncomeGoesView extends StatefulWidget {
  const IncomeGoesView({super.key});

  @override
  State<IncomeGoesView> createState() => _IncomeGoesViewState();
}

class _IncomeGoesViewState extends State<IncomeGoesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const LabelMediumMainColorText(
          text: "Geli & Gider",
          textAlign: TextAlign.center,
        ),
      ),
      body: ContainedTabBarView(
        tabs: const [
          LabelMediumMainColorText(
            text: "Gelir",
            textAlign: TextAlign.center,
          ),
          LabelMediumMainColorText(
            text: "Gider",
            textAlign: TextAlign.center,
          ),
        ],
        views: const [
          IncomeView(),
          GoesView(),
        ],
        tabBarProperties: TabBarProperties(
          indicatorColor: MainAppColorConstant.mainColorBackground,
        ),
      ),
    );
  }
}
