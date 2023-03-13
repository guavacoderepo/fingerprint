import 'package:fingerprint/utilities/colors.dart';
import 'package:flutter/material.dart';

TextStyle selectedtitlestyle = TextStyle(fontSize: 15, color: green);

TextStyle unselectedtitlestyle = TextStyle(fontSize: 15, color: grey);

TextStyle inputtextstyle = TextStyle(fontSize: 18, color: black);

TextStyle outlinebuttonstyle = TextStyle(fontSize: 15, color: grey);

appbartitle1(data) {
  return Text(
    data,
    style: TextStyle(fontSize: 15, color: grey),
  );
}

appbartitle2(data) {
  return Text(
    data,
    style: TextStyle(fontSize: 15, color: black),
  );
}

Text h2(
  String text, {
  Color color = Colors.black,
  TextAlign align = TextAlign.center,
  double size = 20,
  FontWeight weight = FontWeight.w300,
}) {
  return Text(
    text,
    style: TextStyle(fontSize: size, fontWeight: weight, color: color),
    textAlign: align,
    overflow: TextOverflow.fade,
  );
}
