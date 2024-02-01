import 'package:eciftci/product/bloc/logregpass_bloc/password_bloc/state/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainAuthPasswordCubit extends Cubit<AuthPasswordState> {
  MainAuthPasswordCubit() : super(AuthPasswordInitial());

  void resetPassword(String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
      emit(AuthPasswordSuccess());
    } catch (e) {
      emit(AuthPasswordError('Hata Oluştu, Tekrar Deneyiniz.'));
    }
  }
}
