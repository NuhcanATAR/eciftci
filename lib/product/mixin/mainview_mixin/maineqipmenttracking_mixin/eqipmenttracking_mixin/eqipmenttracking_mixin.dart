import 'package:eciftci/product/bloc/mainview_bloc/mainequipment_bloc/equipment_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin EquipmentTrackingBlocMixin {
  void equipmentAddListenerBloc(context, state) {
    if (state is EquipmentSaveSuccess) {
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: const LabelMediumWhiteText(
          text: "Ekipman Oluşturuldu!",
          textAlign: TextAlign.left,
        ),
        action: SnackBarAction(
          label: "Tamam",
          textColor: Colors.white,
          onPressed: () {},
        ),
        duration: const Duration(
          seconds: 4,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
    } else if (state is EquipmentSaveError) {
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: LabelMediumWhiteText(
          text: state.errorMessage,
          textAlign: TextAlign.left,
        ),
        action: SnackBarAction(
          label: "Tamam",
          textColor: Colors.white,
          onPressed: () {},
        ),
        duration: const Duration(
          seconds: 4,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
    } else if (state is EquipmentSaveLoading) {
      var alertDialog = AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: LoadingAnimationWidget.hexagonDots(
          color: Colors.white,
          size: 50,
        ),
        content: const LabelMediumWhiteText(
          text: "Ekipman Kaydediliyor Bekleyin...",
          textAlign: TextAlign.center,
        ),
      );
      showDialog(context: context, builder: (context) => alertDialog);
    }
  }

  void equipmentDeleteListenerBloc(context, state) {
    if (state is EquipmentDeleteSuccess) {
      Navigator.pop(context);
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: const LabelMediumWhiteText(
          text: "Ekipman Kaldırıldı!",
          textAlign: TextAlign.left,
        ),
        action: SnackBarAction(
          label: "Tamam",
          textColor: Colors.white,
          onPressed: () {},
        ),
        duration: const Duration(
          seconds: 4,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
    } else if (state is EquipmentDeleteError) {
      Navigator.pop(context);
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: LabelMediumWhiteText(
          text: state.errorMessage,
          textAlign: TextAlign.left,
        ),
        action: SnackBarAction(
          label: "Tamam",
          textColor: Colors.white,
          onPressed: () {},
        ),
        duration: const Duration(
          seconds: 4,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
    } else if (state is EquipmentDeleteLoading) {
      var alertDialog = AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: LoadingAnimationWidget.hexagonDots(
          color: Colors.white,
          size: 50,
        ),
        content: const LabelMediumWhiteText(
          text: "Ekipman Kaldırılıyor Lütfen Bekleyin...",
          textAlign: TextAlign.center,
        ),
      );
      showDialog(context: context, builder: (context) => alertDialog);
    }
  }

  void equipmentUpdateListenerBloc(context, state) {
    if (state is EquipmentUpdateSuccess) {
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: const LabelMediumWhiteText(
          text: "Ekipman Güncellendi!",
          textAlign: TextAlign.left,
        ),
        action: SnackBarAction(
          label: "Tamam",
          textColor: Colors.white,
          onPressed: () {},
        ),
        duration: const Duration(
          seconds: 4,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
    } else if (state is EquipmentUpdateError) {
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: LabelMediumWhiteText(
          text: state.errorMessage,
          textAlign: TextAlign.left,
        ),
        action: SnackBarAction(
          label: "Tamam",
          textColor: Colors.white,
          onPressed: () {},
        ),
        duration: const Duration(
          seconds: 4,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
    } else if (state is EquipmentUpdateLoading) {
      var alertDialog = AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: LoadingAnimationWidget.hexagonDots(
          color: Colors.white,
          size: 50,
        ),
        content: const LabelMediumWhiteText(
          text: "Ekipman Güncelleniyor Bekleyin...",
          textAlign: TextAlign.center,
        ),
      );
      showDialog(context: context, builder: (context) => alertDialog);
    }
  }
}
