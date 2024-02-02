import 'package:flutter/material.dart';

class PlotsView extends StatefulWidget {
  const PlotsView({super.key});

  @override
  State<PlotsView> createState() => _PlotsViewState();
}

class _PlotsViewState extends State<PlotsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Araziler"),
      ),
    );
  }
}
