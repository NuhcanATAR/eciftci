import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/creategoes_category/widget/categoryinput_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/creategoes_category/widget/categorysavedbutton_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/creategoes_category/widget/titlesubtitle_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/goescategory_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/goescategory_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/utility/base/mainview_base/goes_base/categorygoes_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class CreateGoesCategoryView extends StatefulWidget {
  const CreateGoesCategoryView({super.key});

  @override
  State<CreateGoesCategoryView> createState() => _CreateGoesCategoryViewState();
}

class _CreateGoesCategoryViewState
    extends MainGoesCategoryBase<CreateGoesCategoryView> {
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
          text: "Gider Kategorisi Oluştur",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<GoesCategoryCubit, MainGoesCategoryState>(
        listener: goesCategoryAddListenerBloc,
        builder: (context, state) {
          return Form(
            key: goesCategoryModelService.formGoesCategorySavedKey,
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
        goesCategoryModelService: goesCategoryModelService,
      );

  // saved button
  Widget get buildSavedButtonWidget => CategorySavedButtonWidget(
        goesCategoryModelService: goesCategoryModelService,
        routerService: routerService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
