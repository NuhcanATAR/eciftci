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
            // plots active status widget
            buildPlotsActiveStatusWidget,
            // search & field
            buildSearchFieldWidget,
            // plots list
            buildPlotsListWidget,
          ],
        ),
      ),
    );
  }

  // plots active status widget
  Widget get buildPlotsActiveStatusWidget => const SizedBox();

  // search & field
  Widget get buildSearchFieldWidget => const SizedBox();

  // plots list
  Widget get buildPlotsListWidget => const SizedBox();
}
