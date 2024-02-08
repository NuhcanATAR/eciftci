import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/maintenanceservice/maintenanceservicelist/view/listerror_view.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/maintenanceservice/maintenanceservicelist/view/listloading_view.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/maintenanceservice/maintenanceservicelist/view/listno_view.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/maintenanceservice/maintenanceservicelist/widget/maintenanceservicecard_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainequipment_bloc/maintenanceservice_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainequipment_bloc/maintenanceservice_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/equipmenttracking_enum/maintenanceservice_enum/maintenanceservice_enum.dart';
import 'package:eciftci/product/utility/database/mainview_db/equipmenttracking_db/equipmenttracking_db.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../../../product/utility/base/mainview_base/mainequipmenttracking_base/maintenanceservice_base/maintenanceservice_base.dart';

class MaintenanceServiceListView extends StatefulWidget {
  const MaintenanceServiceListView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<MaintenanceServiceListView> createState() =>
      _MaintenanceServiceListViewState();
}

class _MaintenanceServiceListViewState
    extends MaintenanceServiceBase<MaintenanceServiceListView> {
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
          text: "Servis ve Bakım Bilgileri",
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          routerService.maintenanceServiceCreateViewNavigatorRouter(
              context, widget.data);
        },
        backgroundColor: MainAppColorConstant.mainColorBackground,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 18,
        ),
      ),
      body: BlocConsumer<MaintenanceServiceCubit, MaintenanceServiceState>(
        listener: maintenanceServiceDeleteListenerBloc,
        builder: (context, state) {
          return Padding(
            padding: context.padding.low,
            child: Column(
              children: <Widget>[
                // filter setting
                buildFilterSettingWidget,
                // main body
                buildMainBodyWidget,
              ],
            ),
          );
        },
      ),
    );
  }

  // filter setting
  Widget get buildFilterSettingWidget => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: <Widget>[
            // service status
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: maxWidth,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5, left: 5),
                      child: LabelMediumBlackText(
                        text: MaintenanceServiceViewStrings
                            .maintenanceServiceFilterStatusInputText.value,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: DropdownButton<String>(
                      value: modelService.completionStatusSelect,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                        size: 18,
                      ),
                      elevation: 16,
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.labelMedium?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      isExpanded: true,
                      underline: Container(
                        height: 1,
                        color: Colors.transparent,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          modelService.completionStatusSelect = value!;
                        });
                      },
                      items: modelService.completionStatusList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            // year
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: maxWidth,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5, left: 5),
                      child: LabelMediumBlackText(
                        text: MaintenanceServiceViewStrings
                            .maintenanceServiceFilterYearInputText.value,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        value: modelService.selectedYear,
                        style: GoogleFonts.nunito(
                          textStyle:
                              context.general.textTheme.labelMedium?.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        isExpanded: true,
                        onChanged: (int? newValue) {
                          setState(() {
                            modelService.selectedYear = newValue!;
                          });
                        },
                        items: modelService.years.map((int year) {
                          return DropdownMenuItem<int>(
                            value: year,
                            child: Text(year.toString()),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  // main body
  Widget get buildMainBodyWidget => Expanded(
        child: StreamBuilder<QuerySnapshot>(
          stream: EquipmentTrackingDB.EQUIPMENTTRACKING.maintenanceServiceList(
            widget.data,
            modelService.selectedYear,
            modelService.completionStatusSelect.toString(),
          ),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return buildListErrorWidget;
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return buildListLoadingWidget;
            }

            if (snapshot.hasData &&
                snapshot.data != null &&
                snapshot.data!.docs.isNotEmpty) {
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> dataService =
                      document.data()! as Map<String, dynamic>;
                  return buildMaintenanceServiceCardWidget(
                      context, dataService);
                }).toList(),
              );
            } else {
              return buildListNoWidget;
            }
          },
        ),
      );

  // maintenance service card
  Widget buildMaintenanceServiceCardWidget(
          BuildContext context, Map<String, dynamic> data) =>
      MaintenanceServiceCardWidget(
        data: data,
        routerService: routerService,
      );

  // list error view
  Widget get buildListErrorWidget => const MaintenanceServiceListErrorView();

  // list loading view
  Widget get buildListLoadingWidget =>
      const MaintenanceServiceListLoadingView();

  // list no view
  Widget get buildListNoWidget => const MaintenanceServiceListNoView();
}
