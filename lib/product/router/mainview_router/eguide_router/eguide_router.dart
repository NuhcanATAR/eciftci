import 'package:eciftci/feature/mainview/connectionerror/connectionerror_view.dart';
import 'package:eciftci/feature/mainview/eguide/view/usercreate/usercreate_view.dart';
import 'package:eciftci/feature/mainview/eguide/view/userdetail/userdetail_view.dart';
import 'package:eciftci/feature/mainview/eguide/view/userupdate/userupdate_view.dart';
import 'package:eciftci/product/bloc/mainview_bloc/eguide_bloc/cubit/cubit.dart';
import 'package:eciftci/product/enums/mainview_enum/eguide_enum/eguide_enum.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EGuideRouterService {
  // connection error view
  void connectionErrorViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ConnectionErrorView(),
      ),
    );
  }

  // user create view
  void userCreateViewNavigatorRouter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UserCreateView(),
      ),
    );
  }

  // user update view
  void userUpdateViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserUpdateView(
          data: data,
        ),
      ),
    );
  }

  // user delete
  void userDeleteDialog(BuildContext context, Map<String, dynamic> data) {
    dynamic alertDialog = AlertDialog(
      title: LabelMediumBlackBoldText(
        text: EGuideViewStrings.deleteTitleText.value,
        textAlign: TextAlign.center,
      ),
      content: LabelMediumBlackText(
        text: EGuideViewStrings.deleteSubTitleText.value,
        textAlign: TextAlign.center,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: Row(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const LabelMediumGreyText(
                      text: "Kapat",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<EGuideCubit>(context).userDelete(data);
                      Navigator.pop(context);
                    },
                    child: const LabelMediumRedText(
                      text: "Sil",
                      textAlign: TextAlign.center,
                    ),
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

  // user detail view
  void userDetailViewNavigatorRouter(
      BuildContext context, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDetailView(
          data: data,
        ),
      ),
    );
  }
}
