import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color? color;
  String? text;
  double? size;
  TextOverflow? textOverFlow;

  SmallText({
    Key? key,
    this.color = const Color(0X0022577A),
    required this.text,
    this.size = 10,
    this.textOverFlow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "BigText",
      style: TextStyle(
        color: color,
        fontSize: size,
        overflow: textOverFlow,
      ),
    );
  }
}
