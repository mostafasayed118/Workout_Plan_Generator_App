import 'package:flutter/material.dart';

class AppColor {
  static Color get primaryColor1 => const Color(0xff4CAF50);
  static Color get primaryColor2 => const Color(0xff016A70);
  static Color get primaryColor3 => const Color(0xff349A9F);
  static Color get primaryColor4 => const Color(0xff007CB1);
  static Color get primaryColor6 => const Color(0xff48AB5F);
  static Color get primaryColor7 => const Color(0xff00FF0A);
  static Color get primaryColor8 => const Color(0xffC58BF2);
  static Color get primaryColor9 => const Color(0xff18FF04);
//
  static Color get secondaryColor1 => const Color(0xffFAFAFB);
  static Color get secondaryColor2 => const Color(0xffE2E1E1);
  static Color get secondaryColor3 => const Color(0xffE0855C);
  static Color get secondaryColor4 => const Color(0xff9DCEFF);
  static Color get secondaryColor5 => const Color(0xff92A3FD);

  static List<Color> get primaryG1 => [primaryColor4, primaryColor1];
  static List<Color> get primaryG2 => [primaryColor3, primaryColor1];
  static List<Color> get primaryG3 => [primaryColor6, primaryColor3];
  static List<Color> get primaryG4 => [primaryColor4, secondaryColor4];
  static List<Color> get primaryG5 => [primaryColor1, primaryColor6, white];
  static List<Color> get primaryG6 => [secondaryColor4, primaryColor4];
  static List<Color> get primaryG7 =>
      [primaryColor1.withOpacity(0.3), primaryColor1];
  static List<Color> get primaryG8 => [primaryColor1, primaryColor4];
  static List<Color> get primaryG9 => [white, backgroundColor];
  // static List<Color> get secondaryG => [secondaryColor2, secondaryColor1];
  static List<Color> get secondaryG1 => [secondaryColor4, secondaryColor5];

  static Color get black => const Color(0xff1D1617);
  static Color get gray => const Color(0xff7B6F72);
  // static Color get white => Colors.white;
  static Color get lightGray => const Color(0xffF7F8F8);
  static Color get red => const Color(0xffFF0000);
  static Color get white => const Color(0xffFAFAF8);
  static Color get green => const Color(0xff359a9f);
  static Color get backgroundColor => const Color(0xffF5F5F5);
}
