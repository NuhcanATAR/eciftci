abstract class MainGoesState {}

class GoesInitial extends MainGoesState {}

class GoesAddSuccess extends MainGoesState {}

class GoesAddError extends MainGoesState {
  final String errorValue;

  GoesAddError(this.errorValue);
}

class GoesUpdateSuccess extends MainGoesState {}

class GoesUpdateError extends MainGoesState {
  final String errorValue;

  GoesUpdateError(this.errorValue);
}

class GoesDeleteSuccess extends MainGoesState {}

class GoesDeleteError extends MainGoesState {
  final String errorValue;

  GoesDeleteError(this.errorValue);
}
