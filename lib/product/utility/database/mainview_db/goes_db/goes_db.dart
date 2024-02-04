// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/product/utility/service/firebase_service.dart';

enum GoesServiceDB {
  INCOMEGOESCATEGORYS,
  INCOMEGOES;

  Future<QuerySnapshot<Map<String, dynamic>>> get goesRefTable =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("GOES")
          .get();

  DocumentReference<Map<String, dynamic>> goesDeleteRef(
          Map<String, dynamic> data) =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("GOES")
          .doc(data['ID']);

  DocumentReference<Map<String, dynamic>> goesUpdateRef(
          Map<String, dynamic> data) =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("GOES")
          .doc(data['ID']);

  Future<QuerySnapshot<Map<String, dynamic>>> goesFilterRefTable(
          dynamic categoryID, int year) =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("GOES")
          .where("GOESCATEGORYID", isEqualTo: categoryID)
          .where("YEAR", isEqualTo: year)
          .get();

  CollectionReference get goesRef => FirebaseFirestore.instance
      .collection(name)
      .doc(FirebaseService().authID)
      .collection("GOES");

  Future<QuerySnapshot<Map<String, dynamic>>> get goesCategoryRefTable =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("GOESCATEGORY")
          .get();

  CollectionReference get goesCategoryRef => FirebaseFirestore.instance
      .collection(name)
      .doc(FirebaseService().authID)
      .collection("GOESCATEGORY");

  DocumentReference<Map<String, dynamic>> goesCategoryDocRef(
          Map<String, dynamic> data) =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("GOESCATEGORY")
          .doc(data['ID']);

  DocumentReference<Map<String, dynamic>> goesMainCategoryDocRef(
          Map<String, dynamic> data) =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("GOESCATEGORY")
          .doc(data['GOESCATEGORYID']);

  // list query parameter

  Stream<QuerySnapshot<Map<String, dynamic>>> get goesListTable =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("GOES")
          .orderBy("DATE", descending: true)
          .snapshots();

  Stream<QuerySnapshot> get goesCategoryListTable => FirebaseFirestore.instance
      .collection(name)
      .doc(FirebaseService().authID)
      .collection("GOESCATEGORY")
      .orderBy("DATE", descending: true)
      .snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> goesListFilterTable(
          dynamic categoryID, int year) =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("GOES")
          .where("GOESCATEGORYID", isEqualTo: categoryID)
          .where("YEAR", isEqualTo: year)
          .snapshots();
}
