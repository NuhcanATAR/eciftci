import 'package:eciftci/feature/mainview/incomegoes/view/income/view/create_income/widget/incomeexplanation_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/create_income/widget/incomesavebutton_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/create_income/widget/incometitle_widget.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/create_income/widget/incomevalue_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/income_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/income_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/income_enum/income_enum.dart';
import 'package:eciftci/product/model/mainview_model/income_model/income_model.dart';
import 'package:eciftci/product/utility/base/mainview_base/mainincome_base/income_base/mainincome_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class CreateIncomeView extends StatefulWidget {
  const CreateIncomeView({super.key});

  @override
  State<CreateIncomeView> createState() => _CreateIncomeViewState();
}

class _CreateIncomeViewState extends MainIncomeBase<CreateIncomeView> {
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
          text: "Gelir Oluştur",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<IncomeCubit, MainIncomeState>(
        listener: incomeAddListenerBloc,
        builder: (context, state) {
          return Form(
            key: modelService.formIncomeAddKey,
            child: Padding(
              padding: context.padding.low,
              child: ListView(
                children: <Widget>[
                  // income category
                  buildIncomeCategoryWidget,
                  // income title
                  buildIncomeTitleInputWidget,
                  // income explanation
                  buildIncomeExplanationInputWidget,
                  // income value
                  buildIncomeValueInputWidget,
                  // save button
                  buildIncomeSaveButtonWidget,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // income category
  Widget get buildIncomeCategoryWidget => Container(
        padding: const EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: DropdownButtonFormField<MainIncomeCategory>(
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          validator: (value) => value == null ? "* Zorunlu alan" : null,
          value: selectMainIncomeCategory,
          isExpanded: true,
          hint: LabelMediumBlackText(
            text: IncomeViewStrings.incomeCategoryInputText.value,
            textAlign: TextAlign.left,
          ),
          onChanged: (MainIncomeCategory? categoryMain) {
            setState(() {
              selectMainIncomeCategory = categoryMain;
            });
          },
          items: mainIncomeCategory.map<DropdownMenuItem<MainIncomeCategory>>(
              (MainIncomeCategory categoryM) {
            return DropdownMenuItem<MainIncomeCategory>(
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

  // income title
  Widget get buildIncomeTitleInputWidget => IncomeTitleWidget(
        modelService: modelService,
      );

  // income explanation
  Widget get buildIncomeExplanationInputWidget => IncomeExplanationWidget(
        modelService: modelService,
      );

  // income value
  Widget get buildIncomeValueInputWidget => IncomeValueWidget(
        modelService: modelService,
      );

  // save button
  Widget get buildIncomeSaveButtonWidget => IncomeSaveButtonWidget(
        modelService: modelService,
        selectMainIncomeCategory: selectMainIncomeCategory,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
