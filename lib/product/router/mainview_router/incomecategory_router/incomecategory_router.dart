import 'package:eciftci/feature/mainview/incomegoes/view/income/view/createincome_category/createincome_category_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/income/view/updateincome_category/incomecategoryupdate_view.dart';
import 'package:eciftci/product/bloc/mainview_bloc/incomecategory_bloc/cubit/cubit.dart';
import 'package:eciftci/product/enums/mainview_enum/incomecategory_enum/incomecategory_enum.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomeCategoryRouterService {
  // category add dialog
  void categoryAddDialog(
      BuildContext context, TextEditingController categoryName) {
    dynamic alertDialog = AlertDialog(
      title: BodyMediumBlackBoldText(
        text: IncomeCategoryViewStrings.dialogTitleText.value,
        textAlign: TextAlign.center,
      ),
      content: LabelMediumBlackText(
        text: IncomeCategoryViewStrings.dialogSubTitleText.value,
        textAlign: TextAlign.center,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const LabelMediumBlackBoldText(
                    text: "Kapat",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<IncomeCategoryCubit>(context)
                        .incomeCategoryAdd(categoryName.text);
                    Navigator.pop(context);
                    categoryName.clear();
                  },
                  child: const LabelMediumMainColorText(
                    text: "Kaydet",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }

  // create income category
  void incomeCreateCategoryViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateIncomeCategoryView(),
      ),
    );
  }

  // category update view
  void categoryUpdateViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IncomeCategoryUpdateView(
          data: data,
        ),
      ),
    );
  }
}
