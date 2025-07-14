import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:water_tracking/core/observer/bloc_observer.dart';
import 'package:water_tracking/i18n/strings.g.dart';
import 'package:water_tracking/screens/history/history_screen.dart';
import 'package:water_tracking/screens/home/home_screen.dart';
import 'package:water_tracking/screens/login/cubit/login_cubit.dart';
import 'package:water_tracking/screens/login/login_screen.dart';
import 'package:water_tracking/screens/main/main_screen.dart';
import 'package:water_tracking/screens/register/cubit/register_cubit.dart';
import 'package:water_tracking/screens/register/register_screen.dart';
import 'package:water_tracking/screens/report/report_screen.dart';
import 'package:water_tracking/screens/setting/setting_screen.dart';
import 'package:water_tracking/screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  runApp(TranslationProvider(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
          ),
        ),
        initialRoute: '/main',
        routes: {
          '/splash': (context) => const SplashScreen(),
          '/login': (context) => BlocProvider(
                create: (context) => LoginCubit(),
                child: const LoginScreen(),
              ),
          '/main': (context) => const MainScreen(),
          '/register': (context) => BlocProvider(
                create: (context) => RegisterCubit(),
                child: const RegisterScreen(),
              ),
          '/home': (context) => const HomeScreen(),
          '/history': (context) => const HistoryScreen(),
          '/report': (context) => const ReportScreen(),
          '/setting': (context) => const SettingScreen(),
        });
  }
}
