import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/incomecategorylist/view/errorcategorylist_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/incomecategorylist/view/loadingcategorylist_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/incomecategorylist/view/nocategorylist_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/incomecategorylist/widget/categorycard_widget.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/mainincome_base/income_base/categoryincome_base.dart';
import 'package:eciftci/product/utility/database/mainview_db/income_db/income_db.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class IncomeCategoryListView extends StatefulWidget {
  const IncomeCategoryListView({super.key});

  @override
  State<IncomeCategoryListView> createState() => _IncomeCategoryListViewState();
}

class _IncomeCategoryListViewState
    extends MainIncomeCategoryBase<IncomeCategoryListView> {
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
          text: "Gelir Kategorilerim",
          textAlign: TextAlign.center,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                routerService.incomeCreateCategoryViewNavigatorRouter(context);
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
        stream: IncomeServiceDB.INCOMEGOESCATEGORYS.incomeCategoryListTable,
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
                return buildIncomeCategoryCardWidget(context, data);
              }).toList(),
            );
          } else {
            return buildListNoViewWidget;
          }
        },
      ),
    );
  }

  // income category card  widget
  Widget buildIncomeCategoryCardWidget(
          BuildContext context, Map<String, dynamic> data) =>
      IncomeCategoryCardWidget(
        data: data,
        routerService: routerService,
      );

  // list error view
  Widget get buildListErrorViewWidget => const IncomeCategoryListErrorView();

  // list loading view
  Widget get buildListLoadingViewWidget =>
      const IncomeCategoryLoadingListView();

  // list no view
  Widget get buildListNoViewWidget => const IncomeCategoryNoListView();
}
