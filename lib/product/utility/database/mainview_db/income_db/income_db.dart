// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/product/utility/service/firebase_service.dart';

enum IncomeServiceDB {
  INCOMEGOESCATEGORYS,
  INCOMEGOES;

  Future<QuerySnapshot<Map<String, dynamic>>> get incomeRefTable =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("INCOME")
          .get();

  DocumentReference<Map<String, dynamic>> incomeDeleteRef(
          Map<String, dynamic> data) =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("INCOME")
          .doc(data['ID']);

  DocumentReference<Map<String, dynamic>> incomeUpdateRef(
          Map<String, dynamic> data) =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("INCOME")
          .doc(data['ID']);

  Future<QuerySnapshot<Map<String, dynamic>>> incomeFilterRefTable(
          dynamic categoryID, int year) =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("INCOME")
          .where("INCOMECATEGORYID", isEqualTo: categoryID)
          .where("YEAR", isEqualTo: year)
          .get();

  CollectionReference get incomeRef => FirebaseFirestore.instance
      .collection(name)
      .doc(FirebaseService().authID)
      .collection("INCOME");

  Future<QuerySnapshot<Map<String, dynamic>>> get incomeCategoryRefTable =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("INCOMECATEGORY")
          .get();

  CollectionReference get incomeCategoryRef => FirebaseFirestore.instance
      .collection(name)
      .doc(FirebaseService().authID)
      .collection("INCOMECATEGORY");

  DocumentReference<Map<String, dynamic>> incomeCategoryDocRef(
          Map<String, dynamic> data) =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("INCOMECATEGORY")
          .doc(data['ID']);

  DocumentReference<Map<String, dynamic>> incomeMainCategoryDocRef(
          Map<String, dynamic> data) =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("INCOMECATEGORY")
          .doc(data['INCOMECATEGORYID']);

  // list query parameter

  Stream<QuerySnapshot<Map<String, dynamic>>> get incomeListTable =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("INCOME")
          .orderBy("DATE", descending: true)
          .snapshots();

  Stream<QuerySnapshot> get incomeCategoryListTable =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("INCOMECATEGORY")
          .orderBy("DATE", descending: true)
          .snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> incomeListFilterTable(
          dynamic categoryID, int year) =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("INCOME")
          .where("INCOMECATEGORYID", isEqualTo: categoryID)
          .where("YEAR", isEqualTo: year)
          .snapshots();
}
