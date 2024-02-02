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
      appBar: AppBar(
        title: const Text("Gelir Gider Sayfası"),
      ),
    );
  }
}
