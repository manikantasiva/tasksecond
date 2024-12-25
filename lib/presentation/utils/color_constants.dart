import 'package:flutter/material.dart';

class CustomColors {
  // static Color primaryColor = HexColor('#0F6CBD');
    static Color primaryColor = HexColor('#1a434e');
    static Color splashBgLightColor = HexColor('#164f5ea3');

  static Color secondPrimaryColor = HexColor('#FF8C00');
  static Color white = HexColor('#ffffff');
  static Color black = HexColor('#000000');
  static Color transparent = Colors.transparent;
  static Color textColor = HexColor('#616161');
  static Color subTextColor = HexColor('#242424');
  static Color blueColor = HexColor('#2886DE');
  static Color blackTwentyFive = HexColor('#404040');
  static Color blackForty = HexColor('#666666');
  static Color blackFifty = HexColor('#808080');
  static Color errorColor = HexColor('#fc3636');
  static Color greyFifty = HexColor('#808080');
  static Color greyTwenty = HexColor('#333333');
  static Color greyTwentyFive = HexColor('#404040');
  static Color greyFortySix = HexColor('#757575');
  static Color greySixty = HexColor('#999999');
  static Color greySeventy = HexColor('#b3b3b3');
  static Color greySeventyFour = HexColor('#bdbdbd');
  static Color greyEighty = HexColor('#cccccc');
  static Color greyEightyEight = HexColor('#E0E0E0');
  static Color greyNinety = HexColor('#e6e6e6');
  static Color greyBottomTopStrip = HexColor('#D1D1D1');
  static Color greyNinetyFourNew = HexColor('#DBE0D7');
  static Color dividerClr = HexColor('#C7C7C7');
  static Color greyNinetyNOT = HexColor('#334020');
  static Color greyExpaired = HexColor('#f7f7f7');
  static Color greyNinetyFour = HexColor('#F0F0F0');
  static Color greyNinetyEight = HexColor('#FAFAFA');
  static Color greyEight = HexColor('#DBDBDB');

  static Color lightGreen = HexColor('#F1FAF1');
  static Color darkGreen = HexColor('#107C10');
  static Color lightRed = HexColor('#FDF3F4');
  static Color darkRed = HexColor('#C50F1F');
  static Color lightOrange = HexColor('#FFEEDF');
  static Color darkOrange = HexColor('#DD6A06');
  static Color lightBlue = HexColor('#EBF3FC');
  static Color timeLineLightBlue = HexColor('#B4D6FA');
  static Color darkBlue = HexColor('#0F6CBD');
  static Color lightPurple = HexColor('#C6B1DE');
  static Color lightPink = HexColor('##FFE5E8');
  static Color seaGreen = HexColor('#E2F9E2');
  static Color skyBlue = HexColor('#CFE4FA');
  static Color lightCream = HexColor('#FFEEDF');
  static Color initialsColor = HexColor('#341A51');
  static Color textBlue = HexColor('#115EA3');
  static Color moduleColor = HexColor("#55acee");
  static Color lightBgGrey = HexColor("#eeeeee");


  static MaterialColor materialPrimaryColor = customMaterialColor(primaryColor);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

customMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  // ignore: deprecated_member_use
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  // ignore: deprecated_member_use
  return MaterialColor(color.value, swatch);
}
