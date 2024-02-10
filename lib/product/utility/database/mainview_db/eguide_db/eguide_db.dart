// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/product/utility/service/firebase_service.dart';

enum EGuideDB {
  EGUIDE;

  DocumentReference<Map<String, dynamic>> userRefTable(
          Map<String, dynamic> data) =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("LIST")
          .doc(data['ID']);

  CollectionReference get eguideRef => FirebaseFirestore.instance
      .collection(name)
      .doc(FirebaseService().authID)
      .collection("LIST");

  Stream<QuerySnapshot<Map<String, dynamic>>> get eguideListQuery =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("LIST")
          .snapshots();
}
