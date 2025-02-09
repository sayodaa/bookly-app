import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.topLeft = 0,
    this.topRight = 0,
    this.bottomLeft = 0,
    this.bottomRight = 0,
    required this.color,
    required this.textColor,
    this.fontWeight = FontWeight.bold,
    this.text,
    this.onPressed,
  });
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;
  final Color color;
  final Color textColor;
  final FontWeight fontWeight;
  final String? text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            bottomLeft: Radius.circular(bottomLeft),
            topRight: Radius.circular(topRight),
            bottomRight: Radius.circular(bottomRight),
          ),
        ),
      ),
      onPressed:onPressed,
      child: Text(
        text ?? '19.9\$',
        style: Styles.textStyle18
            .copyWith(color: textColor, fontWeight: fontWeight),
      ),
    );
  }
}
