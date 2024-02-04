import 'package:eciftci/feature/mainview/connectionerror/connectionerror_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/creategoes_category/creategoes_category_view.dart';
import 'package:eciftci/feature/mainview/incomegoes/view/goes/view/updategoes_category/goescategoryupdate_view.dart';
import 'package:eciftci/product/bloc/mainview_bloc/goescategory_bloc/cubit/cubit.dart';
import 'package:eciftci/product/enums/mainview_enum/goescategory_enum/goescategory_enum.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoesCategoryRouterService {
  // category add dialog
  void categoryAddDialog(
      BuildContext context, TextEditingController categoryName) {
    dynamic alertDialog = AlertDialog(
      title: BodyMediumBlackBoldText(
        text: GoesCategoryViewStrings.dialogTitleText.value,
        textAlign: TextAlign.center,
      ),
      content: LabelMediumBlackText(
        text: GoesCategoryViewStrings.dialogSubTitleText.value,
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
                    BlocProvider.of<GoesCategoryCubit>(context)
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

  // create goes category
  void goesCreateCategoryViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateGoesCategoryView(),
      ),
    );
  }

  // category update view
  void categoryUpdateViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GoesCategoryUpdateView(
          data: data,
        ),
      ),
    );
  }

  // connection error view
  void connectionErrorViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ConnectionErrorView(),
      ),
    );
  }
}
