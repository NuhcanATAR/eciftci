import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';

class UserEditMenuWidget extends StatelessWidget {
  const UserEditMenuWidget(
      {required this.data, required this.routerService, super.key});

  final Map<String, dynamic> data;
  final dynamic routerService;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          routerService.userUpdateViewNavigatorRouter(
            context,
            data,
          );
        },
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.edit_outlined,
                  color: MainAppColorConstant.mainColorBackground,
                  size: 18,
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: LabelMediumBlackBoldText(
                      text: "Kişiyi Düzenle",
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
