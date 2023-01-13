import 'package:flutter/material.dart';

class ProfOak extends StatelessWidget {
  double? x;
  double? y;
  String? location;
  String? oakDirection;

  ProfOak({this.x, this.y, this.location, this.oakDirection});

  @override
  Widget build(BuildContext context) {
    if (location == 'littleroot') {
      return Container(
        alignment: Alignment(x!, y!),
        child: Image.asset(
          'lib/images/profoak' + oakDirection! + '.png',
          width: MediaQuery.of(context).size.width * 0.75,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Container();
    }
  }
}
