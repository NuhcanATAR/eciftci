import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/product/utility/database/mainview_db/goes_db/goes_db.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../product/widget/text_widget/label_medium_text.dart';

class GoesCategoryWidget extends StatelessWidget {
  const GoesCategoryWidget(
      {required this.data, required this.maxWidth, super.key});

  final Map<String, dynamic> data;
  final dynamic maxWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FutureBuilder<DocumentSnapshot>(
          future: GoesServiceDB.INCOMEGOESCATEGORYS
              .goesMainCategoryDocRef(data)
              .get(),
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
              return LabelMediumBlackText(
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
