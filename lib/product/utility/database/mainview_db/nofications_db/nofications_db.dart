// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

enum NoficationsDB {
  NOFICATIONS;

  Stream<QuerySnapshot> get noficationsListQuery =>
      FirebaseFirestore.instance.collection(name).snapshots();
}
