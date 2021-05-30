import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyWidgets {
  Column MinMaxTemp() {
    return Column(
      children: <Widget>[
        Text(
          '18\u00B0',
          style: TextStyle(
              fontSize: 100, fontWeight: FontWeight.w300, letterSpacing: 2.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.arrow_drop_down,
              size: 50,
            ),
            Text('18\u00B0'),
            Icon(
              Icons.arrow_drop_up,
              size: 50,
            ),
            Text('18\u00B0'),
          ],
        )
      ],
    );
  }
}
