abstract class EquipmentState {}

class EquipmentInitial extends EquipmentState {}

class EquipmentSaveLoading extends EquipmentState {}

class EquipmentUpdateLoading extends EquipmentState {}

class EquipmentDeleteLoading extends EquipmentState {}

class EquipmentSaveSuccess extends EquipmentState {}

class EquipmentSaveError extends EquipmentState {
  final String errorMessage;

  EquipmentSaveError(this.errorMessage);
}

class EquipmentUpdateSuccess extends EquipmentState {}

class EquipmentUpdateError extends EquipmentState {
  final String errorMessage;

  EquipmentUpdateError(this.errorMessage);
}

class EquipmentDeleteSuccess extends EquipmentState {}

class EquipmentDeleteError extends EquipmentState {
  final String errorMessage;

  EquipmentDeleteError(this.errorMessage);
}
