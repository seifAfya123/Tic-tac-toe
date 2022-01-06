// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/parts/xo_container.dart';
import 'dart:math';

// ignore: must_be_immutable
class Secondtestpage extends StatefulWidget {
  static const String routeName = "Secondtestpage";
  String xo;
  bool player_vs_player;
  String player1, player2;
  Secondtestpage(this.player_vs_player, this.xo, this.player1, this.player2);
  // Secondtestpage __init__(this.player1, this.player2);
// Secondtestpage(this.player1,this.player2);

  @override
  State<Secondtestpage> createState() => _SecondtestpageState();
}

class _SecondtestpageState extends State<Secondtestpage> {
  // score[0]=> player or player 1
  // score[1]=> computer or player 2
  List<int> score = [0, 0];

  // int playingCounter = 0;
  // list to connect game the values
  List<String> boxbordindex_value = [
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " "
  ];

  List<int> locs = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
  ];
  List<Color> colorx = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black
  ];
  int playingCounter = 0;
  String player = "O", opponent = "X";
  void define_xo_players() {
    player = widget.xo;
    opponent = widget.xo == "X" ? "O" : "X";
  }

  @override
  void initState() {
    // TODO: implement initState
    define_xo_players();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tic Tac Toe"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: resetGame,
            icon: const Icon(Icons.restart_alt),
          )
        ],
      ),
      body: Container(
        // color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Container(
                // color: Colors.red,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      playingCounter % 2 == 0
                          ? widget.player1.toString() + " should play"
                          : widget.player2.toString() + " should play",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: MediaQuery.of(context).size.width * 0.1),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.player_vs_player
                                    ? widget.player1
                                    : "you",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.1),
                              ),
                              Text(
                                score[0].toString(),
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.1),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.player_vs_player
                                    ? widget.player2
                                    : "computer",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.1),
                              ),
                              Text(
                                score[1].toString(),
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.1),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.grey,
                        Colors.blueGrey,
                        Colors.grey,
                      ]),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        xocontainer(
                            colorx[0], boxbordindex_value[0], 0, ontapFunc),
                        xocontainer(
                            colorx[1], boxbordindex_value[1], 1, ontapFunc),
                        xocontainer(
                            colorx[2], boxbordindex_value[2], 2, ontapFunc),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        xocontainer(
                            colorx[3], boxbordindex_value[3], 3, ontapFunc),
                        xocontainer(
                            colorx[4], boxbordindex_value[4], 4, ontapFunc),
                        xocontainer(
                            colorx[5], boxbordindex_value[5], 5, ontapFunc),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        xocontainer(
                            colorx[6], boxbordindex_value[6], 6, ontapFunc),
                        xocontainer(
                            colorx[7], boxbordindex_value[7], 7, ontapFunc),
                        xocontainer(
                            colorx[8], boxbordindex_value[8], 8, ontapFunc),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // String player = 'O', opponent = 'X';

  // String player = 'O', opponent = 'X';

  void Move(x, y) {
    int row = x;
    int col = y;
  }

  bool isMovesLeft2(board) {
    for (int i = 0; i < 9; i++) {
      if (board[i] == ' ') {
        return true;
      }
    }
    return false;
  }

  int evaluate2(b) {
    for (int row = 0; row < 9; row += 3) {
      if (b[row] == b[row + 1] && b[row + 1] == b[row + 2]) {
        if (b[row] == opponent)
          return 10;
        else if (b[row] == player) return -10;

        ///
      }
    }

    for (int col = 0; col < 3; col++) {
      if (b[col] == b[col + 3] && b[col + 3] == b[col + 6]) {
        if (b[col] == opponent)
          return 10;
        else if (b[col] == player) return -10;
      }
    }

    if (b[0] == b[4] && b[4] == b[8]) {
      if (b[0] == opponent)
        return 10;
      else if (b[0] == player) return -10;
    }

    if (b[2] == b[4] && b[4] == b[6]) {
      if (b[2] == opponent)
        return 10;
      else if (b[2] == player) return -10;
    }

    return 0;
  }

  int minimax2(board, depth, isMax) {
    int score = evaluate2(board);

    if (score == 10) return score;

    if (score == -10) return score;

    if (isMovesLeft2(board) == false) return 0;

    if (isMax) {
      int best = -1000;

      for (int i = 0; i < 9; i++) {
        if (board[i] == ' ') {
          board[i] = opponent;

          best = max(best, minimax2(board, depth + 1, !isMax));

          board[i] = ' ';
        }
      }
      return best;
    } else {
      int best = 1000;

      for (int i = 0; i < 9; i++) {
        if (board[i] == ' ') {
          board[i] = player;

          best = min(best, minimax2(board, depth + 1, !isMax));
          board[i] = ' ';
        }
      }
      return best;
    }
  }

  int findBestMove2(board) {
    int bestVal = -1000;
    int bestMove = -1;

    for (int i = 0; i < 9; i++) {
      if (board[i] == ' ') {
        board[i] = opponent;

        int moveVal = minimax2(board, 0, false);

        board[i] = ' ';

        if (moveVal > bestVal) {
          bestMove = i;
          bestVal = moveVal;
        }
      }
    }
    print(bestMove);
    return bestMove;
  }

