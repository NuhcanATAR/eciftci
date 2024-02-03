import 'package:eciftci/feature/mainview/connectionerror/connectionerror_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/create_income/createincome_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/incomedetail/incomedetail_view.dart';
import 'package:flutter/material.dart';

import '../../../../feature/mainview/incomegoes/view/income/view/createincome_category/createincome_category_view.dart';
import '../../../../feature/mainview/incomegoes/view/income/view/filter/filter_view.dart';
import '../../../../feature/mainview/incomegoes/view/income/view/incomecategorylist/incomecategorylist_view.dart';
import '../../../../feature/mainview/incomegoes/view/income/view/search/search_view.dart';

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
}
