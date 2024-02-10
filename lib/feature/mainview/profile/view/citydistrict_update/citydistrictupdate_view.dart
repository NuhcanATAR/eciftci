import 'package:eciftci/feature/mainview/profile/view/citydistrict_update/widget/footerbutton_widget.dart';
import 'package:eciftci/product/bloc/mainview_bloc/profile_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/profile_bloc/state/state.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/enums/mainview_enum/profile_enum/profile_enum.dart';
import 'package:eciftci/product/model/logregpass_model/register_model/register_model.dart';
import 'package:eciftci/product/utility/base/mainview_base/profile_base/profile_base.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class ProfileCityDistrictUpdateView extends StatefulWidget {
  const ProfileCityDistrictUpdateView({super.key});

  @override
  State<ProfileCityDistrictUpdateView> createState() =>
      _ProfileCityDistrictUpdateViewState();
}

class _ProfileCityDistrictUpdateViewState
    extends MainProfileBase<ProfileCityDistrictUpdateView> {
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
          text: "Şehir ve İlçe Güncelle",
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: profileCityDistrictUpdateListenerBloc,
        builder: (context, state) {
          return Form(
            key: modelService.formCityDistrictUpdateKey,
            child: Padding(
              padding: context.padding.low,
              child: Column(
                children: <Widget>[
                  // main body
                  buildMainBodyWidget,
                  // footer buton
                  buildFooterButtonWidget,
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
            // city
            buildSelectCityWidget,
            // district control
            buildSelectDistrictWidget,
          ],
        ),
      );

  // city
  Widget get buildSelectCityWidget => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField<mainUserCity>(
              validator: (value) =>
                  value == null ? "Şehir alanı boş bırakılamaz" : null,
              isExpanded: true,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              hint: LabelMediumGreyText(
                text: ProfileViewStrings.cityInputText.value,
                textAlign: TextAlign.left,
              ),
              icon: const Icon(
                Icons.location_on,
                color: Colors.grey,
                size: 18,
              ),
              elevation: 16,
              style: GoogleFonts.nunito(
                textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.black,
                    ),
              ),
              onChanged: (mainUserCity? value) {
                setState(() {
                  selectCity = value;
                  selectDistrict = null;
                  selectDistrictList.clear();
                });
              },
              items: cityList.map((mainUserCity city) {
                return DropdownMenuItem(
                  value: city,
                  child: Text(city.cityName),
                );
              }).toList(),
            ),
          ),
        ),
      );

  // district
  Widget get buildSelectDistrictWidget => selectCity != null
      ? SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<mainUserDistrict>(
                validator: (value) =>
                    value == null ? "İlçe alanı boş bırakılamaz" : null,
                isExpanded: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                hint: LabelMediumGreyText(
                  text: ProfileViewStrings.districtInputText.value,
                  textAlign: TextAlign.left,
                ),
                style: GoogleFonts.nunito(
                  textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.black,
                      ),
                ),
                icon: const Icon(
                  Icons.location_city,
                  color: Colors.grey,
                  size: 18,
                ),
                elevation: 16,
                value: selectDistrict,
                onChanged: (mainUserDistrict? value) {
                  setState(() {
                    selectDistrict = value;
                    selectDistrictList.clear();
                  });
                },
                items: selectCity!.subDistrictList
                    .map((mainUserDistrict district) {
                  return DropdownMenuItem(
                    value: district,
                    child: Text(district.districtName),
                  );
                }).toList(),
              ),
            ),
          ),
        )
      : const SizedBox();

  // footer buton
  Widget get buildFooterButtonWidget =>
      selectCity != null && selectDistrict != null
          ? CityDistrictUpdateFooterButtonWidget(
              modelService: modelService,
              selectCity: selectCity!.cityName.toString(),
              selectDistrict: selectDistrict!.districtName.toString(),
              maxWidth: maxWidth,
              dynamicHeight: dynamicHeight,
            )
          : Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: () {},
                child: SizedBox(
                  width: maxWidth,
                  height: dynamicHeight(0.07),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: LabelMediumWhiteText(
                      text:
                          ProfileViewStrings.cityDistrictUpdateButtonText.value,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            );
}
