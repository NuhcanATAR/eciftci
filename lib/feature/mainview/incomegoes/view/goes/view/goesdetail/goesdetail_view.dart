import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/goesdetail/widget/category_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/goesdetail/widget/explanation_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/goesdetail/widget/footerbuttons_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/goesdetail/widget/goesdate_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/goesdetail/widget/title_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/goesdetail/widget/value_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/goes_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/goes_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/goes_base/maingoes_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class GoesDetailView extends StatefulWidget {
  const GoesDetailView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<GoesDetailView> createState() => _GoesDetailViewState();
}

class _GoesDetailViewState extends MainGoesBase<GoesDetailView> {
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
          text: "Gider Detayı",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<GoesCubit, MainGoesState>(
        listener: goesDeleteListenerBloc,
        builder: (context, state) {
          return Padding(
            padding: context.padding.low,
            child: Column(
              children: <Widget>[
                // main body widget
                buildMainBodyWidget,
                // footer buttons widget
                buildFooterButtonsWidget,
              ],
            ),
          );
        },
      ),
    );
  }

  // main body widget
  Widget get buildMainBodyWidget => Expanded(
        child: Padding(
          padding: context.padding.low,
          child: ListView(
            children: <Widget>[
              // category
              buildGoesCategoryWidget,
              // title
              buildGoesTitleWidget,
              // explanation
              buildGoesExplanationWidget,
              // goes value
              buildGoesValueWidget,
              // goes date
              buildGoesDateWidget,
            ],
          ),
        ),
      );
  // category
  Widget get buildGoesCategoryWidget => GoesCategoryWidget(
        data: widget.data,
        maxWidth: maxWidth,
      );

  // title
  Widget get buildGoesTitleWidget => GoesTitleWidget(
        data: widget.data,
        maxWidth: maxWidth,
      );
  // explanation
  Widget get buildGoesExplanationWidget => GoesExplanationWidget(
        data: widget.data,
        maxWidth: maxWidth,
      );

  // goes value
  Widget get buildGoesValueWidget => GoesValueWidget(
        data: widget.data,
      );

  // goes date
  Widget get buildGoesDateWidget => GoesDateWidget(
        data: widget.data,
      );

  // footer buttons widget
  Widget get buildFooterButtonsWidget => FooterButtonsWidget(
        data: widget.data,
        routerService: routerService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
