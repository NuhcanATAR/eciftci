import 'package:cloud_firestore/cloud_firestore.dart';

class MainIncomeCategory {
  final String id;
  final String categoryName;

  MainIncomeCategory({required this.id, required this.categoryName});

  factory MainIncomeCategory.fromSnapshot(DocumentSnapshot snapshot) {
    return MainIncomeCategory(
      id: snapshot.id,
      categoryName: snapshot['CATEGORYNAME'],
    );
  }
}

class IncomeFilterModelService {
  List<int> years = List.generate(10, (index) => 2024 + index);
  int selectedYear = DateTime.now().year;
}
