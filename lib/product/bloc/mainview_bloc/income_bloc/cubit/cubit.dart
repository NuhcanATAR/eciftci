import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/product/bloc/mainview_bloc/income_bloc/state/state.dart';
import 'package:eciftci/product/utility/database/mainview_db/incomegoes_db/incomegoes_db.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class IncomeCubit extends Cubit<MainIncomeState> {
  IncomeCubit() : super(IncomeInitial());

  Future<void> incomeAdd(
      String title,
      String explanation,
      int value,
      dynamic selectMainCategory,
      dynamic day,
      dynamic month,
      dynamic year) async {
    try {
      await IncomeGoesServiceDB.INCOMEGOES.incomeRef.add({
        "ID": null,
        "INCOMECATEGORYID": selectMainCategory,
        "TITLE": title,
        "EXPLANATION": explanation,
        "VALUE": value,
        "DAY": day,
        "MONTH": month,
        "YEAR": year,
        "DATE": FieldValue.serverTimestamp(),
      }).then((value) {
        String docID = value.id;
        value.update({"ID": docID});
      });
      emit(IncomeAddSuccess());
    } catch (e) {
      emit(IncomeAddError('Gelir Kaydedilemedi, Tekrar Deneyiniz!'));
    }
  }

  Future<void> incomeDelete(Map<String, dynamic> data) async {
    try {
      await IncomeGoesServiceDB.INCOMEGOES.incomeDeleteRef(data).delete();
      emit(IncomeDeleteSuccess());
    } catch (e) {
      emit(IncomeDeleteError('Gelir Kaldırılamadı, Tekrar Deneyiniz!'));
    }
  }

  Future<void> incomeUpdate(
    Map<String, dynamic> data,
    String title,
    String explanation,
    int value,
    int day,
    int month,
    int year,
  ) async {
    try {
      await IncomeGoesServiceDB.INCOMEGOES.incomeUpdateRef(data).update({
        "TITLE": title,
        "EXPLANATION": explanation,
        "VALUE": value,
        "DAY": day,
        "MONTH": month,
        "YEAR": year,
      });

      emit(IncomeUpdateSuccess());
    } catch (e) {
      emit(IncomeUpdateError(
          'Gelir güncellenmedi, Lütfen daha sonra tekrar deneyiniz!'));
    }
  }
}
