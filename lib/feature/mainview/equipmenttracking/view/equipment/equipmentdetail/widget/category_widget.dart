import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/product/utility/database/mainview_db/equipmenttracking_db/equipmenttracking_db.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class EquipmentCategoryWidget extends StatelessWidget {
  const EquipmentCategoryWidget(
      {required this.maxWidth, required this.data, super.key});

  final dynamic maxWidth;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: FutureBuilder<DocumentSnapshot>(
          future: EquipmentTrackingDB.EQUIPMENTCATEGORYS
              .equipmentCategoryIDRef(data),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const SizedBox();
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return const SizedBox();
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> dataCategory =
                  snapshot.data!.data() as Map<String, dynamic>;
              return LabelMediumGreyText(
                text: dataCategory['CATEGORYNAME'],
                textAlign: TextAlign.left,
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
