import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/filter/widget/goesfilterlist_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/filter/widget/totalgoescard_widget.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/goes_enum/goes_enum.dart';
import 'package:eciftci/product/utility/base/mainview_base/goesfilter_base/goesfilter_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../../product/model/mainview_model/goesfilter_model/goesfilter_model.dart';

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends MainGoesFilterBase<FilterView> {
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
          text: "Gider Filtreleme",
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: <Widget>[
          // filter settings
          buildFilterSettingsWidget,
          // total goes value
          buildTotalGoesValueCardWidget,
          // goes list
          buildGoesListWidget,
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
              // category select
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: maxWidth,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: LabelMediumBlackText(
                          text: GoesViewStrings.goesCategoryInputText.value,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child: DropdownButtonFormField<MainGoesCategory>(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        validator: (value) =>
                            value == null ? "* Zorunlu alan" : null,
                        value: selectMainGoesCategory,
                        isExpanded: true,
                        hint: LabelMediumBlackText(
                          text: GoesViewStrings.goesCategoryInputText.value,
                          textAlign: TextAlign.left,
                        ),
                        onChanged: (MainGoesCategory? categoryMain) {
                          setState(() {
                            selectMainGoesCategory = categoryMain;
                          });
                        },
                        items: mainGoesCategory
                            .map<DropdownMenuItem<MainGoesCategory>>(
                                (MainGoesCategory categoryM) {
                          return DropdownMenuItem<MainGoesCategory>(
                            value: categoryM,
                            child: Text(
                              categoryM.categoryName,
                              style: GoogleFonts.nunito(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              // goes year select
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
                          text: GoesViewStrings.goesFilterYearMenuText.value,
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
                          value: modelService.selectedYear,
                          style: GoogleFonts.nunito(
                            textStyle:
                                context.general.textTheme.labelMedium?.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          isExpanded: true,
                          onChanged: (int? newValue) {
                            setState(() {
                              modelService.selectedYear = newValue!;
                            });
                          },
                          items: modelService.years.map((int year) {
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

  // total goes value
  Widget get buildTotalGoesValueCardWidget => TotalGoesCardWidget(
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        calculateFilterTotalPrice: calculateFilterTotalPrice,
      );

  // goes list
  Widget get buildGoesListWidget => GoesFilterListWidget(
        selectMainGoesCategory: selectMainGoesCategory,
        modelService: modelService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        routerService: routerService,
      );
}
