import 'package:flutter/material.dart';

const c1 = Color(0xffffe6c8);
const c12 = Color(0xfffeb851);

const c1d = Color(0xFFDDBD95);

const c2 = Color(0xff617957);
const c3 = Color(0xffc95e4e);

final inkPrimary = Color(0xFF2f3542);
final inkAccent = Color(0xFFa4b0be);
final inkBackground = Color(0xFFf1f2f6);
final inkTheme = ThemeData(
  primaryColor: inkPrimary,
  accentColor: inkAccent,
  backgroundColor: inkBackground,
);

const textInputDecoration = InputDecoration(
    filled: true,
    hintStyle: TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
    fillColor: c1,
    enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: c2, width: 0)),
    focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: c1d, width: 2.0)));

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
  colors: const <Color>[
    Color.fromRGBO(223, 111, 111, 1),
    Color.fromRGBO(255, 207, 102, 1)
  ],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

final Shader linearGradient2 = LinearGradient(
  colors: const <Color>[
    Color.fromRGBO(0, 131, 202, 1),
    Color.fromRGBO(0, 194, 203, 1)
  ],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

const List<String> programs = [
  "engineering",
  "architecture",
  "arts and sci",
  "continuing studies",
  "dentistry",
  "education",
  "information",
  "kinesiology",
  "law",
  "management",
  "medicine",
  "music",
  "nursing",
  "pharmacy",
  "public health",
  "social work"
];

const majors = [
  "life sciences",
  "humanities",
  "computer science",
  "physical & mathematical sciences",
  "rotman commerce",
  "social sciences"
];
