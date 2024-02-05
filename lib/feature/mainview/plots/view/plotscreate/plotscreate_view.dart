import 'package:eciftci/feature/mainview/plots/view/plotscreate/widget/explanationinput_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotscreate/widget/groundtypeinput_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotscreate/widget/islandinput_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotscreate/widget/locationinput_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotscreate/widget/neighborhoodnumberinput_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotscreate/widget/neighborhoodvillageinput_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotscreate/widget/parcelinput_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotscreate/widget/qalificationinput_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotscreate/widget/savebutton_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotscreate/widget/sheetinput_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotscreate/widget/titledeedareainput_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotscreate/widget/titleinput_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainplots_bloc/plots_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainplots_bloc/plots_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/plots_enum/plots_enum.dart';
import 'package:eciftci/product/model/mainview_model/mainplots_model/plots_model/plots_model.dart';
import 'package:eciftci/product/utility/base/mainview_base/plots_base/plots_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class PlotsCreateView extends StatefulWidget {
  const PlotsCreateView({super.key});

  @override
  State<PlotsCreateView> createState() => _PlotsCreateViewState();
}

class _PlotsCreateViewState extends MainPlotsBase<PlotsCreateView> {
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
            text: "Arazi Oluşturma",
            textAlign: TextAlign.center,
          ),
        ),
        body: BlocConsumer<PlotsCubit, PlotsState>(
          listener: plotsAddListenerBloc,
          builder: (context, state) {
            return Form(
              key: plotsModelService.formPlotsSaveKey,
              child: Padding(
                padding: context.padding.low,
                child: ListView(
                  children: <Widget>[
                    // title input
                    buildTitleInputWidget,
                    // explanation input
                    buildExplanationInputWidget,
                    // city & district
                    buildCityDistrictWidget,
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
                    // save button
                    buildSaveButtonWidget,
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
      );

  // explanation input
  Widget get buildExplanationInputWidget => PlotsExplanationInputWidget(
        plotsModelService: plotsModelService,
      );

  // city & district
  Widget get buildCityDistrictWidget => Column(
        children: <Widget>[
          // city
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<mainUserCity>(
                  validator: (value) =>
                      value == null ? "Şehir alanı boş bırakılamaz" : null,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  hint: LabelMediumBlackText(
                    text: PlotsViewStrings.plotsInputCityInputText.value,
                    textAlign: TextAlign.left,
                  ),
                  icon: const Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 18,
                  ),
                  elevation: 16,
                  style: GoogleFonts.nunito(
                    textStyle:
                        Theme.of(context).textTheme.labelMedium!.copyWith(
                              color: Colors.black,
                            ),
                  ),
                  onChanged: (mainUserCity? value) {
                    setState(() {
                      selectCity = value;
                      selectDistrict = null;
                      selectDistrictList.clear();
                    });
                  },
                  items: cityList.map((mainUserCity city) {
                    return DropdownMenuItem(
                      value: city,
                      child: Text(city.cityName),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),

          // district control
          selectCity != null
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField<mainUserDistrict>(
                        validator: (value) =>
                            value == null ? "İlçe alanı boş bırakılamaz" : null,
                        isExpanded: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        hint: LabelMediumBlackText(
                          text: PlotsViewStrings
                              .plotsInputDistirctInputText.value,
                          textAlign: TextAlign.left,
                        ),
                        style: GoogleFonts.nunito(
                          textStyle:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                        icon: const Icon(
                          Icons.location_city,
                          color: Colors.grey,
                          size: 18,
                        ),
                        elevation: 16,
                        value: selectDistrict,
                        onChanged: (mainUserDistrict? value) {
                          setState(() {
                            selectDistrict = value;
                            selectDistrictList.clear();
                          });
                        },
                        items: selectCity!.subDistrictList
                            .map((mainUserDistrict district) {
                          return DropdownMenuItem(
                            value: district,
                            child: Text(district.districtName),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      );

  // neighborhoodvillage input
  Widget get buildNeighborhoodVillageInputWidget =>
      PlotsNeighborhoodVillageInputWidget(
        plotsModelService: plotsModelService,
      );

  // neighborhoodnumber input
  Widget get buildNeighborhoodNumberInputWidget =>
      PlotsNeighborhoodNumberInputWidget(
        plotsModelService: plotsModelService,
      );

  // island input
  Widget get buildIslandInputWidget => PlotsIslandInputWidget(
        plotsModelService: plotsModelService,
      );

  // parcel input
  Widget get buildParcelInputWidget => PlotsParcelInputWidget(
        plotsModelService: plotsModelService,
      );

  // title deedarea input
  Widget get buildTitleDeedareInputWidget => PlotsDeedareaInputWidget(
        plotsModelService: plotsModelService,
      );

  // qalification input
  Widget get buildQalificationInputWidget => PlotsQalificationInputWidget(
        plotsModelService: plotsModelService,
      );

  // groundtype input
  Widget get buildGroundTypeInputWidget => PlotsGroundTypeInputWidget(
        plotsModelService: plotsModelService,
      );

  // sheet
  Widget get buildSheetInputWidget => PlotsSheetInputWidget(
        plotsModelService: plotsModelService,
      );

  // location
  Widget get buildLocationInputWidget => PlotsLocationInputWidget(
        plotsModelService: plotsModelService,
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
          initialSelection: plotsModelService.plotsSelectStatusType,
          onSelected: (String? value) {
            setState(() {
              plotsModelService.plotsSelectStatusType = value!;
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

  // save button
  Widget get buildSaveButtonWidget => PlotsSaveButtonWidget(
        plotsModelService: plotsModelService,
        selectCity: selectCity,
        selectDistrict: selectDistrict,
        routerService: routerService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
