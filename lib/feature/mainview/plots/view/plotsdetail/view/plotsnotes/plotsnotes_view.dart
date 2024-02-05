import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/plots_base/plots_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class PlotsNotesView extends StatefulWidget {
  const PlotsNotesView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<PlotsNotesView> createState() => _PlotsNotesViewState();
}

class _PlotsNotesViewState extends MainPlotsBase<PlotsNotesView> {
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
          text: "Arazi Notları",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
