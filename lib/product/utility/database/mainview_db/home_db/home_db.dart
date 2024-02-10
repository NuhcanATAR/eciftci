// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/product/utility/service/firebase_service.dart';

enum HomeDB {
  USERS,
  LANDPLOTS,
  INCOMEGOES;

  Future<DocumentSnapshot<Map<String, dynamic>>> get userRef =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .get();

  Future<QuerySnapshot<Map<String, dynamic>>> get plotsRef =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("LIST")
          .get();

  Future<QuerySnapshot<Map<String, dynamic>>> get goesRefTable =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("GOES")
          .get();

  Future<QuerySnapshot<Map<String, dynamic>>> get incomeRefTable =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("INCOME")
          .get();
}
