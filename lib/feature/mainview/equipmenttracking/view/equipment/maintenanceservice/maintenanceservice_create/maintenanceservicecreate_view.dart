import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/maintenanceservice/maintenanceservice_create/widget/caregiverinput_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/maintenanceservice/maintenanceservice_create/widget/companynameinput_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/maintenanceservice/maintenanceservice_create/widget/companyphonenumberinput_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/maintenanceservice/maintenanceservice_create/widget/explanationinput_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/maintenanceservice/maintenanceservice_create/widget/savebutton_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/maintenanceservice/maintenanceservice_create/widget/servicecaredateinput_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/maintenanceservice/maintenanceservice_create/widget/serviceperiodinput_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainequipment_bloc/maintenanceservice_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainequipment_bloc/maintenanceservice_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/equipmenttracking_enum/maintenanceservice_enum/maintenanceservice_enum.dart';
import 'package:eciftci/product/utility/base/mainview_base/mainequipmenttracking_base/maintenanceservice_base/maintenanceservice_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class MaintenanceServiceCreateView extends StatefulWidget {
  const MaintenanceServiceCreateView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<MaintenanceServiceCreateView> createState() =>
      _MaintenanceServiceCreateViewState();
}

class _MaintenanceServiceCreateViewState
    extends MaintenanceServiceBase<MaintenanceServiceCreateView> {
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
          text: "Servis ve Bakım Bilgisi Oluştur",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<MaintenanceServiceCubit, MaintenanceServiceState>(
        listener: maintenanceServiceAddListenerBloc,
        builder: (context, state) {
          return Form(
            key: modelService.formServiceAddKey,
            child: Padding(
              padding: context.padding.low,
              child: ListView(
                children: <Widget>[
                  // service care date
                  buildServiceCareDateInputWidget,
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
                  // save button
                  buildSaveButtonWidget,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // service care date
  Widget get buildServiceCareDateInputWidget =>
      MaintenanceServiceCareDateInputWidget(
        selectFutureDate: selectFutureDate,
        modelService: modelService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );

  // service period
  Widget get buildServicePeriodInputWidget =>
      MaintenanceServicePeriodInputWidget(
        modelService: modelService,
      );

  // company name
  Widget get buildCompanyNameInputWidget =>
      MaintenanceServiceCompanyNameInputWidget(
        modelService: modelService,
      );

  // company phone number
  Widget get buildCompanyPhoneNumberInputWidget =>
      MaintenanceServiceCompanyPhoneNumberInputWidget(
        modelService: modelService,
      );

  // caregiver name
  Widget get buildCaregiverNameInputWidget =>
      MaintenanceServiceCareGiverInputWidget(
        modelService: modelService,
      );

  // explanation
  Widget get buildExplanationInputWidget =>
      MaintenanceServiceExplanationInputWidget(
        modelService: modelService,
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
          initialSelection: modelService.completionStatusSelect,
          onSelected: (String? value) {
            setState(() {
              modelService.completionStatusSelect = value!;
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

  // save button
  Widget get buildSaveButtonWidget => MaintenanceServiceSaveButtonWidget(
        modelService: modelService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        data: widget.data,
      );
}
