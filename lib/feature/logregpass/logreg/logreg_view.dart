import 'package:flutter/material.dart';

class LogRegView extends StatefulWidget {
  const LogRegView({super.key});

  @override
  State<LogRegView> createState() => _LogRegViewState();
}

class _LogRegViewState extends State<LogRegView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Giriş Yap & Kayıt Ol"),
      ),
    );
  }
}
