import 'package:eciftci/feature/mainview/incomegoes/view/income/view/createincome_category/widget/categoryinput_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/createincome_category/widget/categorysavedbutton_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/createincome_category/widget/titlesubtitle_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/incomecategory_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/incomecategory_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/income_base/categoryincome_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class CreateIncomeCategoryView extends StatefulWidget {
  const CreateIncomeCategoryView({super.key});

  @override
  State<CreateIncomeCategoryView> createState() =>
      _CreateIncomeCategoryViewState();
}

class _CreateIncomeCategoryViewState
    extends MainIncomeCategoryBase<CreateIncomeCategoryView> {
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
          text: "Gelir Kategorisi Oluştur",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<IncomeCategoryCubit, MainIncomeCategoryState>(
        listener: incomeCategoryAddListenerBloc,
        builder: (context, state) {
          return Form(
            key: incomeCategoryModelService.formIncomeCategorySavedKey,
            child: Padding(
              padding: context.padding.low,
              child: Column(
                children: <Widget>[
                  // main body
                  buildMainBodyWidget,
                  // saved button
                  buildSavedButtonWidget,
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
        incomeCategoryModelService: incomeCategoryModelService,
      );

  // saved button
  Widget get buildSavedButtonWidget => CategorySavedButtonWidget(
        incomeCategoryModelService: incomeCategoryModelService,
        routerService: routerService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
