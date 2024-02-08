import 'package:flutter/material.dart';

class EquipmentCategoryUpdateView extends StatefulWidget {
  const EquipmentCategoryUpdateView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<EquipmentCategoryUpdateView> createState() =>
      _EquipmentCategoryUpdateViewState();
}

class _EquipmentCategoryUpdateViewState
    extends State<EquipmentCategoryUpdateView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ekipman Kategori Güncelleme"),
      ),
    );
  }
}
