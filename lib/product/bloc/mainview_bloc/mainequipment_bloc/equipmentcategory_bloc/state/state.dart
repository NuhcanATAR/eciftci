abstract class EquipmentCategoryState {}

class EquipmentCategoryInitial extends EquipmentCategoryState {}

class EquipmentCategorySaveLoading extends EquipmentCategoryState {}

class EquipmentCategoryUpdateLoading extends EquipmentCategoryState {}

class EquipmentCategorySaveSuccess extends EquipmentCategoryState {}

class EquipmentCategorySaveError extends EquipmentCategoryState {
  final String errorMessage;

  EquipmentCategorySaveError(this.errorMessage);
}

class EquipmentCategoryUpdateSuccess extends EquipmentCategoryState {}

class EquipmentCategoryUpdateError extends EquipmentCategoryState {
  final String errorMessage;

  EquipmentCategoryUpdateError(this.errorMessage);
}
