import 'package:eciftci/feature/mainview/connectionerror/connectionerror_view.dart';
import 'package:eciftci/feature/mainview/eguide/eguide_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/search/search_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/search/search_view.dart';
import 'package:eciftci/feature/mainview/nofications/nofications_view.dart';
import 'package:eciftci/feature/mainview/plots/view/search/search_view.dart';
import 'package:eciftci/feature/mainview/profile/profile_view.dart';
import 'package:flutter/material.dart';

class HomeServiceRouter {
  // connection error view
  void connectionErrorViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ConnectionErrorView(),
      ),
    );
  }

  // profile view
  void profileViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfileView(),
      ),
    );
  }

  // application nofications view
  void applicationNoficationsViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NoficationsView(),
      ),
    );
  }

  // plots list view
  void plotsListViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PlotsSearchView(),
      ),
    );
  }

  // goes list view
  void goesListViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GoesSearchView(),
      ),
    );
  }

  // income list view
  void incomeLitViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const IncomeSearchView(),
      ),
    );
  }

  // e-guide view
  void eguideViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EGuideView(),
      ),
    );
  }
}
