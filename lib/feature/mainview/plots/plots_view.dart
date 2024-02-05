import 'package:eciftci/feature/mainview/plots/widget/plotslist_widget.dart';
import 'package:eciftci/feature/mainview/plots/widget/plotsstatuscards_widget.dart';
import 'package:eciftci/feature/mainview/plots/widget/searchfield_widget.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/plots_base/plots_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class PlotsView extends StatefulWidget {
  const PlotsView({super.key});

  @override
  State<PlotsView> createState() => _PlotsViewState();
}

class _PlotsViewState extends MainPlotsBase<PlotsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const LabelMediumMainColorText(
          text: "Arazilerim",
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: context.padding.low,
        child: ListView(
          children: <Widget>[
            // plots status widget
            buildPlotStatusWidget,
            // search & field
            buildSearchFieldWidget,
            // plots list
            buildPlotsListWidget,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        onPressed: () {
          routerService.plotsCreateViewNavigatorRouter(context);
        },
        child: const Icon(
          Icons.add_outlined,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  // plots status widget
  Widget get buildPlotStatusWidget => PlotsStatusCardsWidget(
        routerService: routerService,
        dynamicHeight: dynamicHeight,
        plotsModelService: plotsModelService,
      );

  // search & field
  Widget get buildSearchFieldWidget => PlotsSearchFieldWidget(
        routerService: routerService,
      );

  // plots list
  Widget get buildPlotsListWidget => PlotsSubListWidget(
        routerService: routerService,
      );
}
