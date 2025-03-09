import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../utilities/colors.dart';

class ETElevatedButton extends StatelessWidget {
  ///A Rectangular `ElevatedButton` with default radius
  const ETElevatedButton({
    Key? key,
    required this.childText,
    required this.onPressed,
    this.fontSize = 18,
    this.isGrey = false,
    this.size,
    this.color,
  }) : super(key: key);

  ///Text to display on the button
  final String childText;

  ///Defines the `fontSize` property of the text on the button - defaults to `fontSize: 18.0`.
  final double fontSize;

  ///`Color` of the button - defaults to `color: AppColors.blue`
  final Color? color;

  final bool isGrey;

  ///`fixedSize` of the button - defaults to `width: 40%` and `height: 50`
  final Size? size;

  ///Sets `ElevatedButton.onPressed` property
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      
      style: ElevatedButton.styleFrom(
        
        backgroundColor: isGrey ? AppColors.blueGrey : color ?? AppColors.blue,
        fixedSize: size ?? Size(context.width- 50, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        childText,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: fontSize,color: AppColors.white),
      ),
    );
  }
}

class ETTextButton extends StatelessWidget {
  const ETTextButton(this.text,
      {Key? key,
      required this.onPressed,
      this.underline = true,
      this.fontSize = 14.0})
      : super(key: key);

  ///Text to display on the button
  final String text;

  ///Underlines the button text on `underline: true` - defaults to true
  final bool underline;

  ///Sets `TextButton.onPressed` property
  final Function() onPressed;

  ///Defines the `fontSize` property of the text on the button - defaults to `fontSize: 14.0`.
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        '$text',
        textAlign: TextAlign.center,
        style: Get.textTheme.labelLarge!.copyWith(
          color: AppColors.blue,
          fontSize: fontSize,
          decoration:
              underline ? TextDecoration.underline : TextDecoration.none,
          textBaseline: TextBaseline.alphabetic,
        ),
      ),
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(
          Size(double.minPositive, 20),
        ),
      ),
    );
  }
}
