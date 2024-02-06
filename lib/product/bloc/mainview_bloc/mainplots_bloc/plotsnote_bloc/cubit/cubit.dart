import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainplots_bloc/plotsnote_bloc/state/state.dart';
import 'package:eciftci/product/model/mainview_model/mainplots_model/note_model/note_model.dart';
import 'package:eciftci/product/utility/database/mainview_db/plots_db/plots_db.dart';
import 'package:eciftci/product/utility/service/firebase_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlotsNoteCubit extends Cubit<PlotsNoteState> {
  PlotsNoteCubit() : super(PlotsNoteInitial());
  // model
  PlotsNoteModel model = PlotsNoteModel();
  Future<void> noteAdd(
    String title,
    String explanation,
    String futureDateStatus,
    int day,
    int month,
    int year,
    Map<String, dynamic> data,
  ) async {
    emit(PlotsNoteSaveLoading());

    try {
      await PlotsServiceDB.LANDPLOTS.plotsNoteRef.add({
        "ID": null,
        "USERID": FirebaseService().authID,
        "PLOTSID": data['ID'],
        "TITLE": title,
        "EXPLANATION": explanation,
        "FUTUREDATESTATUS":
            futureDateStatus == "Hedef Tarih Var" ? true : false,
        "DAY": futureDateStatus == "Hedef Tarih Var" ? day : model.nowDate.day,
        "MONTH":
            futureDateStatus == "Hedef Tarih Var" ? month : model.nowDate.month,
        "YEAR":
            futureDateStatus == "Hedef Tarih Var" ? year : model.nowDate.year,
        "DATE": FieldValue.serverTimestamp(),
      }).then((value) {
        String docID = value.id;
        value.update({"ID": docID});
      });
      emit(PlotsNoteSaveSuccess());
    } catch (e) {
      emit(PlotsNoteSaveError('Notunuz Kaydedilmedi, Tekrar Deneyiniz!'));
    }
  }

  Future<void> noteDelete(Map<String, dynamic> data) async {
    emit(PlotsNoteDeleteLoading());

    try {
      await PlotsServiceDB.LANDPLOTS.plotsNoteRef.doc(data['ID']).delete();
      emit(PlotsNoteDeleteSuccess());
    } catch (e) {
      emit(PlotsNoteDeleteError(
          'Notunuz Kaldırılamadı, Lütfen Daha sonra tekrar deneyiniz.'));
    }
  }

  Future<void> noteUpdate(
    String title,
    String explanation,
    Map<String, dynamic> data,
  ) async {
    emit(PlotsNoteUpdateLoading());

    try {
      await PlotsServiceDB.LANDPLOTS.plotsNoteRef.doc(data['ID']).update({
        "TITLE": title,
        "EXPLANATION": explanation,
        "DATE": FieldValue.serverTimestamp(),
      });
      emit(PlotsNoteUpdateSuccess());
    } catch (e) {
      emit(PlotsNoteUpdateError('Notunuz Güncellenmedi, Tekrar Deneyiniz!'));
    }
  }
}
