import 'dart:html';

import 'package:flutter/material.dart';

class MyBoy extends StatelessWidget {
  final int? boySprinteCount;
  final String? direction;
  final String? location;
  double height = 20;

  MyBoy({this.boySprinteCount, this.direction, this.location});

  @override
  Widget build(BuildContext context) {
    if (location == 'littleroot') {
      height = 20;
    } else if (location == 'pokelab') {
      height = 30;
    } else if (location == 'battleground' ||
        location == 'attackoptions' ||
        location == 'battlefinishedscreen') {
      height = 0;
    }
    return Container(
      height: height,
      child: Image.asset(
        'lib/images/boy' + direction! + boySprinteCount.toString() + '.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
