import 'package:flutter/material.dart';
import 'package:flutter_application_3/L10n/l_10_n.dart';
import 'package:flutter_application_3/pages/landing_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Colored Crayons',
          scaffoldBackgroundColor: Colors.black,
          textTheme: const TextTheme(
            bodyText1: TextStyle(),
            bodyText2: TextStyle(),
          ).apply(
            bodyColor: Colors.white,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: Colors.pink,
            ),
          ),
          appBarTheme: const AppBarTheme(backgroundColor: Colors.blueGrey)),
      supportedLocales: L10N.all,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      debugShowCheckedModeBanner: false,
      title: "hello",
      routes: {
        LandingPage.routeName: (BuildContext context) => LandingPage(),
      },
      initialRoute: LandingPage.routeName,
    );
  }
}
