import 'package:eciftci/product/bloc/logregpass_bloc/login_bloc/state/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthSignInCubit extends Cubit<AuthSignInState> {
  AuthSignInCubit() : super(AuthSignInInitial());

  void signIn(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User user = userCredential.user!;

      if (user.emailVerified) {
        emit(AuthSignInSuccess());
      } else {
        emit(AuthSignInError(
            'Hesap doğrulanmamış. Lütfen e-posta adresinizi kontrol edin.'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthSignInUserNotFound(
            'Kullanıcı bulunamadı. Lütfen e-posta adresinizi kontrol edin.'));
      } else if (e.code == 'wrong-password') {
        emit(AuthSignInWrongPasswordError(
            'Yanlış şifre. Lütfen şifrenizi kontrol edin.'));
      } else if (e.code == 'too-many-requests') {
        emit(AuthSignInTooManyRequest('Çok fazla hatalı giriş yaptınız.'));
      } else if (e.code == "invalid-email") {
        emit(AuthSignInInvalidEmail("E-mail Adresi Geçersizdir!"));
      }
    } catch (e) {
      emit(AuthSignInError('Giriş işlemi başarısız oldu.'));
    }
  }
}
