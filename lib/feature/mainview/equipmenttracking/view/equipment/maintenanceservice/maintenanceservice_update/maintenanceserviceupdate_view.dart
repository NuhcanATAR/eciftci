import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/maintenanceservice/maintenanceservice_update/widget/caregiverinput_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/maintenanceservice/maintenanceservice_update/widget/companynameinput_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/maintenanceservice/maintenanceservice_update/widget/companyphonenumberinput_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/maintenanceservice/maintenanceservice_update/widget/explanationinput_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/maintenanceservice/maintenanceservice_update/widget/serviceperiodinput_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/maintenanceservice/maintenanceservice_update/widget/updatebutton_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainequipment_bloc/maintenanceservice_bloc/cubit/cubit.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/equipmenttracking_enum/maintenanceservice_enum/maintenanceservice_enum.dart';
import 'package:eciftci/product/utility/base/mainview_base/mainequipmenttracking_base/maintenanceservice_base/maintenanceservice_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../../../product/bloc/mainview_bloc/mainequipment_bloc/maintenanceservice_bloc/state/state.dart';

class MaintenanceServiceUpdateView extends StatefulWidget {
  const MaintenanceServiceUpdateView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<MaintenanceServiceUpdateView> createState() =>
      _MaintenanceServiceUpdateViewState();
}

class _MaintenanceServiceUpdateViewState
    extends MaintenanceServiceBase<MaintenanceServiceUpdateView> {
  late TextEditingController maintenancePeriodController =
      TextEditingController(
    text: widget.data['MAINTENANCEPERIOD'],
  );
  late TextEditingController companyNameController = TextEditingController(
    text: widget.data['COMPANYNAME'],
  );
  late TextEditingController companyPhoneNumberController =
      TextEditingController(
    text: widget.data['PHONENUMBER'],
  );
  late TextEditingController caregiverController = TextEditingController(
    text: widget.data['CAREGIVER'],
  );
  late TextEditingController explanationController = TextEditingController(
    text: widget.data['EXPLANATION'],
  );

  late String completionStatusSelect = widget.data['COMPLETIONSTATUS'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: MainAppColorConstant.mainColorBackground,
            size: 18,
          ),
        ),
        title: const LabelMediumMainColorText(
          text: "Servis ve Bakım Bilgisi Güncelle",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<MaintenanceServiceCubit, MaintenanceServiceState>(
        listener: maintenanceServiceUpdateListenerBloc,
        builder: (context, state) {
          return Form(
            key: modelService.formServiceUpdateKey,
            child: Padding(
              padding: context.padding.low,
              child: ListView(
                children: <Widget>[
                  // service period
                  buildServicePeriodInputWidget,
                  // company name
                  buildCompanyNameInputWidget,
                  // company phone number
                  buildCompanyPhoneNumberInputWidget,
                  // caregiver name
                  buildCaregiverNameInputWidget,
                  // explanation
                  buildExplanationInputWidget,
                  // completion status
                  buildCompletionStatsuInputWidget,
                  // update button
                  buildUpdateButtonWidget,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // service period
  Widget get buildServicePeriodInputWidget =>
      MaintenanceServicePeriodInputWidget(
        modelService: modelService,
        maintenancePeriodController: maintenancePeriodController,
      );

  // company name
  Widget get buildCompanyNameInputWidget =>
      MaintenanceServiceCompanyNameInputWidget(
        modelService: modelService,
        companyNameController: companyNameController,
      );

  // company phone number
  Widget get buildCompanyPhoneNumberInputWidget =>
      MaintenanceServiceCompanyPhoneNumberInputWidget(
        modelService: modelService,
        companyPhoneNumberController: companyPhoneNumberController,
      );

  // caregiver name
  Widget get buildCaregiverNameInputWidget =>
      MaintenanceServiceCareGiverInputWidget(
        modelService: modelService,
        caregiverController: caregiverController,
      );

  // explanation
  Widget get buildExplanationInputWidget =>
      MaintenanceServiceExplanationInputWidget(
        modelService: modelService,
        explanationController: explanationController,
      );

  // completion status
  Widget get buildCompletionStatsuInputWidget => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: DropdownMenu<String>(
          initialSelection: completionStatusSelect,
          onSelected: (String? value) {
            setState(() {
              completionStatusSelect = value!;
            });
          },
          label: LabelMediumBlackText(
            text: MaintenanceServiceViewStrings.completionStatusInputText.value,
            textAlign: TextAlign.left,
          ),
          width: dynamicWidth(0.94),
          textStyle: GoogleFonts.nunito(
            textStyle: context.general.textTheme.labelMedium?.copyWith(
              color: Colors.black,
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
              border: InputBorder.none,
              hintStyle: GoogleFonts.nunito(
                textStyle: context.general.textTheme.labelMedium?.copyWith(
                  color: Colors.grey,
                ),
              )),
          dropdownMenuEntries: modelService.completionStatusList
              .map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
        ),
      );

  // update button
  Widget get buildUpdateButtonWidget => MaintenanceServiceUpdateButtonWidget(
        modelService: modelService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        maintenancePeriodController: maintenancePeriodController,
        companyNameController: companyNameController,
        companyPhoneNumberController: companyPhoneNumberController,
        caregiverController: caregiverController,
        explanationController: explanationController,
        completionStatusSelect: completionStatusSelect,
        data: widget.data,
      );
}
