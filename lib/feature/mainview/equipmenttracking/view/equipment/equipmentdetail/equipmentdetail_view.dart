import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/equipmentdetail/widget/category_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/equipmentdetail/widget/equipmentdetailtable_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/equipmentdetail/widget/footerbuttons_widget.dart';
import 'package:eciftci/feature/mainview/equipmenttracking/view/equipment/equipmentdetail/widget/titleexplanation_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainequipment_bloc/equipment_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainequipment_bloc/equipment_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/mainequipmenttracking_base/equipmenttracking_base/equipmenttracking_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class EquipmentDetailView extends StatefulWidget {
  const EquipmentDetailView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<EquipmentDetailView> createState() => _EquipmentDetailViewState();
}

class _EquipmentDetailViewState
    extends MainEquipmentTrackingBase<EquipmentDetailView> {
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
          text: "Ekipman Detayı",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<EquipmentCubit, EquipmentState>(
        listener: equipmentDeleteListenerBloc,
        builder: (context, state) {
          return Padding(
            padding: context.padding.low,
            child: Column(
              children: <Widget>[
                // main body
                buildMainBodyWidget,
                // footer buttons
                buildFooterButtonsWidget,
              ],
            ),
          );
        },
      ),
    );
  }

  // main body
  Widget get buildMainBodyWidget => Expanded(
        child: ListView(
          children: <Widget>[
            // category
            buildCategoryWidget,
            // title & explanation
            buildTitleExplanationWidget,
            // equipment information table
            buildEquipmentInformationTableWidget,
          ],
        ),
      );

  // category
  Widget get buildCategoryWidget => EquipmentCategoryWidget(
        maxWidth: maxWidth,
        data: widget.data,
      );

  // title & explanation
  Widget get buildTitleExplanationWidget => EquipmentTitleExplanationWidget(
        data: widget.data,
        maxWidth: maxWidth,
      );

  // equipment information table
  Widget get buildEquipmentInformationTableWidget =>
      EquipmentInformationTableWidget(
        maxWidth: maxWidth,
        data: widget.data,
      );

  // footer buttons
  Widget get buildFooterButtonsWidget => EquipmentDetailFooterButtonsWidget(
        data: widget.data,
        routerService: routerService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
