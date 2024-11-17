import 'package:flutter/cupertino.dart';

Widget textSizeNomal({
  required String text,
  required double textSize,
  required Color color,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style:  TextStyle(
      color: color,
      fontSize: textSize,
      fontWeight: FontWeight.normal,
    ),
  );
}
