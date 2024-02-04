import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainincome_bloc/incomecategory_bloc/state/state.dart';
import 'package:eciftci/product/utility/database/mainview_db/income_db/income_db.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomeCategoryCubit extends Cubit<MainIncomeCategoryState> {
  IncomeCategoryCubit() : super(IncomeCategoryInitialState());

  Future<void> incomeCategoryAdd(String categoryName) async {
    try {
      await IncomeServiceDB.INCOMEGOESCATEGORYS.incomeCategoryRef.add({
        "ID": null,
        "CATEGORYNAME": categoryName,
        "DATE": FieldValue.serverTimestamp(),
      }).then((value) {
        String docID = value.id;
        value.update({"ID": docID});
      });

      emit(IncomeCategorySaveSuccess());
    } catch (e) {
      emit(
        IncomeCategorySaveError('Kategori Kaydedilmedi, Tekrar Deneyiniz.'),
      );
    }
  }

  Future<void> incomeCategoryUpdate(
      String categoryName, Map<String, dynamic> data) async {
    try {
      await IncomeServiceDB.INCOMEGOESCATEGORYS
          .incomeCategoryDocRef(data)
          .update({
        "CATEGORYNAME": categoryName,
      });

      emit(IncomeCategoryUpdateSuccess());
    } catch (e) {
      emit(IncomeCategoryUpdateError(
          'Güncelleme Başarısızı, Tekrar Deneyiniz!'));
    }
  }
}
