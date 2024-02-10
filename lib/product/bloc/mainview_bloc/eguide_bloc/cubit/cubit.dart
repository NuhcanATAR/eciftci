import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/product/bloc/mainview_bloc/eguide_bloc/state/state.dart';
import 'package:eciftci/product/utility/database/mainview_db/eguide_db/eguide_db.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EGuideCubit extends Cubit<EGuideState> {
  EGuideCubit() : super(EGuideInitial());

  Future<void> userAdd(
    String name,
    String surname,
    String phoneNumber,
    String companyName,
    String explanation,
  ) async {
    emit(EGuideSaveLoading());

    try {
      await EGuideDB.EGUIDE.eguideRef.add({
        "ID": null,
        "NAME": name,
        "SURNAME": surname,
        "PHONENUMBER": phoneNumber,
        "COMPANYNAME": companyName,
        "EXPLANATION": explanation,
        "DATE": FieldValue.serverTimestamp(),
      }).then((value) {
        String docID = value.id;
        value.update({"ID": docID});
      });
      emit(EGuideSaveSuccess());
    } catch (e) {
      emit(EGuideSaveError('Kişi Kaydedilmedi, daha sonra tekrar deneyiniz'));
    }
  }

  Future<void> userUpdate(
    String name,
    String surname,
    String phoneNumber,
    String companyName,
    String explanation,
    Map<String, dynamic> data,
  ) async {
    emit(EGuideUpdateLoading());

    try {
      await EGuideDB.EGUIDE.eguideRef.doc(data['ID']).update({
        "NAME": name,
        "SURNAME": surname,
        "PHONENUMBER": phoneNumber,
        "COMPANYNAME": companyName,
        "EXPLANATION": explanation,
      });
      emit(EGuideUpdateSuccess());
    } catch (e) {
      emit(
          EGuideUpdateError('Kişi Güncellenmedi, daha sonra tekrar deneyiniz'));
    }
  }

  Future<void> userDelete(Map<String, dynamic> data) async {
    emit(EGuideDeleteLoading());

    try {
      await EGuideDB.EGUIDE.userRefTable(data).delete();
      emit(EGuideDeleteSuccess());
    } catch (e) {
      emit(EGuideDeleteError('Kişi Silinmedi, daha sonra tekrar deneyiniz.'));
    }
  }
}
