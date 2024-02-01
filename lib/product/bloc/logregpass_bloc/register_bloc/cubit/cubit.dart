import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/product/bloc/logregpass_bloc/register_bloc/state/state.dart';
import 'package:eciftci/product/utility/database/register_db/register_db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthSignUpCubit extends Cubit<AuthSignUpState> {
  AuthSignUpCubit() : super(AuthSignUpInitial());

  void signUp(
    String email,
    String password,
    String name,
    String surname,
    String city,
    String district,
    String phoneNumber,
    BuildContext context,
  ) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await RegisterDB.USERS.userRef.set({
        "ID": FirebaseAuth.instance.currentUser!.uid,
        "NAME": name,
        "SURNAME": surname,
        "CITY": city,
        "DISTRICT": district,
        "PHONENUMBER": phoneNumber,
        "EMAIL": email,
        "PASSWORD": password,
        "DATE": FieldValue.serverTimestamp(),
        "ACTIVE": true,
      });

      User? userAuth = userCredential.user;
      await userAuth?.sendEmailVerification();

      emit(AuthSignUpSuccess());
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          emit(AuthSignUpEmailAlReadyInUse('E-mail adresi zaten kullanımda.'));
        } else {
          emit(AuthSignUpError('Kayıt işlemi başarısız oldu.'));
        }
      } else {
        emit(AuthSignUpError('Kayıt işlemi başarısız oldu'));
      }
    }
  }
}
