import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/feature/mainview/nofications/widget/noficationscard_widget.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/nofications_base/nofications_base.dart';
import 'package:eciftci/product/utility/database/mainview_db/nofications_db/nofications_db.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class NoficationsView extends StatefulWidget {
  const NoficationsView({super.key});

  @override
  State<NoficationsView> createState() => _NoficationsViewState();
}

class _NoficationsViewState extends MainNoficationsBase<NoficationsView> {
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
          text: "Uygulama Bildirimleri",
          textAlign: TextAlign.center,
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: NoficationsDB.NOFICATIONS.noficationsListQuery,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const SizedBox();
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox();
          }

          if (snapshot.hasData &&
              snapshot.data != null &&
              snapshot.data!.docs.isNotEmpty) {
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return buildNoficationCard(
                  context,
                  data,
                );
              }).toList(),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  // nofication card
  Widget buildNoficationCard(BuildContext context, Map<String, dynamic> data) =>
      NoficationsCardWidget(
        data: data,
        noficationsUrl: noficationsUrl,
        maxWidth: maxWidth,
      );
}