/////////////////////////
  // T getRandomElement<T>(List<T> list) {
  //   final random = Random();
  //   var i = random.nextInt(list.length);
  //   return list[i];
  // }

  void computerTturn() {
    // for (var i = 0; i < locs.length; i++) {
    // int element = getRandomElement(locs);
    // if (boxbordindex_value[element] == " ") {
    playingCounter++;
    // boxbordindex_value[element] = widget.xo == "X" ? "O" : "X";
    if (playingCounter < 9) {
      print(playingCounter);
      boxbordindex_value[findBestMove2(boxbordindex_value)] =
          widget.xo == "X" ? "O" : "X";
    } else {
      dialog_draw();
    }
    // colorx[element] = widget.xo == "X" ? Colors.red : Colors.blue;
    // findBestMove2(boxbordindex_value);
    return;
    // }
    // }
  }

  void ontapFunc(int index) {
    setState(
      () {
        if (widget.player_vs_player && boxbordindex_value[index] == ' ') {
          // colorx[index] = playingCounter % 2 == 0 ? Colors.red : Colors.blue;
          boxbordindex_value[index] = widget.xo;
          // boxbordindex_value[index] = playingCounter % 2 == 0 ? "X" : "O";
          playingCounter++;
        } else {
          if (boxbordindex_value[index] == " ") {
            playingCounter++;
            // colorx[index] = widget.xo == "X" ? Colors.blue : Colors.red;
            boxbordindex_value[index] = widget.xo;
            computerTturn();
          }
        }

        checkWinner('X');
        checkWinner('O');
        if (playingCounter == 9) {
          dialog_draw();
          resetGame();
        }
      },
    );
  }

  void checkWinner(String player) {
    if (boxbordindex_value[0] == player &&
        boxbordindex_value[1] == player &&
        boxbordindex_value[2] == player) {
      playerWon(player);
    } else if (boxbordindex_value[3] == player &&
        boxbordindex_value[4] == player &&
        boxbordindex_value[5] == player) {
      playerWon(player);
    } else if (boxbordindex_value[6] == player &&
        boxbordindex_value[7] == player &&
        boxbordindex_value[8] == player) {
      playerWon(player);
    } else if (boxbordindex_value[0] == player &&
        boxbordindex_value[3] == player &&
        boxbordindex_value[6] == player) {
      playerWon(player);
    } else if (boxbordindex_value[1] == player &&
        boxbordindex_value[4] == player &&
        boxbordindex_value[7] == player) {
      playerWon(player);
    } else if (boxbordindex_value[2] == player &&
        boxbordindex_value[5] == player &&
        boxbordindex_value[8] == player) {
      playerWon(player);
    } else if (boxbordindex_value[0] == player &&
        boxbordindex_value[4] == player &&
        boxbordindex_value[8] == player) {
      playerWon(player);
    } else if (boxbordindex_value[2] == player &&
        boxbordindex_value[4] == player &&
        boxbordindex_value[6] == player) {
      playerWon(player);
    }
  }

  void resetGame() {
    setState(() {
      playingCounter = 0;
      boxbordindex_value = [
        ' ',
        ' ',
        ' ',
        ' ',
        ' ',
        ' ',
        ' ',
        ' ',
        ' ',
      ];
      // colorx = [
      //   Colors.white,
      //   Colors.white,
      //   Colors.white,
      //   Colors.white,
      //   Colors.white,
      //   Colors.white,
      //   Colors.white,
      //   Colors.white,
      //   Colors.white,
      // ];
    });
  }

  void playerWon(String player) {
    if (player == widget.xo) {
      score[0] += 3;
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(widget.player1.toString() + " won!"),
          content: Text(widget.player1.toString() + " have got 3 marks"),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                // resetGame();
              },
              child: const Text("okay"),
            )
          ],
        ),
      );
    } else {
      score[1] += 3;
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(widget.player2.toString() + " won!"),
          content: Text(widget.player2.toString() + " have got 3 marks"),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                // resetGame();
              },
              child: const Text("okay"),
            )
          ],
        ),
      );
    }
    resetGame();
  }

  void dialog_draw() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("DRAW"),
        content: const Text("NO one won"),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              // resetGame();
            },
            child: const Text("okay"),
          )
        ],
      ),
    );
    resetGame();
  }
}
