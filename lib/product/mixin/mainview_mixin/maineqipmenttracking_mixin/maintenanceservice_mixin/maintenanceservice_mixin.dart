import 'package:eciftci/product/bloc/mainview_bloc/mainequipment_bloc/maintenanceservice_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin MaintenanceServiceBlocMixin {
  void maintenanceServiceAddListenerBloc(context, state) {
    if (state is MaintenanceServiceAddSuccess) {
      Navigator.pop(context);
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: const LabelMediumWhiteText(
          text: "Servis ve Bakım Kaydedildi!",
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
    } else if (state is MaintenanceServiceAddError) {
      Navigator.pop(context);
      final snackBar = SnackBar(
        backgroundColor: Colors.red,
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
    } else if (state is MaintenanceServiceAddLoading) {
      var alertDialog = AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: LoadingAnimationWidget.hexagonDots(
          color: Colors.white,
          size: 50,
        ),
        content: const LabelMediumWhiteText(
          text: "Kaydediliyor Bekleyin...",
          textAlign: TextAlign.center,
        ),
      );
      showDialog(context: context, builder: (context) => alertDialog);
    }
  }

  void maintenanceServiceDeleteListenerBloc(context, state) {
    if (state is MaintenanceServiceDeleteSuccess) {
      Navigator.pop(context);
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: const LabelMediumWhiteText(
          text: "Servis ve Bakım Kaldırıldı!",
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
    } else if (state is MaintenanceServiceDeleteError) {
      Navigator.pop(context);
      final snackBar = SnackBar(
        backgroundColor: Colors.red,
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
    } else if (state is MaintenanceServiceaDeleteLoading) {
      var alertDialog = AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: LoadingAnimationWidget.hexagonDots(
          color: Colors.white,
          size: 50,
        ),
        content: const LabelMediumWhiteText(
          text: "Kaldırılıyor Bekleyin...",
          textAlign: TextAlign.center,
        ),
      );
      showDialog(context: context, builder: (context) => alertDialog);
    }
  }

  void maintenanceServiceUpdateListenerBloc(context, state) {
    if (state is MaintenanceServiceUpdateSuccess) {
      Navigator.pop(context);
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: const LabelMediumWhiteText(
          text: "Servis ve Bakım Güncellendi!",
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
    } else if (state is MaintenanceServiceUpdateError) {
      Navigator.pop(context);
      final snackBar = SnackBar(
        backgroundColor: Colors.red,
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
    } else if (state is MaintenanceServiceUpdateLoading) {
      var alertDialog = AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: LoadingAnimationWidget.hexagonDots(
          color: Colors.white,
          size: 50,
        ),
        content: const LabelMediumWhiteText(
          text: "Güncelleniyor Bekleyin...",
          textAlign: TextAlign.center,
        ),
      );
      showDialog(context: context, builder: (context) => alertDialog);
    }
  }
}
