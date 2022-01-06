import 'package:flutter/material.dart';
// import 'package:flutter_application_3/pages/secondtestpage.dart';

class ChoosePlayerOrComputer extends StatelessWidget {
  double position_of_container;
  double opa;
  Function mode_function;
  ChoosePlayerOrComputer(
      this.mode_function, this.opa, this.position_of_container);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: opa,
              child: InkWell(
                onTap: () {
                  mode_function(true);
                  // opa=0;
                },
                child: Container(
                  margin: EdgeInsets.all(
                    MediaQuery.of(context).size.width * 0.05,
                  ),
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Player VS Player",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: opa,
              child: InkWell(
                onTap: () {
                  mode_function(false);
                  opa = 0;
                },
                child: Container(
                  margin: EdgeInsets.all(
                    MediaQuery.of(context).size.width * 0.05,
                  ),
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Player VS computer",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
