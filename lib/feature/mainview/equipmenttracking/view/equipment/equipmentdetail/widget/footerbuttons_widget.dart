import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/equipmenttracking_enum/equipment_enum/equipment_enum.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class EquipmentDetailFooterButtonsWidget extends StatelessWidget {
  const EquipmentDetailFooterButtonsWidget(
      {required this.data,
      required this.routerService,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final Map<String, dynamic> data;
  final dynamic routerService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          // maintenance service list button
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: () {
                routerService.equipmentMaintenanceServiceListView(
                    context, data);
              },
              child: SizedBox(
                width: maxWidth,
                height: dynamicHeight(0.07),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: MainAppColorConstant.mainColorBackground,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: LabelMediumWhiteText(
                    text:
                        EquipmentViewStrings.equipmentDetailSMButtonText.value,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          // edit button
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: () {
                routerService.equipmentUpdateViewNavigatorRouter(context, data);
              },
              child: SizedBox(
                width: maxWidth,
                height: dynamicHeight(0.07),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: MainAppColorConstant.mainColorBackground,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.edit_outlined,
                        color: MainAppColorConstant.mainColorBackground,
                        size: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: LabelMediumMainColorText(
                          text: EquipmentViewStrings
                              .equipmentDetailEditButtonText.value,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // delete button
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: () {
                routerService.equipmentDeleteDialog(context, data);
              },
              child: SizedBox(
                width: maxWidth,
                height: dynamicHeight(0.07),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                        size: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: LabelMediumRedText(
                          text: EquipmentViewStrings
                              .equipmentDetailDeleteButtonText.value,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
