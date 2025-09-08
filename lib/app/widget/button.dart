import 'package:flutter/material.dart';

class CustomButton  extends StatelessWidget {
  final double buttonWidth;
  final double buttonHeight;
  final Color customColor;
  final Color borderColor;
  final String buttonContent;
  const CustomButton ({super.key,required this.buttonWidth,required this.buttonHeight,required this.customColor,required this.borderColor,required this.buttonContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight,
      width: buttonWidth,
      decoration: BoxDecoration(
        color: customColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Center(child: Text(buttonContent,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
    );
  }
}