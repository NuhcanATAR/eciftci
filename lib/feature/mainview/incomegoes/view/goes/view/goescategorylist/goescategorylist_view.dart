import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/goescategorylist/view/errorcategorylist_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/goescategorylist/view/loadingcategorylist_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/goescategorylist/view/nocategorylist_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/goescategorylist/widget/categorycard_widget.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/maingose_base/goes_base/categorygoes_base.dart';
import 'package:eciftci/product/utility/database/mainview_db/goes_db/goes_db.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class GoesCategoryListView extends StatefulWidget {
  const GoesCategoryListView({super.key});

  @override
  State<GoesCategoryListView> createState() => _GoesCategoryListViewState();
}

class _GoesCategoryListViewState
    extends MainGoesCategoryBase<GoesCategoryListView> {
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
          text: "Gider Kategorilerim",
          textAlign: TextAlign.center,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                routerService.goesCreateCategoryViewNavigatorRouter(context);
              },
              child: Icon(
                Icons.add,
                color: MainAppColorConstant.mainColorBackground,
                size: 18,
              ),
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: GoesServiceDB.INCOMEGOESCATEGORYS.goesCategoryListTable,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return buildListErrorViewWidget;
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return buildListLoadingViewWidget;
          }

          if (snapshot.hasData &&
              snapshot.data != null &&
              snapshot.data!.docs.isNotEmpty) {
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return buildGoesCategoryCardWidget(context, data);
              }).toList(),
            );
          } else {
            return buildListNoViewWidget;
          }
        },
      ),
    );
  }

  // goes category card  widget
  Widget buildGoesCategoryCardWidget(
          BuildContext context, Map<String, dynamic> data) =>
      GoesCategoryCardWidget(
        data: data,
        routerService: routerService,
      );

  // list error view
  Widget get buildListErrorViewWidget => const GoesCategoryListErrorView();

  // list loading view
  Widget get buildListLoadingViewWidget => const GoesCategoryLoadingListView();

  // list no view
  Widget get buildListNoViewWidget => const GoesCategoryNoListView();
}
