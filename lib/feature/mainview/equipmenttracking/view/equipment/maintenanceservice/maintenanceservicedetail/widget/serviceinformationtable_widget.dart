import 'package:eciftci/product/enums/mainview_enum/equipmenttracking_enum/maintenanceservice_enum/maintenanceservice_enum.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class MaintenanceServiceInformationTableWidget extends StatelessWidget {
  const MaintenanceServiceInformationTableWidget(
      {required this.data, required this.maxWidth, super.key});

  final Map<String, dynamic> data;

  final dynamic maxWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: maxWidth,
          child: const Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: LabelMediumBlackBoldText(
              text: "Servis ve Bakım Detayı",
              textAlign: TextAlign.left,
            ),
          ),
        ),
        // care service date
        buildCareServiceDateWidget,
        // maintenance period
        buildMaintenancePeriodWidget,
        // company name
        buildCompanyNameWidget,
        // company phone number
        buildCompanyPhoneNumberWidget,
        // caregiver
        buildCaregiverWidget,
        // completion status
        buildCompletionStatusWidget,
      ],
    );
  }

  // care service date
  Widget get buildCareServiceDateWidget => Container(
        padding: const EdgeInsets.only(bottom: 15, top: 15),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: LabelMediumBlackText(
                text: MaintenanceServiceViewStrings
                    .maintenanceServiceDetailCareDate.value,
                textAlign: TextAlign.left,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: LabelMediumBlackBoldText(
                text:
                    "${data['DAYCARE']}.${data['MONTHCARE']}.${data['YEARCARE']}",
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      );

  // maintenance period
  Widget get buildMaintenancePeriodWidget => Container(
        padding: const EdgeInsets.only(bottom: 15, top: 15),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: LabelMediumBlackText(
                text: MaintenanceServiceViewStrings
                    .maintenanceServiceDetailPeriod.value,
                textAlign: TextAlign.left,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: LabelMediumBlackBoldText(
                text: "${data['MAINTENANCEPERIOD']}",
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      );

  // company name
  Widget get buildCompanyNameWidget => Container(
        padding: const EdgeInsets.only(bottom: 15, top: 15),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: LabelMediumBlackText(
                text: MaintenanceServiceViewStrings
                    .maintenanceServiceDetailCompanyName.value,
                textAlign: TextAlign.left,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: LabelMediumBlackBoldText(
                text: "${data['COMPANYNAME']}",
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      );

  // company phone number
  Widget get buildCompanyPhoneNumberWidget => Container(
        padding: const EdgeInsets.only(bottom: 15, top: 15),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: LabelMediumBlackText(
                text: MaintenanceServiceViewStrings
                    .maintenanceServiceDetailPhoneNumber.value,
                textAlign: TextAlign.left,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: LabelMediumBlackBoldText(
                text: "${data['PHONENUMBER']}",
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      );

  // caregiver
  Widget get buildCaregiverWidget => Container(
        padding: const EdgeInsets.only(bottom: 15, top: 15),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: LabelMediumBlackText(
                text: MaintenanceServiceViewStrings
                    .maintenanceServiceDetailCaregiver.value,
                textAlign: TextAlign.left,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: LabelMediumBlackBoldText(
                text: "${data['CAREGIVER']}",
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      );

  // completion status
  Widget get buildCompletionStatusWidget => Container(
        padding: const EdgeInsets.only(bottom: 15, top: 15),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: LabelMediumBlackText(
                text: MaintenanceServiceViewStrings
                    .maintenanceServiceDetailCompletionStatus.value,
                textAlign: TextAlign.left,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: LabelMediumBlackBoldText(
                text: "${data['COMPLETIONSTATUS']}",
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      );
}
