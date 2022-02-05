import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
);

const logFormDecoration = InputDecoration(
    filled: true,
    border: InputBorder.none,
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white70, width: 3.0)));

const logTime =
    BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)));
const logOption =
    BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)));

final Shader linearGradient = LinearGradient(
  colors: <Color>[
    Color.fromRGBO(223, 111, 111, 1),
    Color.fromRGBO(255, 207, 102, 1)
  ],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

final Shader linearGradient2 = LinearGradient(
  colors: <Color>[
    Color.fromRGBO(0, 131, 202, 1),
    Color.fromRGBO(0, 194, 203, 1)
  ],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
