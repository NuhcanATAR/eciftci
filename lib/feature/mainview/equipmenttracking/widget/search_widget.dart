import 'package:eciftci/product/enums/mainview_enum/equipmenttracking_enum/equipment_enum/equipment_enum.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class EquipementSearchInputWidget extends StatelessWidget {
  const EquipementSearchInputWidget({required this.routerService, super.key});

  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        routerService.equipmentSearchViewNavigatorRouter(context);
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
                  text: EquipmentViewStrings.homeSearchInputText.value,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
