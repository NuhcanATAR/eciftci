abstract class MainIncomeCategoryState {}

class IncomeCategoryInitialState extends MainIncomeCategoryState {}

class IncomeCategorySaveSuccess extends MainIncomeCategoryState {}

class IncomeCategorySaveError extends MainIncomeCategoryState {
  final String errorMessage;

  IncomeCategorySaveError(this.errorMessage);
}

class IncomeCategoryUpdateSuccess extends MainIncomeCategoryState {}

class IncomeCategoryUpdateError extends MainIncomeCategoryState {
  final String errorMessage;

  IncomeCategoryUpdateError(this.errorMessage);
}
