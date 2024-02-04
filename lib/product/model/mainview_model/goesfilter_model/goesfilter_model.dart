import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class MainGoesCategory {
  final String id;
  final String categoryName;

  MainGoesCategory({required this.id, required this.categoryName});

  factory MainGoesCategory.fromSnapshot(DocumentSnapshot snapshot) {
    return MainGoesCategory(
      id: snapshot.id,
      categoryName: snapshot['CATEGORYNAME'],
    );
  }
}

class GoesFilterModelService {
  List<int> years = List.generate(10, (index) => 2024 + index);
  int selectedYear = DateTime.now().year;

  dynamic logger = Logger();
}
