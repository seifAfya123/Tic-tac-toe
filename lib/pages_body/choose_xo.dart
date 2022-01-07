import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/landing_page.dart';
import 'package:flutter_application_3/pages/secondtestpage.dart';

class ChooseXo extends StatelessWidget {
  double position_of_container;
  double opa;
  bool mode;
  late String player1, player2;
  ChooseXo(this.mode, this.opa, this.position_of_container);

  @override
  Widget build(BuildContext context) {
    return mode == false
        ? Stack(
            alignment: Alignment.center,
            children: [
              AnimatedPositioned(
                duration: const Duration(seconds: 1),
                top: position_of_container,
                child: AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: opa,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "choose X or O to start",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Secondtestpage(
                                      mode, "X", "you", "computer"),
                                ),
                              );
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: 100,
                              height: 100,
                              child: const Text(
                                "X",
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Secondtestpage(
                                      mode, "O", "you", "computer"),
                                ),
                              );
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: 100,
                              height: 100,
                              child: const Text(
                                "O",
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedPositioned(
                child: AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: opa,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LandingPage.routeName);
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
                bottom: position_of_container,
                duration: const Duration(seconds: 1),
              )
            ],
          )
        : Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                  color: Colors.white,
                  child: TextField(
                    decoration:
                        const InputDecoration(hintText: "  player1 name"),
                    onChanged: (value) => player1 = value,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                  child: TextField(
                    decoration:
                        const InputDecoration(hintText: "  player2 name"),
                    onChanged: (value) => player2 = value,
                  ),
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.01),
                      child: ElevatedButton(
                        onPressed: () {
                          // mode = null;
                          Navigator.pushNamed(context, LandingPage.routeName);
                        },
                        child: Text(
                          "Back",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.09,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.01),
                      child: ElevatedButton(
                        child: Text(
                          "start",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.09,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Secondtestpage(mode, "x", player1, player2),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
  }
}
