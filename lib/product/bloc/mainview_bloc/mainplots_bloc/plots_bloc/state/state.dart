abstract class PlotsState {}

class PlotsInitial extends PlotsState {}

class PlotsAddLoading extends PlotsState {}

class PlotsUpdateLoading extends PlotsState {}

class PlotsDeleteLoading extends PlotsState {}

class PlotsAddSuccess extends PlotsState {}

class PlotsAddError extends PlotsState {
  final String errorMessage;

  PlotsAddError(this.errorMessage);
}

class PlotsUpdateSuccess extends PlotsState {}

class PlotsUpdateError extends PlotsState {
  final String errorMessage;

  PlotsUpdateError(this.errorMessage);
}

class PlotsRemoveSuccess extends PlotsState {}

class PlotsRemoveError extends PlotsState {
  final String errorMessage;

  PlotsRemoveError(this.errorMessage);
}
