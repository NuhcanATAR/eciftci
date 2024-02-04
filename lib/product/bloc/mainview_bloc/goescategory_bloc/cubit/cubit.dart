import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/product/bloc/mainview_bloc/goescategory_bloc/state/state.dart';
import 'package:eciftci/product/utility/database/mainview_db/goes_db/goes_db.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoesCategoryCubit extends Cubit<MainGoesCategoryState> {
  GoesCategoryCubit() : super(GoesCategoryInitialState());

  Future<void> incomeCategoryAdd(String categoryName) async {
    try {
      await GoesServiceDB.INCOMEGOESCATEGORYS.goesCategoryRef.add({
        "ID": null,
        "CATEGORYNAME": categoryName,
        "DATE": FieldValue.serverTimestamp(),
      }).then((value) {
        String docID = value.id;
        value.update({"ID": docID});
      });

      emit(GoesCategorySaveSuccess());
    } catch (e) {
      emit(
        GoesCategorySaveError('Kategori Kaydedilmedi, Tekrar Deneyiniz.'),
      );
    }
  }

  Future<void> incomeCategoryUpdate(
      String categoryName, Map<String, dynamic> data) async {
    try {
      await GoesServiceDB.INCOMEGOESCATEGORYS.goesCategoryDocRef(data).update({
        "CATEGORYNAME": categoryName,
      });

      emit(GoesCategoryUpdateSuccess());
    } catch (e) {
      emit(GoesCategoryUpdateError('Güncelleme Başarısızı, Tekrar Deneyiniz!'));
    }
  }
}
