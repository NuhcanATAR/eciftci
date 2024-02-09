// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/product/utility/service/firebase_service.dart';

enum EquipmentTrackingDB {
  EQUIPMENTTRACKING,
  EQUIPMENTCATEGORYS;

  Future<QuerySnapshot<Map<String, dynamic>>> get equipmentCategoryRef =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("CATEGORYS")
          .get();

  CollectionReference get equipmentCategoryRefTable =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("CATEGORYS");

  Future<DocumentSnapshot<Map<String, dynamic>>> equipmentCategoryIDRef(
          Map<String, dynamic> data) =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("CATEGORYS")
          .doc(data['EQUIPMENTCATEGORYID'])
          .get();

  CollectionReference get equipmentRef => FirebaseFirestore.instance
      .collection(name)
      .doc(FirebaseService().authID)
      .collection("LIST");

  CollectionReference get maintenanceServiceRef => FirebaseFirestore.instance
      .collection(name)
      .doc(FirebaseService().authID)
      .collection("MAINTENANCEANDSERVICES");

  Stream<QuerySnapshot> get equipmentCategoryList => FirebaseFirestore.instance
      .collection(name)
      .doc(FirebaseService().authID)
      .collection("CATEGORYS")
      .orderBy("DATE", descending: true)
      .snapshots();

  Stream<QuerySnapshot> get equipmentList => FirebaseFirestore.instance
      .collection(name)
      .doc(FirebaseService().authID)
      .collection("LIST")
      .orderBy("DATE", descending: true)
      .snapshots();

  Stream<QuerySnapshot> maintenanceServiceList(
          Map<String, dynamic> data, int year, String status) =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("MAINTENANCEANDSERVICES")
          .where("EQUIPMENTID", isEqualTo: data['ID'])
          .where("YEARCARE", isEqualTo: year)
          .where("COMPLETIONSTATUS", isEqualTo: status)
          .snapshots();

  Stream<QuerySnapshot> selectCategoryEquipmentList(
          Map<String, dynamic> data) =>
      FirebaseFirestore.instance
          .collection(name)
          .doc(FirebaseService().authID)
          .collection("LIST")
          .where("EQUIPMENTCATEGORYID", isEqualTo: data['ID'])
          .snapshots();
}
