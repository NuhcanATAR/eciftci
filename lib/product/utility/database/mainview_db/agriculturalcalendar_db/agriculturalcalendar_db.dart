// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/product/utility/service/firebase_service.dart';

enum AgriculturalCalendarDB {
  AGRICULTURALCALENDAR;

  CollectionReference get agriculturalCalendarRef => FirebaseFirestore.instance
      .collection(name)
      .doc(FirebaseService().authID)
      .collection("EVENTLIST");
}
