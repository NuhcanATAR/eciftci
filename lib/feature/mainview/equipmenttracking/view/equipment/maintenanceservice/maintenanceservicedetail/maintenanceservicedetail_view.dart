import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/maintenanceservice/maintenanceservicedetail/widget/explanation_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/maintenanceservice/maintenanceservicedetail/widget/footerbutton_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/maintenanceservice/maintenanceservicedetail/widget/serviceinformationtable_widget.dart';
import 'package:eciftci/product/constants/color_constant.dart';

import 'package:eciftci/product/utility/base/mainview_base/mainequipmenttracking_base/maintenanceservice_base/maintenanceservice_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class MaintenanceServiceDetailView extends StatefulWidget {
  const MaintenanceServiceDetailView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<MaintenanceServiceDetailView> createState() =>
      _MaintenanceServiceDetailViewState();
}

class _MaintenanceServiceDetailViewState
    extends MaintenanceServiceBase<MaintenanceServiceDetailView> {
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
          text: "Servis ve Bakım Bilgisi Detayı",
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: context.padding.low,
        child: Column(
          children: <Widget>[
            // main body
            buildMainBodyWidget,
            // footer button
            buildFooterButtonWidget,
          ],
        ),
      ),
    );
  }

  // main body
  Widget get buildMainBodyWidget => Expanded(
        child: ListView(
          children: <Widget>[
            // explanation
            buildExplanationWidget,
            // information table
            buildInformationTableWidget,
          ],
        ),
      );

  // explanation
  Widget get buildExplanationWidget => MaintenanceServiceExplanationWidget(
        data: widget.data,
        maxWidth: maxWidth,
      );

  // information table
  Widget get buildInformationTableWidget =>
      MaintenanceServiceInformationTableWidget(
        data: widget.data,
        maxWidth: maxWidth,
      );

  // footer button
  Widget get buildFooterButtonWidget =>
      MaintenanceServiceDetailFooterButtonWidget(
        data: widget.data,
        routerService: routerService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
