import 'package:flutter/material.dart';
import '../../../../../../product/extension/view_extension.dart';

abstract class MainPlotsBase<T extends StatefulWidget> extends State<T> {
  // screens size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;
}
