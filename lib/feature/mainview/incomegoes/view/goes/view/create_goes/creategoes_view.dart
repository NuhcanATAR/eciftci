import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/create_goes/widget/goesexplanation_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/create_goes/widget/goessavebutton_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/create_goes/widget/goestitle_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/create_goes/widget/goesvalue_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/goes_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/goes_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/goes_enum/goes_enum.dart';
import 'package:eciftci/product/model/mainview_model/goes_model/goes_model.dart';
import 'package:eciftci/product/utility/base/mainview_base/goes_base/maingoes_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class CreateGoesView extends StatefulWidget {
  const CreateGoesView({super.key});

  @override
  State<CreateGoesView> createState() => _CreateGoesViewState();
}

class _CreateGoesViewState extends MainGoesBase<CreateGoesView> {
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
          text: "Gider Oluştur",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<GoesCubit, MainGoesState>(
        listener: goesAddListenerBloc,
        builder: (context, state) {
          return Form(
            key: modelService.formGoesAddKey,
            child: Padding(
              padding: context.padding.low,
              child: ListView(
                children: <Widget>[
                  // goes category
                  buildGoesCategoryWidget,
                  // goes title
                  buildGoesTitleInputWidget,
                  // goes explanation
                  buildGoesExplanationInputWidget,
                  // goes value
                  buildGoesValueInputWidget,
                  // save button
                  buildGoesSaveButtonWidget,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // goes category
  Widget get buildGoesCategoryWidget => Container(
        padding: const EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: DropdownButtonFormField<MainGoesCategory>(
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          validator: (value) => value == null ? "* Zorunlu alan" : null,
          value: selectMainGoesCategory,
          isExpanded: true,
          hint: LabelMediumBlackText(
            text: GoesViewStrings.goesCategoryInputText.value,
            textAlign: TextAlign.left,
          ),
          onChanged: (MainGoesCategory? categoryMain) {
            setState(() {
              selectMainGoesCategory = categoryMain;
            });
          },
          items: mainGoesCategory.map<DropdownMenuItem<MainGoesCategory>>(
              (MainGoesCategory categoryM) {
            return DropdownMenuItem<MainGoesCategory>(
              value: categoryM,
              child: Text(
                categoryM.categoryName,
                style: GoogleFonts.nunito(
                  textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.black,
                      ),
                ),
              ),
            );
          }).toList(),
        ),
      );

  // goes title
  Widget get buildGoesTitleInputWidget => GoesTitleWidget(
        modelService: modelService,
      );

  // goes explanation
  Widget get buildGoesExplanationInputWidget => GoesExplanationWidget(
        modelService: modelService,
      );

  // goes value
  Widget get buildGoesValueInputWidget => GoesValueWidget(
        modelService: modelService,
      );

  // save button
  Widget get buildGoesSaveButtonWidget => GoesSaveButtonWidget(
        modelService: modelService,
        selectMainGoesCategory: selectMainGoesCategory,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
