abstract class MainGoesCategoryState {}

class GoesCategoryInitialState extends MainGoesCategoryState {}

class GoesCategorySaveSuccess extends MainGoesCategoryState {}

class GoesCategorySaveError extends MainGoesCategoryState {
  final String errorMessage;

  GoesCategorySaveError(this.errorMessage);
}

class GoesCategoryUpdateSuccess extends MainGoesCategoryState {}

class GoesCategoryUpdateError extends MainGoesCategoryState {
  final String errorMessage;

  GoesCategoryUpdateError(this.errorMessage);
}
