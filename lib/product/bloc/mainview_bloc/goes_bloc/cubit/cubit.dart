import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/product/bloc/mainview_bloc/goes_bloc/state/state.dart';
import 'package:eciftci/product/utility/database/mainview_db/goes_db/goes_db.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class GoesCubit extends Cubit<MainGoesState> {
  GoesCubit() : super(GoesInitial());

  Future<void> incomeAdd(
      String title,
      String explanation,
      int value,
      dynamic selectMainCategory,
      dynamic day,
      dynamic month,
      dynamic year) async {
    try {
      await GoesServiceDB.INCOMEGOES.goesRef.add({
        "ID": null,
        "GOESCATEGORYID": selectMainCategory,
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
      emit(GoesAddSuccess());
    } catch (e) {
      emit(GoesAddError('Gider Kaydedilemedi, Tekrar Deneyiniz!'));
    }
  }

  Future<void> incomeDelete(Map<String, dynamic> data) async {
    try {
      await GoesServiceDB.INCOMEGOES.goesDeleteRef(data).delete();
      emit(GoesDeleteSuccess());
    } catch (e) {
      emit(GoesDeleteError('Gider Kaldırılamadı, Tekrar Deneyiniz!'));
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
      await GoesServiceDB.INCOMEGOES.goesUpdateRef(data).update({
        "TITLE": title,
        "EXPLANATION": explanation,
        "VALUE": value,
        "DAY": day,
        "MONTH": month,
        "YEAR": year,
      });

      emit(GoesUpdateSuccess());
    } catch (e) {
      emit(GoesUpdateError(
          'Gider güncellenmedi, Lütfen daha sonra tekrar deneyiniz!'));
    }
  }
}
