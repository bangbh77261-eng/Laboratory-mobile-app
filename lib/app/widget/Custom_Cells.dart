import 'package:flutter/material.dart';

class CustomCell  extends StatelessWidget {
  final double buttonWidth;
  final double buttonHeight;
  final Color customColor;
  final Color borderColor;
  final String buttonContent;
  const CustomCell ({super.key,required this.buttonWidth,required this.buttonHeight,required this.customColor,required this.borderColor,required this.buttonContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight,
      width: buttonWidth,
      decoration: BoxDecoration(
        color: customColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(12),
          boxShadow: [
        BoxShadow(
          // ignore: deprecated_member_use
          color: Colors.black.withOpacity(0.2),
          blurRadius: 6,
          spreadRadius: 1,
          offset: const Offset(2, 4),
        ),
        ],
      ),
      child: Center(child: Text(buttonContent,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
    );
  }
}