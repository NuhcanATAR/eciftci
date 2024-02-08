import 'package:eciftci/product/constants/color_constant.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../product/enums/mainview_enum/equipmenttracking_enum/maintenanceservice_enum/maintenanceservice_enum.dart';
import '../../../../../../../../../product/widget/text_widget/label_medium_text.dart';

class MaintenanceServiceDetailFooterButtonWidget extends StatelessWidget {
  const MaintenanceServiceDetailFooterButtonWidget(
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
      child: GestureDetector(
        onTap: () {
          routerService.maintenanceServiceUpdateViewNavigatorRouter(
            context,
            data,
          );
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.edit_outlined,
                  color: Colors.white,
                  size: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: LabelMediumWhiteText(
                    text: MaintenanceServiceViewStrings
                        .maintenanceServiceUpdateButtonText.value,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
