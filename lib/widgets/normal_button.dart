import 'package:flutter/material.dart';

import '../core/utils/app_strings.dart';

class NormalButton extends StatelessWidget {
  final Color textColor;
  final Color borderColor;
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double widthSize;
  final double heightSize;
  final IconData? icon;
  final double fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final String? fontFamily;

  const NormalButton({
    super.key,
    required this.textColor,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.widthSize,
    this.icon,
    required this.heightSize,
    required this.borderColor,
    required this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    // ignore: deprecated_member_use
    final buttonFontSize = mediaQuery.textScaleFactor * fontSize;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 0.5,
            color: Colors.black26,
            offset: Offset(0, 0.5),
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: widthSize,
        elevation: 1,
        child: SizedBox(
          width: widthSize,
          height: heightSize,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: buttonFontSize,
                fontWeight: fontWeight ?? FontWeight.w700,
                fontFamily: AppStrings.fontFamilyHind,
              ),
              textAlign: textAlign,
            ),
          ),
        ),
      ),
    );
  }
}
