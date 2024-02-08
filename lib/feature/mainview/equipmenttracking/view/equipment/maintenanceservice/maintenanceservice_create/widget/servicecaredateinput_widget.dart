import 'package:eciftci/product/enums/mainview_enum/equipmenttracking_enum/maintenanceservice_enum/maintenanceservice_enum.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class MaintenanceServiceCareDateInputWidget extends StatelessWidget {
  const MaintenanceServiceCareDateInputWidget(
      {required this.selectFutureDate,
      required this.modelService,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final dynamic selectFutureDate;
  final dynamic modelService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectFutureDate(context);
      },
      child: SizedBox(
        height: dynamicHeight(0.08),
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: Row(
            children: <Widget>[
              const Icon(
                Icons.date_range,
                color: Colors.grey,
                size: 18,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: LabelMediumBlackText(
                    text:
                        "${MaintenanceServiceViewStrings.careDateInputText.value}: ${modelService.selectedDate.day}.${modelService.selectedDate.month}.${modelService.selectedDate.year}",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
