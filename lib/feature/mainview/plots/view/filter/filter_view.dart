import 'package:eciftci/feature/mainview/plots/view/filter/widget/plotsfilterlist_widget.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/plots_enum/plots_enum.dart';
import 'package:eciftci/product/model/mainview_model/mainplots_model/plots_model/plots_model.dart';
import 'package:eciftci/product/utility/base/mainview_base/plots_base/plots_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class PlotsFilterView extends StatefulWidget {
  const PlotsFilterView({super.key});

  @override
  State<PlotsFilterView> createState() => _PlotsFilterViewState();
}

class _PlotsFilterViewState extends MainPlotsBase<PlotsFilterView> {
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
          text: "Arazi Filtreleme",
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: <Widget>[
          // filter settings
          buildFilterSettingsWidget,

          // plot list
          buildPlotsListWidget,
        ],
      ),
    );
  }

  // filter settings
  Widget get buildFilterSettingsWidget => Padding(
        padding: context.padding.horizontalLow,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: <Widget>[
              // plots status select
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: maxWidth,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5, left: 5),
                        child: LabelMediumBlackText(
                          text:
                              PlotsViewStrings.plotsFilterStatusInputText.value,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                        value: plotsModelService.plotsSelectStatusType,
                        elevation: 16,
                        style: GoogleFonts.nunito(
                          textStyle:
                              context.general.textTheme.labelMedium?.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        isExpanded: true,
                        onChanged: (String? value) {
                          setState(() {
                            plotsModelService.plotsSelectStatusType = value!;
                          });
                        },
                        items: plotsStatusList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                    ),
                  ],
                ),
              ),
              // plots create year select
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: maxWidth,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5, left: 5),
                        child: LabelMediumBlackText(
                          text: PlotsViewStrings
                              .plotsFilterCreateYearSelectInputText.value,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<int>(
                          value: plotsModelService.selectedYear,
                          style: GoogleFonts.nunito(
                            textStyle:
                                context.general.textTheme.labelMedium?.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          isExpanded: true,
                          onChanged: (int? newValue) {
                            setState(() {
                              plotsModelService.selectedYear = newValue!;
                            });
                          },
                          items: plotsModelService.years.map((int year) {
                            return DropdownMenuItem<int>(
                              value: year,
                              child: Text(year.toString()),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  // plots list
  Widget get buildPlotsListWidget => PlotsFilterListWidget(
        routerService: routerService,
        plotsModelService: plotsModelService,
      );
}
