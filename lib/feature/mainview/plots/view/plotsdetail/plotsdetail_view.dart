import 'package:eciftci/feature/mainview/plots/view/plotsdetail/widget/footerbuttons_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/widget/plotsdate_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/widget/plotsexplanation_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/widget/plotsinformationdetailtable_widget.dart';
import 'package:eciftci/feature/mainview/plots/view/plotsdetail/widget/plotstitle_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainplots_bloc/plots_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainplots_bloc/plots_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/plots_base/plots_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class PlotsDetailView extends StatefulWidget {
  const PlotsDetailView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<PlotsDetailView> createState() => _PlotsDetailViewState();
}

class _PlotsDetailViewState extends MainPlotsBase<PlotsDetailView> {
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
          text: "Arazi Detayı",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<PlotsCubit, PlotsState>(
        listener: plotsDeleteListenerBloc,
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
            // date
            buildDateWidget,
            // title
            buildTitleWidget,
            // explanation
            buildExplanationWidget,
            // information detail table
            buildInformationDetailTableWidget,
          ],
        ),
      );

  // date
  Widget get buildDateWidget => PlotsDateWidget(
        data: widget.data,
      );

  // title
  Widget get buildTitleWidget => PlotsTitleWidget(
        data: widget.data,
      );

  // explanation
  Widget get buildExplanationWidget => PlotsExplanationWidget(
        data: widget.data,
      );

  // information detail table
  Widget get buildInformationDetailTableWidget =>
      PlotsInformationDetailTableWidget(
        data: widget.data,
      );

  // footer buttons
  Widget get buildFooterButtonsWidget => PlotsDetailFooterButtonsWidget(
        data: widget.data,
        routerService: routerService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
