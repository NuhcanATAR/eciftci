import 'package:eciftci/product/bloc/mainview_bloc/mainequipment_bloc/maintenanceservice_bloc/state/state.dart';
import 'package:eciftci/product/utility/database/mainview_db/equipmenttracking_db/equipmenttracking_db.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaintenanceServiceCubit extends Cubit<MaintenanceServiceState> {
  MaintenanceServiceCubit() : super(MaintenanceServiceInitial());

  Future<void> maintenanceServiceAdd(
    int day,
    int month,
    int year,
    String maintenancePeriod,
    String companyName,
    String phoneNumber,
    String caregiver,
    String explanation,
    String completionStatus,
    Map<String, dynamic> data,
  ) async {
    emit(MaintenanceServiceAddLoading());
    try {
      await EquipmentTrackingDB.EQUIPMENTTRACKING.maintenanceServiceRef.add({
        "ID": null,
        "EQUIPMENTID": data['ID'],
        "DAYCARE": day,
        "MONTHCARE": month,
        "YEARCARE": year,
        "MAINTENANCEPERIOD": maintenancePeriod,
        "COMPANYNAME": companyName,
        "PHONENUMBER": phoneNumber,
        "CAREGIVER": caregiver,
        "EXPLANATION": explanation,
        "COMPLETIONSTATUS": completionStatus,
      }).then((value) {
        String docID = value.id;
        value.update({"ID": docID});
      });

      emit(MaintenanceServiceAddSuccess());
    } catch (e) {
      emit(
          MaintenanceServiceAddError('Servis ve Bakım Bilgisi Güncellenmedi!'));
    }
  }

  Future<void> maintenanceServiceDelete(Map<String, dynamic> data) async {
    emit(MaintenanceServiceaDeleteLoading());

    try {
      await EquipmentTrackingDB.EQUIPMENTTRACKING.maintenanceServiceRef
          .doc(data['ID'])
          .delete();
      emit(MaintenanceServiceDeleteSuccess());
    } catch (e) {
      emit(MaintenanceServiceDeleteError('Servis Bilgisi Kaldırılmadı!'));
    }
  }

  Future<void> maintenanceServiceUpdate(
    String maintenancePeriod,
    String companyName,
    String phoneNumber,
    String caregiver,
    String explanation,
    String completionStatus,
    Map<String, dynamic> data,
  ) async {
    emit(MaintenanceServiceUpdateLoading());
    try {
      await EquipmentTrackingDB.EQUIPMENTTRACKING.maintenanceServiceRef
          .doc(data['ID'])
          .update({
        "MAINTENANCEPERIOD": maintenancePeriod,
        "COMPANYNAME": companyName,
        "PHONENUMBER": phoneNumber,
        "CAREGIVER": caregiver,
        "EXPLANATION": explanation,
        "COMPLETIONSTATUS": completionStatus,
      });

      emit(MaintenanceServiceUpdateSuccess());
    } catch (e) {
      emit(MaintenanceServiceUpdateError(
          'Servis ve Bakım Bilgisi Güncellenmedi!'));
    }
  }
}
