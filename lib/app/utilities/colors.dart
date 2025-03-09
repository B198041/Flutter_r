import 'package:flutter/material.dart';

class AppColors {
  // General Colors
  static Color get transparent => Colors.transparent;

  // Dark colors (for black backgrounds)
  static Color get black =>
      Color(0xff121212); // Dark background color (almost black)
  static Color get black54 => Colors.black54; // Black with 54% opacity
  static Color get black87 => Colors.black87; // Black with 87% opacity
  static Color get dark10 =>
      Color(0xff121212); // Darker background color (almost black)
  static Color get dark25 => Color(0xff1f1f1f); // Slightly lighter dark color
  static Color get dark50 =>
      Color(0xff333333); // Dark grey for text, icons, etc.
  static Color get dark65 => Color(0xff4f4f4f); // Medium dark grey
  static Color get dark80 => Color(0xff777777); // Lighter grey for subtle text

  // Blue colors (for accents and highlights)
  static Color get blue => Color(0xff007bb5); // Main blue (slightly darker)
  static Color get blueAccent =>
      Color(0xff1e88e5); // Lighter, more vibrant blue
  static Color get blueGrey => Color(0xff607d8b); // Blue-grey for muted tones
  static Color get blueGreyLight =>
      Color(0xff90a4ae); // Lighter blue-grey for hints, subtitles, etc.
  static Color get blueGreyDark =>
      Color(0xff455a64); // Darker blue-grey for text/icons
  static Color get blueGrey300 => Color(0xff90a4ae); // Blue-grey with 300 shade
  static Color get blueGrey200 => Color(0xffb0bec5); // Blue-grey with 200 shade
  static Color get blueGrey100 => Color(0xffcfd8dc); // Blue-grey with 100 shade
  static Color get blueGrey400 => Color(0xff78909c); // Blue-grey with 400 shade
  static Color get blueGrey700 => Color(0xff455a64); // Blue-grey with 700 shade

  // Light and Medium colors
  static Color get lightBlue =>
      Color(0xff81d4fa); // Light blue for highlights or buttons
  static Color get lightBlueAccent => Color(0xff40c4ff); // Lighter blue accent
  static Color get white => Colors.white; // Pure white color
  static Color get offWhite =>
      Color(0xfff5f5f5); // Off-white for card backgrounds, etc.

  // Other colors
  static Color get green =>
      Colors.greenAccent[400]!; // Green accent for highlights
  static Color get yellow => Colors.yellow[600]!; // Yellow accent
  static Color get red => Colors.redAccent.withOpacity(0.9); // Red for errors
  static Color get purple => Colors.purple[500]!; // Purple accent

  // Text and Icon colors
  static Color get iconColor => dark65; // Icon color based on dark grey
  static Color get textPrimary => dark80; // Primary text color (light grey)
  static Color get textSecondary =>
      dark50; // Secondary text color (lighter grey)
  static Color get textHint => blueGreyLight; // Light hint text color

  // Divider and border colors
  static Color get dividerColor =>
      blueGreyDark; // Darker blue-grey for dividers

  // Gradient for backgrounds or UI elements
  static RadialGradient imageGradient() => RadialGradient(
        center: Alignment.topRight,
        radius: 2.0,
        colors: <Color>[
          AppColors.dark65,
          AppColors.dark10,
        ],
      );
}
