import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainequipment_bloc/equipmentcategory_bloc/state/state.dart';
import 'package:eciftci/product/utility/database/mainview_db/equipmenttracking_db/equipmenttracking_db.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EquipmentCategoryCubit extends Cubit<EquipmentCategoryState> {
  EquipmentCategoryCubit() : super(EquipmentCategoryInitial());

  Future<void> equiptmentCategorySave(
    String categoryName,
  ) async {
    emit(EquipmentCategorySaveLoading());

    try {
      await EquipmentTrackingDB.EQUIPMENTCATEGORYS.equipmentCategoryRefTable
          .add({
        "ID": null,
        "CATEGORYNAME": categoryName,
        "DATE": FieldValue.serverTimestamp(),
      }).then((value) {
        String docID = value.id;
        value.update({"ID": docID});
      });

      emit(EquipmentCategorySaveSuccess());
    } catch (e) {
      emit(EquipmentCategorySaveError(
          'Kategoriniz Kaydedilmedi, daha sonra tekrar deneyiniz.'));
    }
  }

  Future<void> equiptmentCategoryUpdate(
    String categoryName,
    Map<String, dynamic> data,
  ) async {
    emit(EquipmentCategoryUpdateLoading());

    try {
      await EquipmentTrackingDB.EQUIPMENTCATEGORYS.equipmentCategoryRefTable
          .doc(data['ID'])
          .update({
        "CATEGORYNAME": categoryName,
      });

      emit(EquipmentCategoryUpdateSuccess());
    } catch (e) {
      emit(EquipmentCategoryUpdateError(
          'Kategoriniz Güncellenmedi, daha sonra tekrar deneyiniz.'));
    }
  }
}
