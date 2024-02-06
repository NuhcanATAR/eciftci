// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:eciftci/product/constants/color_constant.dart';
import 'package:eciftci/product/model/mainview_model/agirculturalcalendar_model/agirculturalcalendar_model.dart';
import 'package:eciftci/product/router/mainview_router/agriculturalcalendar_router/agriculturalcalendar_router.dart';
import 'package:eciftci/product/utility/database/mainview_db/agriculturalcalendar_db/agriculturalcalendar_db.dart';

import 'package:eciftci/product/widget/text_widget/label_medium_text.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import '../../../../extension/view_extension.dart';

abstract class MainAgriculturalCalendarBase<T extends StatefulWidget>
    extends State<T> {
  // model service
  AgriculturalModelService serviceModel = AgriculturalModelService();
  AgriculturalCalendarRouterService routerService =
      AgriculturalCalendarRouterService();

  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;

  @override
  void initState() {
    super.initState();
    checkControl();
  }

  void checkControl() async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result == true) {
      serviceModel.logger.i("İnternet Bağlandı!!");
    } else {
      routerService.connectionErrorViewNavigatorRouter(context);
    }
  }

  Future<void> showCreateEventViewDialog() async {
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: dynamicHeight(0.8),
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    centerTitle: true,
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "İptal",
                          style: GoogleFonts.nunito(
                            textStyle:
                                context.general.textTheme.bodyMedium?.copyWith(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "Etkinlik Oluştur",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyMedium?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20, top: 20),
                        child: GestureDetector(
                          onTap: () {
                            if (serviceModel.formEventAddKey.currentState!
                                .validate()) {
                              saveEvent();
                            }
                          },
                          child: Text(
                            "Kaydet",
                            style: GoogleFonts.nunito(
                              textStyle: context.general.textTheme.bodyMedium
                                  ?.copyWith(
                                color: MainAppColorConstant.mainColorBackground,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  body: Form(
                    key: serviceModel.formEventAddKey,
                    child: Padding(
                      padding: context.padding.normal,
                      child: ListView(
                        children: <Widget>[
                          // title
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 5),
                            child: TextFormField(
                              style: GoogleFonts.nunito(
                                textStyle: context.general.textTheme.labelMedium
                                    ?.copyWith(
                                  color: Colors.black54,
                                ),
                              ),
                              controller: serviceModel.noteController,
                              validator: serviceModel.titleNoteValidator,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                hintText: "Başlık *",
                                hintStyle: GoogleFonts.nunito(
                                  textStyle: context
                                      .general.textTheme.labelMedium
                                      ?.copyWith(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // explanation
                          TextFormField(
                            minLines: 4,
                            keyboardType: TextInputType.multiline,
                            maxLines: 4,
                            style: GoogleFonts.nunito(
                              textStyle: context.general.textTheme.labelMedium
                                  ?.copyWith(
                                color: Colors.black54,
                              ),
                            ),
                            controller: serviceModel.explanation,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              hintText: "Açıklama",
                              hintStyle: GoogleFonts.nunito(
                                textStyle: context.general.textTheme.labelMedium
                                    ?.copyWith(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ), // activity status
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void saveEvent() {
    final noteText = serviceModel.noteController.text;
    final explanationText = serviceModel.explanation.text;

    if (noteText.isNotEmpty) {
      AgriculturalCalendarDB.AGRICULTURALCALENDAR.agriculturalCalendarRef
          .doc(serviceModel.selectedDate.toString())
          .set({
        "NOTE": noteText,
        "EXPLANATION": explanationText,
        "EVENTDATE": serviceModel.selectedDate.toString(),
        "DATE": FieldValue.serverTimestamp(),
      }).then((value) {
        Navigator.pop(context);
        final snackBar = SnackBar(
          backgroundColor: MainAppColorConstant.mainColorBackground,
          content: const LabelMediumWhiteText(
            text: "Etkinlik Kaydedildi!",
            textAlign: TextAlign.left,
          ),
          action: SnackBarAction(
            label: "Tamam",
            textColor: Colors.white,
            onPressed: () {},
          ),
          duration: const Duration(
            seconds: 4,
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }).catchError((err) {
        Navigator.pop(context);
        final snackBar = SnackBar(
          backgroundColor: Colors.red,
          content: const LabelMediumWhiteText(
            text: "Hata oluşu, tekrar deneyiniz!",
            textAlign: TextAlign.left,
          ),
          action: SnackBarAction(
            label: "Tamam",
            textColor: Colors.white,
            onPressed: () {},
          ),
          duration: const Duration(
            seconds: 4,
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });

      serviceModel.noteController.clear();
      serviceModel.explanation.clear();
    }
  }

  void loadEventForDate(DateTime date) async {
    final noteSnapshot = await AgriculturalCalendarDB
        .AGRICULTURALCALENDAR.agriculturalCalendarRef
        .doc(serviceModel.selectedDate.toString())
        .get();
    if (noteSnapshot.exists) {
      final data = noteSnapshot.data() as Map<String, dynamic>;
      final note = data['NOTE'] as String;
      final explanation = data['EXPLANATION'] as String;

      setState(() {
        serviceModel.selectedNote = note;
        serviceModel.selectedExplanation = explanation;
      });
    } else {
      setState(() {
        serviceModel.selectedNote = '';
        serviceModel.selectedExplanation = '';
      });
    }
  }

  Future<void> agriculturalCalendarEventDelete() async {
    await AgriculturalCalendarDB.AGRICULTURALCALENDAR.agriculturalCalendarRef
        .doc(serviceModel.selectedDate.toString())
        .delete()
        .then((value) {
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: const LabelMediumWhiteText(
          text: "Etkinlik Kaldırıldı!",
          textAlign: TextAlign.left,
        ),
        action: SnackBarAction(
          label: "Tamam",
          textColor: Colors.white,
          onPressed: () {},
        ),
        duration: const Duration(
          seconds: 4,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }).catchError((err) {
      final snackBar = SnackBar(
        backgroundColor: MainAppColorConstant.mainColorBackground,
        content: const LabelMediumWhiteText(
          text: "Hata oluştu, tekrar deneyiniz!",
          textAlign: TextAlign.left,
        ),
        action: SnackBarAction(
          label: "Tamam",
          textColor: Colors.white,
          onPressed: () {},
        ),
        duration: const Duration(
          seconds: 4,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}
