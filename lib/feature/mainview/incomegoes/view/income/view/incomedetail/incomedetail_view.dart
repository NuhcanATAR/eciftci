import 'package:flutter/material.dart';

class IncomeDetailView extends StatefulWidget {
  const IncomeDetailView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<IncomeDetailView> createState() => _IncomeDetailViewState();
}

class _IncomeDetailViewState extends State<IncomeDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gelir Detayı"),
      ),
    );
  }
}
