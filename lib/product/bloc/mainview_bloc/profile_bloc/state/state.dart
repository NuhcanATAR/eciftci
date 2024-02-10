abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class NameSurnmeUpdateLoading extends ProfileState {}

class CityDistrictUpdateLoading extends ProfileState {}

class PhoneNumberUpdateLoading extends ProfileState {}

class NameSurnameUpdateSuccess extends ProfileState {}

class NameSurnameUpdateError extends ProfileState {
  final String errorMessage;

  NameSurnameUpdateError(this.errorMessage);
}

class CityDistrictUpdateSuccess extends ProfileState {}

class CityDistrictUpdateError extends ProfileState {
  final String errorMessage;

  CityDistrictUpdateError(this.errorMessage);
}

class PhoneNumberUpdateSuccess extends ProfileState {}

class PhoneNumberUpdateError extends ProfileState {
  final String errorMessage;

  PhoneNumberUpdateError(this.errorMessage);
}
