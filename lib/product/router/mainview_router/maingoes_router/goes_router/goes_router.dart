import 'package:eciftci/feature/mainview/connectionerror/connectionerror_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/create_goes/creategoes_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/creategoes_category/creategoes_category_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/filter/filter_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/goescategorylist/goescategorylist_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/goesdetail/goesdetail_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/goesdetail/view/goesupdate/goesupdate_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/search/search_view.dart';
import 'package:eciftci/product/enums/mainview_enum/maingoes_enum/goes_enum/goes_enum.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/mainview_bloc/maingoes_bloc/goes_bloc/cubit/cubit.dart';

class GoesRouterService {
  // goes category list view
  void goesCategoryListViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GoesCategoryListView(),
      ),
    );
  }

  // connection error view
  void connectionErrorViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ConnectionErrorView(),
      ),
    );
  }

  // create goes
  void goesCreateViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateGoesView(),
      ),
    );
  }

  // create goes category
  void goesCreateCategoryViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateGoesCategoryView(),
      ),
    );
  }

  // search view router
  void searchViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchView(),
      ),
    );
  }

  // filter view router
  void filterViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FilterView(),
      ),
    );
  }

  // goes detail
  void goesDetailViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GoesDetailView(
          data: data,
        ),
      ),
    );
  }

  // goes update
  void goesUpdateViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GoesUpdateView(
          data: data,
        ),
      ),
    );
  }

  // delete dialog
  void goesDeleteDialog(BuildContext context, Map<String, dynamic> data) {
    var alertDialog = AlertDialog(
      title: BodyMediumBlackBoldText(
        text: GoesViewStrings.dialogGoesDeleteTitleText.value,
        textAlign: TextAlign.center,
      ),
      content: LabelMediumBlackText(
        text: GoesViewStrings.dialogGoesDeleteSubTitleText.value,
        textAlign: TextAlign.center,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const LabelMediumBlackBoldText(
                    text: "Kapat",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<GoesCubit>(context).goesDelete(data);
                    Navigator.pop(context);
                  },
                  child: const LabelMediumMainColorText(
                    text: "Kaldır",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }
}
