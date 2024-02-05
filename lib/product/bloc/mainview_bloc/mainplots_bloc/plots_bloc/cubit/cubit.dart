import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainplots_bloc/plots_bloc/state/state.dart';
import 'package:eciftci/product/utility/database/mainview_db/plots_db/plots_db.dart';
import 'package:eciftci/product/utility/service/firebase_service.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class PlotsCubit extends Cubit<PlotsState> {
  PlotsCubit() : super(PlotsInitial());

  Future<void> plotsAdd(
    String plotsTitle,
    String plotsExplanation,
    String city,
    String district,
    String neighborhoodVillage,
    String neighborhoodNumber,
    String island,
    String parcel,
    String titleDeedArea,
    String qalification,
    String groundType,
    String sheet,
    String location,
    String selectPlotsStatus,
    int day,
    int month,
    int year,
  ) async {
    emit(PlotsAddLoading());
    try {
      await PlotsServiceDB.LANDPLOTS.plotsRef.add({
        "ID": null,
        "USERID": FirebaseService().authID,
        "TITLE": plotsTitle,
        "EXPLANATION": plotsExplanation,
        "CITY": city,
        "DISTRICT": district,
        "NEIGHBORHOODVILLAGE": neighborhoodVillage,
        "NEIGHBORHOODNUMBER": neighborhoodNumber,
        "ISLAND": island,
        "PARCEL": parcel,
        "TITLEDEEDAREA": titleDeedArea,
        "QUALIFICATION": qalification,
        "GROUNDTYPE": groundType,
        "SHEET": sheet,
        "LOCATION": location,
        "ACTIVE": selectPlotsStatus == "Arazi Aktif" ? true : false,
        "DAY": day,
        "MONTH": month,
        "YEAR": year,
        "DATE": FieldValue.serverTimestamp(),
      }).then((value) {
        String docID = value.id;
        value.update({"ID": docID});
      });
      emit(PlotsAddSuccess());
    } catch (e) {
      emit(PlotsAddError('Arazi Kaydedilemedi, tekrar deneyiniz.'));
    }
  }

  Future<void> plotsDelete(Map<String, dynamic> data) async {
    emit(PlotsDeleteLoading());

    try {
      await PlotsServiceDB.LANDPLOTS.plotsRef.doc(data['ID']).delete();
      emit(PlotsRemoveSuccess());
    } catch (e) {
      emit(PlotsRemoveError('Arazi Kaldırmada Hata oluştu!'));
    }
  }

  Future<void> plotsUpdate(
    String plotsTitle,
    String plotsExplanation,
    String neighborhoodVillage,
    String neighborhoodNumber,
    String island,
    String parcel,
    String titleDeedArea,
    String qalification,
    String groundType,
    String sheet,
    String location,
    String selectPlotsStatus,
    int day,
    int month,
    int year,
    Map<String, dynamic> data,
  ) async {
    emit(PlotsUpdateLoading());
    try {
      await PlotsServiceDB.LANDPLOTS.plotsRef.doc(data['ID']).update({
        "TITLE": plotsTitle,
        "EXPLANATION": plotsExplanation,
        "NEIGHBORHOODVILLAGE": neighborhoodVillage,
        "NEIGHBORHOODNUMBER": neighborhoodNumber,
        "ISLAND": island,
        "PARCEL": parcel,
        "TITLEDEEDAREA": titleDeedArea,
        "QUALIFICATION": qalification,
        "GROUNDTYPE": groundType,
        "SHEET": sheet,
        "LOCATION": location,
        "ACTIVE": selectPlotsStatus == "Arazi Aktif" ? true : false,
        "DAY": day,
        "MONTH": month,
        "YEAR": year,
        "DATE": FieldValue.serverTimestamp(),
      });
      emit(PlotsUpdateSuccess());
    } catch (e) {
      emit(PlotsUpdateError('Arazi Güncellenmedi, tekrar deneyiniz.'));
    }
  }
}
