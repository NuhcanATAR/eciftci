import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/updategoes_category/widget/categoryinput_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/updategoes_category/widget/categoryupdatebutton_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/updategoes_category/widget/titlesubtitle_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/maingoes_bloc/goescategory_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/maingoes_base/goes_base/categorygoes_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../../product/bloc/mainview_bloc/maingoes_bloc/goescategory_bloc/cubit/cubit.dart';

class GoesCategoryUpdateView extends StatefulWidget {
  const GoesCategoryUpdateView({required this.data, super.key});

  final Map<String, dynamic> data;

  @override
  State<GoesCategoryUpdateView> createState() => _GoesCategoryUpdateViewState();
}

class _GoesCategoryUpdateViewState
    extends MainGoesCategoryBase<GoesCategoryUpdateView> {
  late TextEditingController categoryUpdateNameController =
      TextEditingController(
    text: widget.data['CATEGORYNAME'],
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
          text: "Gider Kategorisi Güncelle",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<GoesCategoryCubit, MainGoesCategoryState>(
        listener: goesCategoryUpdateListenerBloc,
        builder: (context, state) {
          return Form(
            key: goesCategoryModelService.formGoesCategoryUpdateKey,
            child: Padding(
              padding: context.padding.low,
              child: Column(
                children: <Widget>[
                  // main body
                  buildMainBodyWidget,
                  // update button
                  buildUpdateButtonWidget,
                ],
              ),
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
            // title & sub title
            buildTitleSubTitleWidget,
            // category input
            buildCategoryInputWidget,
          ],
        ),
      );

  // title & sub title
  Widget get buildTitleSubTitleWidget => TitleSubTitleWidget(
        maxWidth: maxWidth,
      );

  // category input
  Widget get buildCategoryInputWidget => CategoryInputWidget(
        goesCategoryModelService: goesCategoryModelService,
        categoryNameUpdateController: categoryUpdateNameController,
      );

  // update button
  Widget get buildUpdateButtonWidget => CategoryUpdateButtonWidget(
        goesCategoryModelService: goesCategoryModelService,
        routerService: routerService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
        categoryNameUpdate: categoryUpdateNameController,
        data: widget.data,
      );
}
