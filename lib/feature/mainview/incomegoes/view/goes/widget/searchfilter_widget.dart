import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GoesSearchFilterWidget extends StatelessWidget {
  const GoesSearchFilterWidget({required this.routerService, super.key});

  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Row(
        children: <Widget>[
          // search
          Expanded(
            child: GestureDetector(
              onTap: () {
                routerService.searchViewNavigatorRouter(context);
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
                child: const Row(
                  children: <Widget>[
                    Icon(
                      Icons.search_outlined,
                      color: Colors.grey,
                      size: 18,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: LabelMediumGreyText(
                          text: "Gider Başlığı Ara",
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // filter
          GestureDetector(
            onTap: () {
              routerService.filterViewNavigatorRouter(context);
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
        ],
      ),
    );
  }
}
