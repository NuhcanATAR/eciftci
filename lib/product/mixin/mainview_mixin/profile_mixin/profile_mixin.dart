import 'package:eciftci/product/bloc/mainview_bloc/profile_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin ProfileMixinBloc {
  void profileNameSurnameUpdateListenerBloc(context, state) {
    if (state is NameSurnameUpdateSuccess) {
      Navigator.pop(context);
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: const LabelMediumWhiteText(
          text: "Ad Soyad Güncellendi",
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
    } else if (state is NameSurnameUpdateError) {
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
    } else if (state is NameSurnmeUpdateLoading) {
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

  void profileCityDistrictUpdateListenerBloc(context, state) {
    if (state is CityDistrictUpdateSuccess) {
      Navigator.pop(context);
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: const LabelMediumWhiteText(
          text: "Şehir ve İlçe Güncellendi",
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
    } else if (state is CityDistrictUpdateError) {
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
    } else if (state is CityDistrictUpdateLoading) {
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

  void profilePhoneNumberUpdateListenerBloc(context, state) {
    if (state is PhoneNumberUpdateSuccess) {
      Navigator.pop(context);
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: const LabelMediumWhiteText(
          text: "Telefon Numaranız Güncellendi",
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
    } else if (state is PhoneNumberUpdateError) {
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
    } else if (state is PhoneNumberUpdateLoading) {
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
