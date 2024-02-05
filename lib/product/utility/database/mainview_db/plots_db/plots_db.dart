// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/product/utility/service/firebase_service.dart';

enum PlotsServiceDB {
  LANDPLOTS,
  LIST,
  NOTES;

  CollectionReference<Map<String, dynamic>> get plotsRef =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("LIST");

  Stream<QuerySnapshot> get plotsListQuery => FirebaseFirestore.instance
      .collection(name)
      .doc(FirebaseService().authID)
      .collection("LIST")
      .orderBy("DATE", descending: true)
      .snapshots();

  Stream<QuerySnapshot> plotsListFilterQuery(
    String status,
    int year,
  ) =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("LIST")
          .where("ACTIVE", isEqualTo: status == "Arazi Aktif" ? true : false)
          .where("YEAR", isEqualTo: year)
          .snapshots();
}
