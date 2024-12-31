import 'package:flutter/material.dart';

enum ColorAccent {
  deepPurple(Colors.deepPurpleAccent),
  indigo(Colors.indigoAccent),
  blue(Colors.blueAccent),
  cyan(Colors.cyanAccent),
  teal(Colors.tealAccent),
  green(Colors.greenAccent),
  yellow(Colors.yellowAccent),
  orange(Colors.orangeAccent),
  deepOrange(Colors.deepOrangeAccent),
  pink(Colors.pinkAccent),
  red(Colors.redAccent);

  const ColorAccent(this.color);

  final Color color;
}
