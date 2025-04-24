import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  TextStyle fontSized(double size) => copyWith(fontSize: size);
  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle withWeight(FontWeight weight) => copyWith(fontWeight: weight);
  TextStyle withFont(String font) => copyWith(fontFamily: font);
}
