import 'package:eciftci/product/bloc/mainview_bloc/profile_bloc/state/state.dart';
import 'package:eciftci/product/utility/database/mainview_db/profile_db/profile_db.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> nameSurnameUpdate(
    String name,
    String surname,
  ) async {
    emit(NameSurnmeUpdateLoading());
    try {
      ProfileDB.USERS.userRefTable.update({
        "NAME": name,
        "SURNAME": surname,
      });
      emit(NameSurnameUpdateSuccess());
    } catch (e) {
      emit(NameSurnameUpdateError(
          'Ad Soyad Güncellenmedi, daha sonra tekrar deneyiniz'));
    }
  }

  Future<void> cityDistrictUpdate(
    String city,
    String district,
  ) async {
    emit(CityDistrictUpdateLoading());
    try {
      ProfileDB.USERS.userRefTable.update({
        "CITY": city,
        "DISTRICT": district,
      });
      emit(CityDistrictUpdateSuccess());
    } catch (e) {
      emit(CityDistrictUpdateError(
          'Şehir ve İlçe Güncellenmedi, daha sonra tekrar deneyiniz'));
    }
  }

  Future<void> phoneNumberUpdate(
    String phoneNumber,
  ) async {
    emit(PhoneNumberUpdateLoading());
    try {
      ProfileDB.USERS.userRefTable.update({
        "PHONENUMBER": phoneNumber,
      });
      emit(PhoneNumberUpdateSuccess());
    } catch (e) {
      emit(PhoneNumberUpdateError(
          'Telefon Numaranız Güncellenmedi, daha sonra tekrar deneyiniz'));
    }
  }
}
