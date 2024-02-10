import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class NoficationsView extends StatefulWidget {
  const NoficationsView({super.key});

  @override
  State<NoficationsView> createState() => _NoficationsViewState();
}

class _NoficationsViewState extends State<NoficationsView> {
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
          text: "Uygulama Bildirimleri",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
