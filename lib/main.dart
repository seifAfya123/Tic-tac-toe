import 'package:flutter/material.dart';
import 'package:flutter_application_3/L10n/l_10_n.dart';
import 'package:flutter_application_3/pages/landing_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_gen/gen_l10n/app_localizaton.dart';
// import 'package:flutter_application_3/pages/secondtestpage.dart';
// import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: TextStyle(fontFamily: 'Colored Crayons', color: Colors.white),
      theme: ThemeData(
          fontFamily: 'Colored Crayons',
          scaffoldBackgroundColor: Colors.black,
          textTheme: const TextTheme(
            bodyText1: TextStyle(),
            bodyText2: TextStyle(),
          ).apply(
            bodyColor: Colors.white,
            // displayColor: Colors.blue,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: Colors.pink,
            ),
          ),
          appBarTheme: AppBarTheme(backgroundColor: Colors.blueGrey)),

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

        // Secondtestpage.routeName: (BuildContext context) => Secondtestpage(),
        // .routeName: (BuildContext context) => ,
        // .routeName: (BuildContext context) => ,
      },
      initialRoute: LandingPage.routeName,
    );
  }
}
