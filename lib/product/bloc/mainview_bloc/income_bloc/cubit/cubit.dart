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
}
