import 'package:eciftci/feature/mainview/incomegoes/view/income/view/incomedetail/view/incomeupdate/widget/incomeexplanation_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/incomedetail/view/incomeupdate/widget/incomeupdatebutton_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/incomedetail/view/incomeupdate/widget/incometitle_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/incomedetail/view/incomeupdate/widget/incomevalue_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/income_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/income_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/mainincome_base/income_base/mainincome_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class IncomeUpdateView extends StatefulWidget {
  const IncomeUpdateView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<IncomeUpdateView> createState() => _IncomeUpdateViewState();
}

class _IncomeUpdateViewState extends MainIncomeBase<IncomeUpdateView> {
  late TextEditingController titleController = TextEditingController(
    text: widget.data['TITLE'],
  );

  late TextEditingController explanationController = TextEditingController(
    text: widget.data['EXPLANATION'],
  );

  late TextEditingController valueController = TextEditingController(
    text: widget.data['VALUE'].toString(),
  );
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
          text: "Gelir Güncelle",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<IncomeCubit, MainIncomeState>(
        listener: incomeUpdateListenerBloc,
        builder: (context, state) {
          return Form(
            key: modelService.formIncomeUpdateKey,
            child: Padding(
              padding: context.padding.low,
              child: ListView(
                children: <Widget>[
                  // income title
                  buildIncomeTitleInputWidget,
                  // income explanation
                  buildIncomeExplanationInputWidget,
                  // income value
                  buildIncomeValueInputWidget,
                  // update button
                  buildIncomeUpdateButtonWidget,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // income title
  Widget get buildIncomeTitleInputWidget => IncomeTitleWidget(
        modelService: modelService,
        titleController: titleController,
      );

  // income explanation
  Widget get buildIncomeExplanationInputWidget => IncomeExplanationWidget(
        modelService: modelService,
        explanationController: explanationController,
      );

  // income value
  Widget get buildIncomeValueInputWidget => IncomeValueWidget(
        modelService: modelService,
        valueController: valueController,
      );

  // update button
  Widget get buildIncomeUpdateButtonWidget => IncomeUpdateButtonWidget(
        modelService: modelService,
        selectMainIncomeCategory: selectMainIncomeCategory,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        data: widget.data,
        titleController: titleController,
        explanationController: explanationController,
        valueController: valueController,
      );
}
