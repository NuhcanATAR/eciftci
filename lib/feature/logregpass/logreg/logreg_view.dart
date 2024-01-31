import 'package:eciftci/feature/logregpass/logreg/widget/body_widget.dart';
import 'package:eciftci/product/utility/base/logregpass_base/logreg_base/logreg_base.dart';
import 'package:flutter/material.dart';

class LogRegView extends StatefulWidget {
  const LogRegView({super.key});

  @override
  State<LogRegView> createState() => _LogRegViewState();
}

class _LogRegViewState extends MainLoginRegisterBase<LogRegView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: buildBodyWidget,
    );
  }

  // body
  Widget get buildBodyWidget => FooterWidget(
        routerService: routerService,
        maxWidth: maxWidth,
        dynamicHeight: dynamicHeight,
      );
}
