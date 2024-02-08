import 'package:eciftci/product/bloc/mainview_bloc/mainequipment_bloc/equipmentcategory_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin EquipmentTrackingCategoryBlocMixin {
  void equipmentCategoryAddListeneBloc(context, state) {
    if (state is EquipmentCategorySaveSuccess) {
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: const LabelMediumWhiteText(
          text: "Ekipman Kategoriniz Eklendi!",
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
    } else if (state is EquipmentCategorySaveError) {
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
      Navigator.pop(context);
    } else if (state is EquipmentCategorySaveLoading) {
      var alertDialog = AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: LoadingAnimationWidget.hexagonDots(
          color: Colors.white,
          size: 50,
        ),
        content: const LabelMediumWhiteText(
          text: "Kategori Kaydediliyor Bekleyin...",
          textAlign: TextAlign.center,
        ),
      );
      showDialog(context: context, builder: (context) => alertDialog);
    }
  }
}
