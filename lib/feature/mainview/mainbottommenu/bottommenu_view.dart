import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/bottomenu_base/bottommenu_base.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomMenuView extends StatefulWidget {
  const BottomMenuView({super.key});

  @override
  State<BottomMenuView> createState() => _BottomMenuViewState();
}

class _BottomMenuViewState extends MainBottomMenuBase<BottomMenuView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => menuRouterService.showExitPopup(context),
      child: Scaffold(
        body: modelService.viewList[modelService.selectedViewIndex],
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              modelService.selectedViewIndex = index;
            });
          },
          backgroundColor: Colors.white,
          indicatorColor: Colors.transparent,
          selectedIndex: modelService.selectedViewIndex,
          height: 80,
          destinations: <Widget>[
            NavigationDestination(
              selectedIcon: Icon(
                MdiIcons.finance,
                color: MainAppColorConstant.mainColorBackground,
                size: 21,
              ),
              icon: Icon(
                MdiIcons.finance,
                color: Colors.grey,
                size: 21,
              ),
              label: '',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                MdiIcons.landPlots,
                color: MainAppColorConstant.mainColorBackground,
                size: 21,
              ),
              icon: Icon(
                MdiIcons.landPlots,
                color: Colors.grey,
                size: 21,
              ),
              label: '',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                MdiIcons.home,
                color: MainAppColorConstant.mainColorBackground,
                size: 21,
              ),
              icon: Icon(
                MdiIcons.homeOutline,
                color: Colors.grey,
                size: 21,
              ),
              label: '',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                MdiIcons.calendarRange,
                color: MainAppColorConstant.mainColorBackground,
                size: 21,
              ),
              icon: Icon(
                MdiIcons.calendarRangeOutline,
                color: Colors.grey,
                size: 21,
              ),
              label: '',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                MdiIcons.carSettings,
                color: MainAppColorConstant.mainColorBackground,
                size: 21,
              ),
              icon: Icon(
                MdiIcons.carSettings,
                color: Colors.grey,
                size: 21,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
