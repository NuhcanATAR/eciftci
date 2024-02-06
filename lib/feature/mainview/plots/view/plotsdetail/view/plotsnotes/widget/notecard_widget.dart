import 'package:eciftci/product/bloc/mainview_bloc/mainplots_bloc/plotsnote_bloc/cubit/cubit.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/widget/text_widget/body_medium_text.dart';
import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class NoteCardWidget extends StatelessWidget {
  const NoteCardWidget(
      {required this.data,
      required this.routerService,
      required this.maxWidth,
      required this.dynamicHeight,
      super.key});

  final Map<String, dynamic> data;
  final dynamic routerService;
  final dynamic maxWidth;
  final dynamic dynamicHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.white,
          builder: (context) => SizedBox(
            width: maxWidth,
            height: dynamicHeight(0.5),
            child: Padding(
              padding: context.padding.normal,
              child: ListView(
                children: <Widget>[
                  // appbar
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            routerService.plotsNoteUpdateViewNavigatorRouter(
                              context,
                              data,
                            );
                          },
                          child: Icon(
                            Icons.edit_outlined,
                            color: MainAppColorConstant.mainColorBackground,
                            size: 18,
                          ),
                        ),
                        const Expanded(
                          child: LabelMediumMainColorText(
                            text: "Not Detayı",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.close,
                            color: Colors.black54,
                            size: 21,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // title
                  SizedBox(
                    width: maxWidth,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: BodyMediumBlackBoldText(
                        text: data['TITLE'],
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  // date
                  SizedBox(
                    width: maxWidth,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: LabelMediumGreyText(
                        text: data['FUTUREDATESTATUS'] == true
                            ? "Hedef Tarih: ${data['DAY'].toString()}.${data['MONTH'].toString()}.${data['YEAR'].toString()}"
                            : "Oluşturma Tarih: ${data['DAY'].toString()}.${data['MONTH'].toString()}.${data['YEAR'].toString()}",
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  // explanation
                  SizedBox(
                    width: maxWidth,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: LabelMediumBlackText(
                        text: data['EXPLANATION'],
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: buildCardWidget(context),
    );
  }

  Widget buildCardWidget(BuildContext context) => Card(
        child: ListTile(
          title: LabelMediumBlackBoldText(
            text: data['TITLE'],
            textAlign: TextAlign.left,
          ),
          subtitle: LabelMediumGreyText(
            text: data['FUTUREDATESTATUS'] == true
                ? "Hedef Tarih: ${data['DAY'].toString()}.${data['MONTH'].toString()}.${data['YEAR'].toString()}"
                : "Oluşturma Tarih: ${data['DAY'].toString()}.${data['MONTH'].toString()}.${data['YEAR'].toString()}",
            textAlign: TextAlign.left,
          ),
          trailing: GestureDetector(
            onTap: () {
              BlocProvider.of<PlotsNoteCubit>(context).noteDelete(data);
            },
            child: const Icon(
              Icons.delete_outline,
              color: Colors.red,
              size: 18,
            ),
          ),
        ),
      );
}
