import 'package:flutter/material.dart';

class CategoryEquipmentsListView extends StatefulWidget {
  const CategoryEquipmentsListView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<CategoryEquipmentsListView> createState() =>
      _CategoryEquipmentsListViewState();
}

class _CategoryEquipmentsListViewState
    extends State<CategoryEquipmentsListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("İlgli Kategoriye Bağlı Ekipmanlar"),
      ),
    );
  }
}
