import 'package:eciftci/product/mixin/mainview_mixin/maineqipmenttracking_mixin/maintenanceservice_mixin/maintenanceservice_mixin.dart';
import 'package:eciftci/product/model/mainview_model/mainequipmenttracking_model/maintenanceservice_model/maintenanceservice_model.dart';
import 'package:eciftci/product/router/mainview_router/mainequipmenttracking_router/maintenanceservice_router/maintenanceservice_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import '../../../../../extension/view_extension.dart';

abstract class MaintenanceServiceBase<T extends StatefulWidget> extends State<T>
    with MaintenanceServiceBlocMixin {
  // router service
  MainintenanceServiceModelService modelService =
      MainintenanceServiceModelService();

  // router service
  MainintenanceServiceRouterService routerService =
      MainintenanceServiceRouterService();

  // screens size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;

  Future<void> selectFutureDate(BuildContext context) async {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      onConfirm: (date) {
        DateTime selectedDateTime = DateTime(
          date.year,
          date.month,
          date.day,
        );

        setState(() {
          modelService.selectedDate = selectedDateTime;
        });
      },
      currentTime: DateTime.now(),
      locale: LocaleType.tr,
    );
  }
}
