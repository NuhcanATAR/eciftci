import 'package:flutter/material.dart';

class AgriculturalCalendarView extends StatefulWidget {
  const AgriculturalCalendarView({super.key});

  @override
  State<AgriculturalCalendarView> createState() =>
      _AgriculturalCalendarViewState();
}

class _AgriculturalCalendarViewState extends State<AgriculturalCalendarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarım Takvimi"),
      ),
    );
  }
}
