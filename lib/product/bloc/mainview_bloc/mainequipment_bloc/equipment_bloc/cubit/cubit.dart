import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainequipment_bloc/equipment_bloc/state/state.dart';
import 'package:eciftci/product/utility/database/mainview_db/equipmenttracking_db/equipmenttracking_db.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EquipmentCubit extends Cubit<EquipmentState> {
  EquipmentCubit() : super(EquipmentInitial());

  Future<void> equipmentAdd(
    String categoryID,
    String title,
    String explanation,
    String status,
    String city,
  ) async {
    emit(EquipmentSaveLoading());
    try {
      await EquipmentTrackingDB.EQUIPMENTTRACKING.equipmentRef.add({
        "ID": null,
        "EQUIPMENTCATEGORYID": categoryID,
        "TITLE": title,
        "EXPLANATION": explanation,
        "STATUS": status,
        "LOCATION": city,
        "DATE": FieldValue.serverTimestamp(),
      }).then((value) {
        String docID = value.id;
        value.update({"ID": docID});
      });
      emit(EquipmentSaveSuccess());
    } catch (e) {
      emit(EquipmentSaveError(
          'Ekipman Kaydedilmedi, daha sonra tekrar deneyiniz.'));
    }
  }

  Future<void> equipmentDelete(Map<String, dynamic> data) async {
    emit(EquipmentDeleteLoading());

    try {
      await EquipmentTrackingDB.EQUIPMENTTRACKING.equipmentRef
          .doc(data['ID'])
          .delete();
      emit(EquipmentDeleteSuccess());
    } catch (e) {
      emit(EquipmentDeleteError(
          'Ekipman Kaldırlamadı, Lütfen daha sonra tekrar deneyiniz.'));
    }
  }

  Future<void> equipmentUpdate(
    String title,
    String explanation,
    String status,
    String city,
    Map<String, dynamic> data,
  ) async {
    emit(EquipmentUpdateLoading());
    try {
      await EquipmentTrackingDB.EQUIPMENTTRACKING.equipmentRef
          .doc(data['ID'])
          .update({
        "TITLE": title,
        "EXPLANATION": explanation,
        "STATUS": status,
        "LOCATION": city,
      });
      emit(EquipmentUpdateSuccess());
    } catch (e) {
      emit(EquipmentUpdateError(
          'Ekipman Güncellenmedi, daha sonra tekrar deneyiniz.'));
    }
  }
}
