import 'package:eciftci/product/bloc/mainview_bloc/goes_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

mixin GoesBlocMixin {
  void goesAddListenerBloc(context, state) {
    if (state is GoesAddSuccess) {
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: const LabelMediumWhiteText(
          text: "Gideriniz Kaydedildi!",
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
    } else if (state is GoesAddError) {
      final snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: LabelMediumWhiteText(
          text: state.errorValue,
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

  void goesUpdateListenerBloc(context, state) {
    if (state is GoesUpdateSuccess) {
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: const LabelMediumWhiteText(
          text: "Gideriniz Güncellendi!",
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
    } else if (state is GoesUpdateError) {
      final snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: LabelMediumWhiteText(
          text: state.errorValue,
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

  void goesDeleteListenerBloc(context, state) {
    if (state is GoesDeleteSuccess) {
      Navigator.pop(context);
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: const LabelMediumWhiteText(
          text: "Gider Kaldırıldı!",
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
    } else if (state is GoesDeleteError) {
      final snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: LabelMediumWhiteText(
          text: state.errorValue,
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
