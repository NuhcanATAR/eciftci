import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class GoesView extends StatefulWidget {
  const GoesView({super.key});

  @override
  State<GoesView> createState() => _GoesViewState();
}

class _GoesViewState extends State<GoesView> {
  @override
  Widget build(BuildContext context) {
    return const LabelMediumMainColorText(
        text: "Giderler", textAlign: TextAlign.center);
  }
}
