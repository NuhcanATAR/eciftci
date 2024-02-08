abstract class MaintenanceServiceState {}

class MaintenanceServiceInitial extends MaintenanceServiceState {}

class MaintenanceServiceAddLoading extends MaintenanceServiceState {}

class MaintenanceServiceUpdateLoading extends MaintenanceServiceState {}

class MaintenanceServiceaDeleteLoading extends MaintenanceServiceState {}

class MaintenanceServiceAddSuccess extends MaintenanceServiceState {}

class MaintenanceServiceAddError extends MaintenanceServiceState {
  final String errorMessage;

  MaintenanceServiceAddError(this.errorMessage);
}

class MaintenanceServiceUpdateSuccess extends MaintenanceServiceState {}

class MaintenanceServiceUpdateError extends MaintenanceServiceState {
  final String errorMessage;
  MaintenanceServiceUpdateError(this.errorMessage);
}

class MaintenanceServiceDeleteSuccess extends MaintenanceServiceState {}

class MaintenanceServiceDeleteError extends MaintenanceServiceState {
  final String errorMessage;

  MaintenanceServiceDeleteError(this.errorMessage);
}
