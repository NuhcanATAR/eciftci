import 'package:eciftci/feature/mainview/connectionerror/connectionerror_view.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/maintenanceservice/maintenanceservice_create/maintenanceservicecreate_view.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/maintenanceservice/maintenanceservice_update/maintenanceserviceupdate_view.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/maintenanceservice/maintenanceservicedetail/maintenanceservicedetail_view.dart';
import 'package:flutter/material.dart';

class MainintenanceServiceRouterService {
  // connection error view router
  void connectionErrorViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ConnectionErrorView(),
      ),
    );
  }

  // service detail view
  void maintenanceServiceDetailViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MaintenanceServiceDetailView(
          data: data,
        ),
      ),
    );
  }

  // service create view
  void maintenanceServiceCreateViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MaintenanceServiceCreateView(data: data),
      ),
    );
  }

  // service update view
  void maintenanceServiceUpdateViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MaintenanceServiceUpdateView(
          data: data,
        ),
      ),
    );
  }

  // service delete dialog
  void maintenanceServiceDeleteDialog(
      BuildContext context, Map<String, dynamic> data) {}
}
