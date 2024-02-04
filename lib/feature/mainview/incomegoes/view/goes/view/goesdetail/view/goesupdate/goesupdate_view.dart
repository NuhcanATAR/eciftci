import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/goesdetail/view/goesupdate/widget/goesexplanation_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/goesdetail/view/goesupdate/widget/goestitle_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/goesdetail/view/goesupdate/widget/goesupdatebutton_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/goesdetail/view/goesupdate/widget/goesvalue_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/goes_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/goes_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/maingose_base/goes_base/maingoes_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class GoesUpdateView extends StatefulWidget {
  const GoesUpdateView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<GoesUpdateView> createState() => _GoesUpdateViewState();
}

class _GoesUpdateViewState extends MainGoesBase<GoesUpdateView> {
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
      body: BlocConsumer<GoesCubit, MainGoesState>(
        listener: goesUpdateListenerBloc,
        builder: (context, state) {
          return Form(
            key: modelService.formGoesUpdateKey,
            child: Padding(
              padding: context.padding.low,
              child: ListView(
                children: <Widget>[
                  // goes title
                  buildGoesTitleInputWidget,
                  // goes explanation
                  buildGoesExplanationInputWidget,
                  // goes value
                  buildGoesValueInputWidget,
                  // update button
                  buildGoesUpdateButtonWidget,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // goes title
  Widget get buildGoesTitleInputWidget => GoesTitleWidget(
        modelService: modelService,
        titleController: titleController,
      );

  // goes explanation
  Widget get buildGoesExplanationInputWidget => GoesExplanationWidget(
        modelService: modelService,
        explanationController: explanationController,
      );

  // goes value
  Widget get buildGoesValueInputWidget => GoesValueWidget(
        modelService: modelService,
        valueController: valueController,
      );

  // update button
  Widget get buildGoesUpdateButtonWidget => GoesUpdateButtonWidget(
        modelService: modelService,
        selectMainGoesCategory: selectMainGoesCategory,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        data: widget.data,
        titleController: titleController,
        explanationController: explanationController,
        valueController: valueController,
      );
}
