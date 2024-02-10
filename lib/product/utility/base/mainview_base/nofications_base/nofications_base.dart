import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../extension/view_extension.dart';

abstract class MainNoficationsBase<T extends StatefulWidget> extends State<T> {
  // screens size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;

  Future<void> noficationsUrl(Map<String, dynamic> data) async {
    if (!await launchUrl(Uri.parse(data['URL']))) {
      throw Exception('URL Bulunamadı');
    }
  }
}
