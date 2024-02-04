import 'package:eciftci/product/bloc/mainview_bloc/mainincome_bloc/incomecategory_bloc/cubit/cubit.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../product/enums/mainview_enum/mainincome_enum/incomecategory_enum/incomecategory_enum.dart';

class CategoryUpdateButtonWidget extends StatelessWidget {
  const CategoryUpdateButtonWidget(
      {required this.incomeCategoryModelService,
      required this.routerService,
      required this.maxWidth,
      required this.dynamicHeight,
      required this.data,
      required this.categoryNameUpdate,
      super.key});

  final dynamic incomeCategoryModelService;
  final dynamic routerService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;
  final Map<String, dynamic> data;
  final TextEditingController categoryNameUpdate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          if (incomeCategoryModelService
              .formIncomeCategoryUpdateKey.currentState!
              .validate()) {
            BlocProvider.of<IncomeCategoryCubit>(context).incomeCategoryUpdate(
              categoryNameUpdate.text,
              data,
            );
          }
        },
        child: SizedBox(
          width: maxWidth,
          height: dynamicHeight(0.07),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: MainAppColorConstant.mainColorBackground,
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: LabelMediumWhiteText(
              text: IncomeCategoryViewStrings.updateCategoryButtonText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
