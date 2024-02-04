import 'package:eciftci/feature/mainview/incomegoes/view/goes/widget/creategoesandcategorybuttons_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/widget/goeslist_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/widget/goestotalcard_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/widget/searchfilter_widget.dart';
import 'package:eciftci/product/utility/base/mainview_base/maingose_base/goes_base/maingoes_base.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class GoesView extends StatefulWidget {
  const GoesView({super.key});

  @override
  State<GoesView> createState() => _GoesViewState();
}

class _GoesViewState extends MainGoesBase<GoesView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: ListView(
        children: <Widget>[
          // search & filter
          buildSearchFilterWidget,
          // total goes card
          buildTotalGoesCardWidget,
          // create goes & create goes category button
          buildCreateGoesAndCreateGoesCategoryButtonWidget,
          // goes list
          buildGoesListWidget,
        ],
      ),
    );
  }

  // search & filter
  Widget get buildSearchFilterWidget => GoesSearchFilterWidget(
        routerService: routerService,
      );

  // total goes card
  Widget get buildTotalGoesCardWidget => GoesTotalCardWidget(
        calculateTotalPrice: calculateTotalPrice,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );

  // create goes & create goes category button
  Widget get buildCreateGoesAndCreateGoesCategoryButtonWidget =>
      CreateGoesAndCategoryButtonsWidget(
        routerService: routerService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );

  // goes list
  Widget get buildGoesListWidget => GoesListWidget(
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        routerService: routerService,
      );
}
