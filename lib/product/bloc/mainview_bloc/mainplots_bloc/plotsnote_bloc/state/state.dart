abstract class PlotsNoteState {}

class PlotsNoteInitial extends PlotsNoteState {}

class PlotsNoteSaveLoading extends PlotsNoteState {}

class PlotsNoteUpdateLoading extends PlotsNoteState {}

class PlotsNoteDeleteLoading extends PlotsNoteState {}

class PlotsNoteSaveSuccess extends PlotsNoteState {}

class PlotsNoteSaveError extends PlotsNoteState {
  final String errorMessage;

  PlotsNoteSaveError(this.errorMessage);
}

class PlotsNoteUpdateSuccess extends PlotsNoteState {}

class PlotsNoteUpdateError extends PlotsNoteState {
  final String errorMessage;
  PlotsNoteUpdateError(this.errorMessage);
}

class PlotsNoteDeleteSuccess extends PlotsNoteState {}

class PlotsNoteDeleteError extends PlotsNoteState {
  final String errorMessage;
  PlotsNoteDeleteError(this.errorMessage);
}
