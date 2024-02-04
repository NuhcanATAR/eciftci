abstract class MainIncomeState {}

class IncomeInitial extends MainIncomeState {}

class IncomeAddSuccess extends MainIncomeState {}

class IncomeAddError extends MainIncomeState {
  final String errorValue;

  IncomeAddError(this.errorValue);
}

class IncomeUpdateSuccess extends MainIncomeState {}

class IncomeUpdateError extends MainIncomeState {
  final String errorValue;

  IncomeUpdateError(this.errorValue);
}

class IncomeDeleteSuccess extends MainIncomeState {}

class IncomeDeleteError extends MainIncomeState {
  final String errorValue;

  IncomeDeleteError(this.errorValue);
}
