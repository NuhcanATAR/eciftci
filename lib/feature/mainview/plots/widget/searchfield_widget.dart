import 'package:animate_do/animate_do.dart';
import 'package:eciftci/product/enums/mainview_enum/plots_enum/plots_enum.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PlotsSearchFieldWidget extends StatelessWidget {
  const PlotsSearchFieldWidget({required this.routerService, super.key});

  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          // search
          Expanded(
            child: FadeInLeft(
              child: GestureDetector(
                onTap: () {
                  routerService.plotsSearchViewNavigatorRouter(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.search_outlined,
                        color: Colors.grey,
                        size: 18,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: LabelMediumGreyText(
                            text: PlotsViewStrings.searchInputText.value,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // filter
          FadeInRight(
            child: GestureDetector(
              onTap: () {
                routerService.plotsFilterViewNavigatorRouter(context);
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.all(13),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                child: Icon(
                  MdiIcons.filter,
                  color: Colors.grey,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
