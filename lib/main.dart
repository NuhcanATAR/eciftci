import 'package:eciftci/feature/splash/splash_view/splash.dart';
import 'package:eciftci/product/bloc/logregpass_bloc/login_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/logregpass_bloc/password_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/logregpass_bloc/register_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/maingoes_bloc/goes_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/maingoes_bloc/goescategory_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainincome_bloc/income_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainincome_bloc/incomecategory_bloc/cubit/cubit.dart';
import 'package:eciftci/product/bloc/mainview_bloc/mainplots_bloc/plots_bloc/cubit/cubit.dart';
import 'package:eciftci/product/initialize/app_start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await AppStart.initStartApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthSignUpCubit>(
          create: (BuildContext context) => AuthSignUpCubit(),
        ),
        BlocProvider<MainAuthPasswordCubit>(
          create: (BuildContext context) => MainAuthPasswordCubit(),
        ),
        BlocProvider<AuthSignInCubit>(
          create: (BuildContext context) => AuthSignInCubit(),
        ),
        BlocProvider<IncomeCategoryCubit>(
          create: (BuildContext context) => IncomeCategoryCubit(),
        ),
        BlocProvider<IncomeCubit>(
          create: (BuildContext context) => IncomeCubit(),
        ),
        BlocProvider<GoesCategoryCubit>(
          create: (BuildContext context) => GoesCategoryCubit(),
        ),
        BlocProvider<GoesCubit>(
          create: (BuildContext context) => GoesCubit(),
        ),
        BlocProvider<PlotsCubit>(
          create: (BuildContext context) => PlotsCubit(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
