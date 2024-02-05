import 'package:eciftci/feature/mainview/plots/view/plotsdetail/view/plotsupdate/widget/explanationinput_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/view/plotsupdate/widget/groundtypeinput_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/view/plotsupdate/widget/islandinput_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/view/plotsupdate/widget/locationinput_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/view/plotsupdate/widget/neighborhoodnumberinput_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/view/plotsupdate/widget/neighborhoodvillageinput_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/view/plotsupdate/widget/parcelinput_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/view/plotsupdate/widget/qalificationinput_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/view/plotsupdate/widget/sheetinput_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/view/plotsupdate/widget/titledeedareainput_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/view/plotsupdate/widget/titleinput_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/view/plotsupdate/widget/updatebutton_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainplots_bloc/plots_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/model/mainview_model/mainplots_model/plots_model/plots_model.dart';
import 'package:eciftci/product/utility/base/mainview_base/plots_base/plots_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../../product/bloc/mainview_bloc/mainplots_bloc/plots_bloc/cubit/cubit.dart';

class PlotsUpdateView extends StatefulWidget {
  const PlotsUpdateView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<PlotsUpdateView> createState() => _PlotsUpdateViewState();
}

class _PlotsUpdateViewState extends MainPlotsBase<PlotsUpdateView> {
  late TextEditingController titleController = TextEditingController(
    text: widget.data['TITLE'],
  );
  late TextEditingController explanationController = TextEditingController(
    text: widget.data['EXPLANATION'],
  );
  late TextEditingController neighborhoodVillageController =
      TextEditingController(
    text: widget.data['NEIGHBORHOODVILLAGE'],
  );
  late TextEditingController neighborhoodNumber = TextEditingController(
    text: widget.data['NEIGHBORHOODNUMBER'],
  );
  late TextEditingController islandController = TextEditingController(
    text: widget.data['ISLAND'],
  );
  late TextEditingController parcelController = TextEditingController(
    text: widget.data['PARCEL'],
  );
  late TextEditingController titleDeedAreaController = TextEditingController(
    text: widget.data['TITLEDEEDAREA'],
  );
  late TextEditingController qualificationController = TextEditingController(
    text: widget.data['QUALIFICATION'],
  );
  late TextEditingController groundTypeController = TextEditingController(
    text: widget.data['GROUNDTYPE'],
  );
  late TextEditingController sheetController = TextEditingController(
    text: widget.data['SHEET'],
  );
  late TextEditingController locationController = TextEditingController(
    text: widget.data['LOCATION'],
  );

  // plots status
  late String plotsSelectStatusType =
      widget.data['ACTIVE'] == true ? "Arazi Aktif" : "Arazi Kapalı";
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
            text: "Arazi Güncelle",
            textAlign: TextAlign.center,
          ),
        ),
        body: BlocConsumer<PlotsCubit, PlotsState>(
          listener: plotsUpdateListenerBloc,
          builder: (context, state) {
            return Form(
              key: plotsModelService.formPlotsUpdateKey,
              child: Padding(
                padding: context.padding.low,
                child: ListView(
                  children: <Widget>[
                    // title input
                    buildTitleInputWidget,
                    // explanation input
                    buildExplanationInputWidget,

                    // neighborhoodvillage input
                    buildNeighborhoodVillageInputWidget,
                    // neighborhoodnumber input
                    buildNeighborhoodNumberInputWidget,
                    // island input
                    buildIslandInputWidget,
                    // parcel input
                    buildParcelInputWidget,
                    // title deedarea input
                    buildTitleDeedareInputWidget,
                    // qalification input
                    buildQalificationInputWidget,
                    // groundtype input
                    buildGroundTypeInputWidget,
                    // sheet
                    buildSheetInputWidget,
                    // location
                    buildLocationInputWidget,
                    // plots status
                    buildPlotsStatusWidget,
                    // update button
                    buildUpdateButtonWidget,
                  ],
                ),
              ),
            );
          },
        ));
  }

  // title input
  Widget get buildTitleInputWidget => PlotsTitleInputWidget(
        plotsModelService: plotsModelService,
        titleController: titleController,
      );

  // explanation input
  Widget get buildExplanationInputWidget => PlotsExplanationInputWidget(
        plotsModelService: plotsModelService,
        explanationController: explanationController,
      );

  // neighborhoodvillage input
  Widget get buildNeighborhoodVillageInputWidget =>
      PlotsNeighborhoodVillageInputWidget(
        plotsModelService: plotsModelService,
        neighborhoodVillageController: neighborhoodVillageController,
      );

  // neighborhoodnumber input
  Widget get buildNeighborhoodNumberInputWidget =>
      PlotsNeighborhoodNumberInputWidget(
        plotsModelService: plotsModelService,
        neighborhoodNumber: neighborhoodNumber,
      );

  // island input
  Widget get buildIslandInputWidget => PlotsIslandInputWidget(
        plotsModelService: plotsModelService,
        islandController: islandController,
      );

  // parcel input
  Widget get buildParcelInputWidget => PlotsParcelInputWidget(
        plotsModelService: plotsModelService,
        parcelController: parcelController,
      );

  // title deedarea input
  Widget get buildTitleDeedareInputWidget => PlotsDeedareaInputWidget(
        plotsModelService: plotsModelService,
        titleDeedAreaController: titleDeedAreaController,
      );

  // qalification input
  Widget get buildQalificationInputWidget => PlotsQalificationInputWidget(
        plotsModelService: plotsModelService,
        qualificationController: qualificationController,
      );

  // groundtype input
  Widget get buildGroundTypeInputWidget => PlotsGroundTypeInputWidget(
        plotsModelService: plotsModelService,
        groundTypeController: groundTypeController,
      );

  // sheet
  Widget get buildSheetInputWidget => PlotsSheetInputWidget(
        plotsModelService: plotsModelService,
        sheetController: sheetController,
      );

  // location
  Widget get buildLocationInputWidget => PlotsLocationInputWidget(
        plotsModelService: plotsModelService,
        locationController: locationController,
      );

  // plots status
  Widget get buildPlotsStatusWidget => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: DropdownMenu<String>(
          initialSelection: plotsSelectStatusType,
          onSelected: (String? value) {
            setState(() {
              plotsSelectStatusType = value!;
            });
          },
          textStyle: GoogleFonts.nunito(
            textStyle: context.general.textTheme.labelMedium?.copyWith(
              color: Colors.black,
            ),
          ),
          width: maxWidth,
          inputDecorationTheme: const InputDecorationTheme(
            border: InputBorder.none,
          ),
          selectedTrailingIcon: const Icon(
            Icons.arrow_downward,
            color: Colors.grey,
            size: 18,
          ),
          dropdownMenuEntries:
              plotsStatusList.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(
              value: value,
              label: value,
            );
          }).toList(),
        ),
      );

  // update button
  Widget get buildUpdateButtonWidget => PlotsUpdateButtonWidget(
        data: widget.data,
        plotsModelService: plotsModelService,
        selectCity: selectCity,
        selectDistrict: selectDistrict,
        routerService: routerService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        titleController: titleController,
        explanationController: explanationController,
        neighborhoodVillageController: neighborhoodVillageController,
        neighborhoodNumber: neighborhoodNumber,
        islandController: islandController,
        parcelController: parcelController,
        titleDeedAreaController: titleDeedAreaController,
        qualificationController: qualificationController,
        groundTypeController: groundTypeController,
        sheetController: sheetController,
        locationController: locationController,
        plotsSelectStatusType: plotsSelectStatusType,
      );
}
