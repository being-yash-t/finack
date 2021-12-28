import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color.fromRGBO(51, 50, 88, 1);
const primarySwatch = MaterialColor(4281610842, {
  50: Color(0xffefeff6),
  100: Color(0xffdfdeed),
  200: Color(0xffbfbddb),
  300: Color(0xff9f9dc8),
  400: Color(0xff7f7cb6),
  500: Color(0xff5f5ba4),
  600: Color(0xff4c4983),
  700: Color(0xff393762),
  800: Color(0xff262442),
  900: Color(0xff131221)
});
// TODO: update these 3 colors
const Color primaryLight = Color.fromRGBO(76, 76, 88, 1.0);
const Color primaryExtraLight = Color.fromRGBO(157, 160, 210, 1.0);
const Color primaryExtraDark = Color.fromRGBO(27, 30, 38, 1);

// const List<Color> mainGradient = [primaryColor, primaryLight];

ThemeData _createTheme({
  required Brightness brightness,
  required Color backgroundColor,
}) {
  final isDark = brightness == Brightness.dark;
  return ThemeData(
      androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
      brightness: brightness,
      scaffoldBackgroundColor: backgroundColor,
      textTheme: _textTheme,
      backgroundColor: backgroundColor,
      primarySwatch: primarySwatch,
      primaryColor: primaryColor,
      appBarTheme: _getAppBarTheme(isDark),
      dialogTheme: _getDialogTheme,
      chipTheme: _getChipTheme(isDark),
      cardTheme: _getCardTheme(isDark),
      buttonTheme: _getButtonTheme(isDark),
      textButtonTheme: _getTextButtonTheme(isDark),
      elevatedButtonTheme: _getElevatedButtonTheme(isDark),
      outlinedButtonTheme: _getOutlinedButtonTheme(isDark),
      pageTransitionsTheme: _getPageTransitionsTheme,
      bottomSheetTheme: _getBottomSheetTheme,
      bottomNavigationBarTheme: _getBottomNavigationBarTheme(isDark),
      floatingActionButtonTheme: _getFloatingActionButtonTheme(isDark));
}

FloatingActionButtonThemeData _getFloatingActionButtonTheme(bool isDark) =>
    FloatingActionButtonThemeData(
        foregroundColor: isDark ? Colors.white : Colors.black,
        backgroundColor: isDark ? primarySwatch[900] : primarySwatch[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ));

ThemeData get lightTheme => _createTheme(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
    );

ThemeData get darkTheme => _createTheme(
      brightness: Brightness.dark,
      backgroundColor: Colors.black,
    );

BottomSheetThemeData get _getBottomSheetTheme => const BottomSheetThemeData(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
    );

AppBarTheme _getAppBarTheme(bool isDark) => AppBarTheme(
      centerTitle: true,
      // backgroundColor: isDark ? Colors.black : Colors.white,
      backgroundColor: isDark ? primarySwatch[900] : primarySwatch[100],
      foregroundColor: isDark ? Colors.white : Colors.black,
      iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
      elevation: 0,
    );

DialogTheme get _getDialogTheme => DialogTheme(
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ));

ChipThemeData _getChipTheme(bool isDark) => ChipThemeData(
      backgroundColor: isDark ? primaryExtraDark : primaryExtraLight,
      brightness: isDark ? Brightness.dark : Brightness.light,
      disabledColor: isDark ? primaryExtraDark : primaryExtraLight,
      labelStyle: _textTheme.button!.copyWith(
        color: isDark ? Colors.white : Colors.black,
      ),
      secondaryLabelStyle: _textTheme.button!.copyWith(
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(8),
      selectedColor: primaryColor,
      secondarySelectedColor: primaryColor,
    );

CardTheme _getCardTheme(bool isDark) => CardTheme(
      color: isDark ? primaryExtraDark : primaryExtraLight,
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );

ButtonThemeData _getButtonTheme(bool isDark) => ButtonThemeData(
      buttonColor: isDark ? primaryLight : primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textTheme: ButtonTextTheme.primary,
    );

TextButtonThemeData _getTextButtonTheme(bool isDark) => TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: isDark ? primaryLight : primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

ElevatedButtonThemeData _getElevatedButtonTheme(bool isDark) =>
    ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      elevation: 0,
      primary: isDark ? primaryLight : primaryColor,
      onPrimary: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ));

OutlinedButtonThemeData _getOutlinedButtonTheme(bool isDark) =>
    OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: isDark ? primaryLight : primaryColor,
        textStyle: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
          color: isDark ? primaryLight : primaryColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

// SliderThemeData _getSliderTheme(bool isDark) => SliderThemeData(
//   activeTrackColor: const Color.fromRGBO(89, 124, 227, 0.7),
//   thumbColor: isDark ? PrimaryLight : PrimaryColor,
//   inactiveTrackColor: Colors.grey[300],
// );

PageTransitionsTheme get _getPageTransitionsTheme => const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
          transitionType: SharedAxisTransitionType.horizontal,
        ),
      },
    );

BottomNavigationBarThemeData _getBottomNavigationBarTheme(bool isDark) =>
    BottomNavigationBarThemeData(
      backgroundColor: isDark ? primarySwatch[900] : primarySwatch[100],
      // backgroundColor: isDark ? Colors.black : Colors.white,
      // unselectedItemColor: Colors.white54,
      selectedItemColor: isDark ? primaryColor : primaryExtraLight,
      unselectedItemColor: isDark ? primaryColor : Colors.black87,
      enableFeedback: true,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      elevation: 0,
      // backgroundColor: isDark
      //     ? primaryExtraDark.withOpacity(0.9)
      //     : primaryExtraLight.withOpacity(0.9),
      // selectedItemColor: isDark ? primaryLight : primaryColor,
    );

TextTheme get _textTheme => TextTheme(
      headline1: GoogleFonts.cabin(
          fontSize: 104, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      headline2: GoogleFonts.cabin(
          fontSize: 65, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      headline3: GoogleFonts.cabin(fontSize: 52, fontWeight: FontWeight.w400),
      headline4: GoogleFonts.cabin(
          fontSize: 37, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headline5: GoogleFonts.cabin(fontSize: 26, fontWeight: FontWeight.w400),
      headline6: GoogleFonts.cabin(
          fontSize: 22, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      subtitle1: GoogleFonts.cabin(
          fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      subtitle2: GoogleFonts.cabin(
          fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyText1: GoogleFonts.montserrat(
          fontSize: 19, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyText2: GoogleFonts.montserrat(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      button: GoogleFonts.montserrat(
          fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      caption: GoogleFonts.montserrat(
          fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      overline: GoogleFonts.montserrat(
          fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    );
