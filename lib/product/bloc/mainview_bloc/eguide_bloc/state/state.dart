abstract class EGuideState {}

class EGuideInitial extends EGuideState {}

class EGuideSaveLoading extends EGuideState {}

class EGuideUpdateLoading extends EGuideState {}

class EGuideDeleteLoading extends EGuideState {}

class EGuideSaveSuccess extends EGuideState {}

class EGuideSaveError extends EGuideState {
  final String errorMessage;
  EGuideSaveError(this.errorMessage);
}

class EGuideUpdateSuccess extends EGuideState {}

class EGuideUpdateError extends EGuideState {
  final String errorMessage;
  EGuideUpdateError(this.errorMessage);
}

class EGuideDeleteSuccess extends EGuideState {}

class EGuideDeleteError extends EGuideState {
  final String errorMessage;
  EGuideDeleteError(this.errorMessage);
}
