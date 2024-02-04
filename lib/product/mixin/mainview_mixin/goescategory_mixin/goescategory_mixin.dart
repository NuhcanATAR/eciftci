import 'package:eciftci/product/bloc/mainview_bloc/goescategory_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

mixin GoesCategoryBlocMixin {
  void goesCategoryAddListenerBloc(context, state) {
    if (state is GoesCategorySaveSuccess) {
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: const LabelMediumWhiteText(
          text: "Kategorinizi Kaydedildi!",
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
    } else if (state is GoesCategorySaveError) {
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
    }
  }

  void goesCategoryUpdateListenerBloc(context, state) {
    if (state is GoesCategoryUpdateSuccess) {
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: const LabelMediumWhiteText(
          text: "Kategoriniz Güncellendi!",
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
    } else if (state is GoesCategoryUpdateError) {
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
    }
  }
}
