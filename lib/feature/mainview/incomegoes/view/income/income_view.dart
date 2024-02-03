// ignore_for_file: use_build_context_synchronously

import 'package:eciftci/feature/mainview/incomegoes/view/income/widget/createincomeandcategorybuttons_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/widget/incomelist_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/widget/incometotalcard_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/widget/searchfilter_widget.dart';
import 'package:eciftci/product/utility/base/mainview_base/income_base/mainincome_base.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class IncomeView extends StatefulWidget {
  const IncomeView({super.key});

  @override
  State<IncomeView> createState() => _IncomeViewState();
}

class _IncomeViewState extends MainIncomeBase<IncomeView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: ListView(
        children: <Widget>[
          // search & filter
          buildSearchFilterWidget,
          // total income card
          buildTotalIncomeCardWidget,
          // create income & create income category button
          buildCreateIncomeAndCreateIncomeCategoryButtonWidget,
          // income list
          buildIncomeListWidget,
        ],
      ),
    );
  }

  // search & filter
  Widget get buildSearchFilterWidget => IncomeSearchFilterWidget(
        routerService: routerService,
      );

  // total income card
  Widget get buildTotalIncomeCardWidget => IncomeTotalCardWidget(
        calculateTotalPrice: calculateTotalPrice,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );

  // create income & create income category button
  Widget get buildCreateIncomeAndCreateIncomeCategoryButtonWidget =>
      CreateIncomeAndCategoryButtonsWidget(
        routerService: routerService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );

  // income list
  Widget get buildIncomeListWidget => IncomeListWidget(
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        routerService: routerService,
      );
}
