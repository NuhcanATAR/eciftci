import 'package:eciftci/product/bloc/mainview_bloc/profile_bloc/cubit/cubit.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/profile_enum/profile_enum.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityDistrictUpdateFooterButtonWidget extends StatelessWidget {
  const CityDistrictUpdateFooterButtonWidget(
      {required this.modelService,
      required this.selectCity,
      required this.selectDistrict,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final dynamic modelService;
  final String selectCity;
  final String selectDistrict;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          if (modelService.formCityDistrictUpdateKey.currentState!.validate()) {
            BlocProvider.of<ProfileCubit>(context).cityDistrictUpdate(
              selectCity,
              selectDistrict,
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
              text: ProfileViewStrings.cityDistrictUpdateButtonText.value,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
