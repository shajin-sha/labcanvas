import 'package:flutter/material.dart';

class UiColor {
  static Color secondaryColor = UiColors.hexToColor("#089dde");
  static Color greyColor = UiColors.hexToColor("#F1F1F1");
  static Color primaryColor = UiColors.hexToColor("#0066ff");
  static Color darkGreyColor = UiColors.hexToColor("#BDBDBD");
  static Color extraDarkGreyColor = UiColors.hexToColor("#585959");
  static Color scaffoldBackgroundColor = UiColors.hexToColor("#F9FAFA");

  static Color primaryTextColor = UiColors.hexToColor("#000000");
  static Color secondaryTextColor = UiColors.hexToColor("#555555");

  // Error Color
  static Color errorColor = UiColors.hexToColor("#F95B5B");
  // Warning Color
  static Color warningColor = UiColors.hexToColor("#F3B71B");
  // Success Color
  static Color successColor = UiColors.hexToColor("#63C952");
  // OnError Color
  static Color onErrorColor = UiColors.hexToColor("#FFFFFF");
  // CardOnBackground Color
  static Color cardOnBackgroundColor = UiColors.hexToColor("#FFFFFF");

  static List<Color> assentColors = [
    UiColors.hexToColor("#63C952").withOpacity(0.5),
    UiColors.hexToColor("#F3B71B").withOpacity(0.5),
    UiColors.hexToColor("#F95B5B").withOpacity(0.5),
    UiColors.hexToColor("#366fff").withOpacity(0.5),
    UiColors.hexToColor("#FF9029").withOpacity(0.5),
  ];
}

class UiColors {
  // Hex to Color
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  // Color to Hex
  static String colorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2, 8)}';
  }

  // Color to Hex with Alpha
  static String colorToHexWithAlpha(Color color) {
    return '#${color.value.toRadixString(16)}';
  }
}
