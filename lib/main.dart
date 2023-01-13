import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokemon_gameboy/button.dart';
import 'package:pokemon_gameboy/characters/boy.dart';
import 'package:pokemon_gameboy/characters/oak.dart';
import 'package:pokemon_gameboy/maps/littleroot.dart';
import 'package:pokemon_gameboy/maps/pokelab.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double mapX = 0.87;
  double mapY = 0.65;
  int boySprinteCount = 0;
  String boyDirection = 'Down';
  String currentLocation = 'littleroot';
  double step = 0.25;
  double labStep = 0.55;
  double labMapX = 0.87;
  double labMapY = 0.85;

  String oakDirection = 'Down';
  static double oakX = 0.125;
  static double oakY = 0.9;
  bool chatStarted = false;
  int countPressingA = -1;

  List<List<double>> noMansLandLittleroot = [
    [0.62, 0.8999999999999999],
    [0.87, 0.8999999999999999],
    [1.12, 0.8999999999999999],
    [1.37, 0.8999999999999999],
    [1.62, 0.8999999999999999],
    [1.62, 1.15],
    [1.37, 1.15],
    [1.37, 1.4],
    [1.37, 1.65],
    [1.37, 1.9],
    [1.12, 1.9],
    [0.8700000000000001, 1.9],
    [0.6200000000000001, 1.9],
    [0.6200000000000001, 1.65],
    [0.6200000000000001, 1.4],
    [0.6200000000000001, 1.15],
    [-0.3799999999999999, 0.8999999999999999],
    [-0.6299999999999999, 0.8999999999999999],
    [-0.8799999999999999, 0.8999999999999999],
    [-1.13, 0.8999999999999999],
    [-1.38, 0.8999999999999999],
    [-0.6299999999999999, 1.15],
    [-0.6299999999999999, 1.4],
    [-0.6299999999999999, 1.65],
    [-0.6299999999999999, 1.9],
    [-0.8799999999999999, 1.9],
    [-1.13, 1.9],
    [-1.38, 1.9],
    [-1.63, 1.9],
    [-1.63, 1.65],
    [-1.63, 1.4],
    [-1.63, 1.15],
    [0.1200000000000001, -0.3500000000000001],
    [0.3700000000000001, -0.3500000000000001],
    [0.6200000000000001, -0.3500000000000001],
    [0.8700000000000001, -0.3500000000000001],
    [1.12, -0.3500000000000001],
    [1.37, -0.3500000000000001],
    [1.37, -0.6000000000000001],
    [1.37, -0.8500000000000001],
    [1.37, -1.1],
    [1.37, -1.35],
    [1.12, -1.35],
    [0.8700000000000001, -1.35],
    [0.1200000000000001, -1.35],
    [0.12, -0.6],
    [0.12, -0.85],
    [0.12, -1.1],
    [0.12, -1.35],
    [1.87, -2.1],
    [2.12, 2.4],
    [2.12, 2.15],
    [2.12, 1.9],
    [2.12, 1.65],
    [2.12, 1.4],
    [2.12, 1.15],
    [2.12, 0.8999999999999999],
    [2.12, 0.6499999999999999],
    [2.12, 0.3999999999999999],
    [2.12, 0.1499999999999999],
    [2.12, -0.10000000000000009],
    [2.12, -0.3500000000000001],
    [2.12, -0.6000000000000001],
    [2.12, -0.8500000000000001],
    [2.12, -1.1],
    [2.12, -1.35],
    [2.12, -1.6],
    [2.12, -1.85],
    [1.87, -1.85],
    [1.87, -2.1],
    [1.87, -2.35],
    [1.62, -2.35],
    [1.37, -2.35],
    [1.12, -2.35],
    [0.8700000000000001, -2.35],
    [0.6200000000000001, -2.35],
    [0.3700000000000001, -2.35],
    [0.1200000000000001, -2.35],
    [-0.1299999999999999, -2.35],
    [-0.3799999999999999, -2.35],
    [-0.6299999999999999, -2.35],
    [-0.8799999999999999, -2.35],
    [-1.13, -2.35],
    [-1.38, -2.35],
    [-1.38, -2.1],
    [-1.38, -1.85],
    [-1.63, -1.85],
    [-1.88, -1.85],
    [-1.88, -1.6],
    [-1.88, -1.35],
    [-2.13, -1.35],
    [-2.13, -1.1],
    [-2.13, -0.8500000000000001],
    [-2.13, -0.6000000000000001],
    [-2.13, -0.3500000000000001],
    [-2.13, -0.10000000000000009],
    [-2.13, 0.1499999999999999],
    [-2.13, 0.3999999999999999],
    [-2.13, 0.6499999999999999],
    [-2.13, 0.8999999999999999],
    [-2.13, 1.15],
    [-2.13, 1.4],
    [-2.13, 1.65],
    [-2.13, 1.9],
    [-2.13, 2.15],
    [-2.13, 2.4],
    [-1.88, 2.4],
    [-1.63, 2.4],
    [-1.63, 2.65],
    [-1.63, 2.9],
    [-1.38, 2.9],
    [-1.13, 2.9],
    [-0.8799999999999999, 2.9],
    [-0.6299999999999999, 2.9],
    [-0.6299999999999999, 3.15],
    [-0.6299999999999999, 3.4],
    [-0.3799999999999999, 3.4],
    [-0.1299999999999999, 3.4],
    [0.1200000000000001, 3.4],
    [0.1200000000000001, 3.15],
    [0.1200000000000001, 2.9],
    [0.3700000000000001, 2.9],
    [0.6200000000000001, 2.9],
    [0.8700000000000001, 2.9],
    [1.12, 2.9],
    [1.37, 2.9],
    [1.62, 2.9],
    [1.87, 2.9],
    [1.62, 2.65],
    [1.87, 2.4],
    [-1.13, -0.6000000000000001],
    [0.62, -1.35],
    [0.37, -0.8500000000000001],
    [0.62, -1.1],
  ];

  void moveUp() {
    boyDirection = 'Up';
    if (currentLocation == 'littleroot') {
      if (canMoveTo(boyDirection, noMansLandLittleroot, mapX, mapY)) {
        setState(() {
          mapY += step;
        });
      }

      if (double.parse((mapX).toStringAsFixed(4)) == 0.37 &&
          double.parse((mapY).toStringAsFixed(4)) == -1.1) {
        setState(() {
          currentLocation = 'pokelab';
          labMapX = -0.25;
          labMapY = -6.73;
        });
      }
      animateWalk();
    }
    if (currentLocation == 'pokelab') {
      if (canMoveTo(boyDirection, noMansLandLittleroot, labMapX, labMapY)) {
        setState(() {
          labMapY += labStep;
        });
      }
      animateWalk();
    }
  }

  void moveDown() {
    boyDirection = 'Down';
    if (currentLocation == 'littleroot') {
      if (canMoveTo(boyDirection, noMansLandLittleroot, mapX, mapY)) {
        setState(() {
          mapY -= step;
        });
      }
      animateWalk();
    }
    if (currentLocation == 'pokelab') {
      if (canMoveTo(boyDirection, noMansLandLittleroot, labMapX, labMapY)) {
        setState(() {
          labMapY -= labStep;
        });

        if (double.parse((labMapX).toStringAsFixed(4)) == -0.25 &&
            double.parse((labMapY).toStringAsFixed(4)) == -7.28) {
          setState(() {
            currentLocation = 'littleroot';
            mapX = 0.37;
            mapY = -1.6;
          });
        }
      }
      animateWalk();
    }
  }

  void moveLeft() {
    boyDirection = 'Left';
    if (currentLocation == 'pokelab') {
      if (canMoveTo(boyDirection, noMansLandLittleroot, labMapX, labMapY)) {
        setState(() {
          labMapX += labStep;
        });
      }
      animateWalk();
    }

    if (currentLocation == 'littleroot') {
      if (canMoveTo(boyDirection, noMansLandLittleroot, mapX, mapY)) {
        setState(() {
          mapX += step;
        });
      }
      animateWalk();
    }
  }

  void moveRight() {
    boyDirection = 'Right';

    if (currentLocation == 'littleroot') {
      if (canMoveTo(boyDirection, noMansLandLittleroot, mapX, mapY)) {
        setState(() {
          mapX -= step;
        });
      }
      animateWalk();
    }
    if (currentLocation == 'pokelab') {
      if (canMoveTo(boyDirection, noMansLandLittleroot, labMapX, labMapY)) {
        setState(() {
          labMapX -= labStep;
        });
      }
      animateWalk();
    }
  }

  void pressedA() {}

  void pressedB() {}

  void animateWalk() {
    // print('lab[' + labMapX.toString() + ', ' + labMapY.toString() + '],');
    // print('city[' + mapX.toString() + ', ' + mapY.toString() + '],');

    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        boySprinteCount++;
      });

      if (boySprinteCount == 3) {
        boySprinteCount = 0;
        timer.cancel();
      }
    });
  }

  double cleanNum(double num) {
    return double.parse(num.toStringAsFixed(4));
  }

  bool canMoveTo(String direction, var noMansLand, double x, double y) {
    double stepX = 0;
    double stepY = 0;

    if (direction == 'Left') {
      stepX = step;
      stepY = 0;
    } else if (direction == 'Right') {
      stepX = -step;
      stepY = 0;
    } else if (direction == 'Up') {
      stepX = 0;
      stepY = step;
    } else if (direction == 'Down') {
      stepX = 0;
      stepY = -step;
    }

    for (int i = 0; i < noMansLand.length; i++) {
      if ((cleanNum(noMansLand[i][0]) == cleanNum(x + stepX)) &&
          (cleanNum(noMansLand[i][1]) == cleanNum(y + stepY))) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        AspectRatio(
          aspectRatio: 1.2,
          child: Container(
            color: Colors.black,
            child: Stack(
              children: [
                LittleRoot(
                  x: mapX,
                  y: mapY,
                  currentMap: currentLocation,
                ),
                MyPokeLab(
                  x: labMapX,
                  y: labMapY,
                  currentMap: currentLocation,
                ),
                Container(
                  alignment: Alignment(0, 0),
                  child: MyBoy(
                    location: currentLocation,
                    boySprinteCount: boySprinteCount,
                    direction: boyDirection,
                  ),
                ),
                // Container(
                //   alignment: Alignment(0, 0),
                //   child: ProfOak(
                //     x: mapX,
                //     y: mapY,
                //     location: currentLocation,
                //     oakDirection: oakDirection,
                //   ),
                // )
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.grey[900],
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'G A M E B O Y',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        '  ❤  ',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                      Text(
                        'F L U T T E R',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                              ),
                              MyButton(
                                text: '←',
                                function: moveLeft,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              MyButton(
                                text: '↑',
                                function: moveUp,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                              ),
                              MyButton(
                                text: '↓',
                                function: moveDown,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                              ),
                              MyButton(
                                text: '→',
                                function: moveRight,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                              ),
                              MyButton(
                                text: 'b',
                                function: pressedB,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              MyButton(
                                text: 'a',
                                function: pressedA,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Text(
                    'C R E A T E D B Y 4 R N O N Y',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
