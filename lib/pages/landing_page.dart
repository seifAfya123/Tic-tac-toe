import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages_body/choose_player_or_computer.dart';
import 'package:flutter_application_3/pages_body/choose_xo.dart';

class LandingPage extends StatefulWidget {
  static const String routeName = "landingpage";

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  double position_of_container = 100;
  double opa = 0;
  bool vis = true;

  bool? mode;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      opa = 1;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mode == null
          ? ChoosePlayerOrComputer(
              player_or_computer, opa, position_of_container)
          : ChooseXo(mode!, opa, position_of_container),
    );
  }

  void player_or_computer(bool choosen) {
    setState(() {
      if (choosen) {
        mode = true;
      } else {
        mode = false;
        opa = 0;
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            if (vis) {
              position_of_container = 300;
              opa = 1;
            } else {
              position_of_container = 100;
              opa = 0;
            }
            vis = !vis;
          });
        });
      }
    });
  }
}
