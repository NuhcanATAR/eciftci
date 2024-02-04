import 'package:eciftci/feature/mainview/incomegoes/view/income/view/incomedetail/widget/category_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/incomedetail/widget/explanation_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/incomedetail/widget/footerbuttons_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/incomedetail/widget/incomedate_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/incomedetail/widget/title_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/incomedetail/widget/value_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/income_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/income_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/mainincome_base/income_base/mainincome_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class IncomeDetailView extends StatefulWidget {
  const IncomeDetailView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<IncomeDetailView> createState() => _IncomeDetailViewState();
}

class _IncomeDetailViewState extends MainIncomeBase<IncomeDetailView> {
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
          text: "Gelir Detayı",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<IncomeCubit, MainIncomeState>(
        listener: incomeDeleteListenerBloc,
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
              buildIncomeCategoryWidget,
              // title
              buildIncomeTitleWidget,
              // explanation
              buildIncomeExplanationWidget,
              // income value
              buildIncomeValueWidget,
              // income date
              buildIncomeDateWidget,
            ],
          ),
        ),
      );
  // category
  Widget get buildIncomeCategoryWidget => IncomeCategoryWidget(
        data: widget.data,
        maxWidth: maxWidth,
      );

  // title
  Widget get buildIncomeTitleWidget => IncomeTitleWidget(
        data: widget.data,
        maxWidth: maxWidth,
      );
  // explanation
  Widget get buildIncomeExplanationWidget => IncomeExplanationWidget(
        data: widget.data,
        maxWidth: maxWidth,
      );

  // income value
  Widget get buildIncomeValueWidget => IncomeValueWidget(
        data: widget.data,
      );

  // income date
  Widget get buildIncomeDateWidget => IncomeDateWidget(
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
