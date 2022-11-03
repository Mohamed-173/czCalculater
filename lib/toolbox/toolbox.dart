import 'package:flutter/material.dart';

double getHeight(context, double percentage) {
  double h = (MediaQuery.of(context).size.height) / 100;
  return h * percentage;
}

double getWidth(context, double percentage) {
  double h = (MediaQuery.of(context).size.width) / 100;
  return h * percentage;
}

void to(BuildContext context, Widget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

void close(BuildContext context, Widget screen) {
  Navigator.pop(context, MaterialPageRoute(builder: (context) => screen));
}
