import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:table_calendar/table_calendar.dart';

class AgriculturalModelService {
  // form key
  final formEventAddKey = GlobalKey<FormState>();

  // controller
  TextEditingController explanation = TextEditingController();
  TextEditingController noteController = TextEditingController();

  // validator
  String? titleNoteValidator(String? titleVal) {
    if (titleVal == null || titleVal.isEmpty) {
      return "* Zorunlu Alan";
    } else {
      return null;
    }
  }

  // date time
  DateTime selectedDate = DateTime.now();
  DateTime focusedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;

  String selectedNote = '';
  String selectedExplanation = '';

  // logger
  dynamic logger = Logger();
}
