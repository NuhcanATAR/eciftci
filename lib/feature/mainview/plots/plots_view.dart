import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class PlotsView extends StatefulWidget {
  const PlotsView({super.key});

  @override
  State<PlotsView> createState() => _PlotsViewState();
}

class _PlotsViewState extends State<PlotsView> {
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
          children: <Widget>[],
        ),
      ),
    );
  }
}
