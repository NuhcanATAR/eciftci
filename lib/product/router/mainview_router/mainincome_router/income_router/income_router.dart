import 'package:eciftci/feature/mainview/connectionerror/connectionerror_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/create_income/createincome_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/incomedetail/incomedetail_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/incomedetail/view/incomeupdate/incomeupdate_view.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainincome_bloc/income_bloc/cubit/cubit.dart';
import 'package:eciftci/product/enums/mainview_enum/mainincome_enum/income_enum/income_enum.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../feature/mainview/incomegoes/view/income/view/createincome_category/createincome_category_view.dart';
import '../../../../../feature/mainview/incomegoes/view/income/view/filter/filter_view.dart';
import '../../../../../feature/mainview/incomegoes/view/income/view/incomecategorylist/incomecategorylist_view.dart';
import '../../../../../feature/mainview/incomegoes/view/income/view/search/search_view.dart';

class IncomeRouterService {
  // income category list view
  void incomeCategoryListViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const IncomeCategoryListView(),
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

  // create income
  void incomeCreateViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateIncomeView(),
      ),
    );
  }

  // create income category
  void incomeCreateCategoryViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateIncomeCategoryView(),
      ),
    );
  }

  // search view router
  void searchViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const IncomeSearchView(),
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

  // income detail
  void incomeDetailViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IncomeDetailView(
          data: data,
        ),
      ),
    );
  }

  // income update
  void incomeUpdateViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IncomeUpdateView(
          data: data,
        ),
      ),
    );
  }

  // delete dialog
  void incomeDeleteDialog(BuildContext context, Map<String, dynamic> data) {
    var alertDialog = AlertDialog(
      title: BodyMediumBlackBoldText(
        text: IncomeViewStrings.dialogIncomeDeleteTitleText.value,
        textAlign: TextAlign.center,
      ),
      content: LabelMediumBlackText(
        text: IncomeViewStrings.dialogIncomeDeleteSubTitleText.value,
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
                    BlocProvider.of<IncomeCubit>(context).incomeDelete(data);
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
