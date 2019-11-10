import 'package:flutter/material.dart';

class ThinnTheme extends InheritedWidget {
  final ThinnThemeData data;

  ThinnTheme({
    Key key,
    @required Widget child,
    this.data,
  })  : assert(data != null),
        assert(child != null),
        super(key: key, child: child);

  static ThinnThemeData of(BuildContext context) {
    final ThinnTheme inheritedTheme =
        context.inheritFromWidgetOfExactType(ThinnTheme);

    final ThinnThemeData theme = inheritedTheme?.data;
    return theme;
  }

  @override
  bool updateShouldNotify(ThinnTheme old) => data != old.data;
}

@immutable
class ThinnThemeData {
  factory ThinnThemeData({
    Color successColor,
  }) {
    successColor ??= ThinnColors.success[500];
    return ThinnThemeData.raw(
      successColor: successColor,
    );
  }

  ThinnThemeData.raw({
    @required this.successColor,
  }) : assert(successColor != null);

  final Color successColor;
}

class ThinnColors {
  ThinnColors._();

  static const Color transparent = Color(0x00000000);
  static const Color black = Color(0xFF000000);
  static const Color black87 = Color(0xDD000000);
  static const Color black54 = Color(0x8A000000);
  static const Color black45 = Color(0x73000000);
  static const Color black38 = Color(0x61000000);
  static const Color black26 = Color(0x42000000);
  static const Color black12 = Color(0x1F000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color white70 = Color(0xB3FFFFFF);
  static const Color white60 = Color(0x99FFFFFF);
  static const Color white54 = Color(0x8AFFFFFF);
  static const Color white30 = Color(0x4DFFFFFF);
  static const Color white24 = Color(0x3DFFFFFF);
  static const Color white12 = Color(0x1FFFFFFF);
  static const Color white10 = Color(0x1AFFFFFF);

  static const MaterialColor primary = MaterialColor(
    _primaryValue,
    <int, Color>{
      50 : Color(0xFFE1F5F0),
      100 : Color(0xFFB5E5D8),
      200 : Color(0xFF84D4BF),
      300 : Color(0xFF53C3A5),
      400 : Color(0xFF2EB691),
      500 : Color(_primaryValue),
      600 : Color(0xFF08A276),
      700 : Color(0xFF06986B),
      800 : Color(0xFF058F61),
      900 : Color(0xFF027E4E),
    },
  );
  static const int _primaryValue = 0xFF09A97E;

  static const MaterialColor accent = MaterialColor(
    _accentValue,
    <int, Color>{
      50 : Color(0xFFFFEEE8),
      100 : Color(0xFFFFD4C7),
      200 : Color(0xFFFFB8A1),
      300 : Color(0xFFFF9B7B),
      400 : Color(0xFFFF855F),
      500 : Color(_accentValue),
      600 : Color(0xFFFF683D),
      700 : Color(0xFFFF5D34),
      800 : Color(0xFFFF532C),
      900 : Color(0xFFFF411E),
    },
  );
  static const int _accentValue = 0xFFFF7043;



  static const MaterialColor success = MaterialColor(
    _successValue,
    <int, Color>{
      50: Color(0xFFEBF3E2),
      100: Color(0xFFCCE0B8),
      200: Color(0xFFABCC88),
      300: Color(0xFF89B758),
      400: Color(0xFF6FA735),
      500: Color(_successValue),
      600: Color(0xFF4F900F),
      700: Color(0xFF45850C),
      800: Color(0xFF3C7B0A),
      900: Color(0xFF2B6A05),
    },
  );
  static const int _successValue = 0xFF569811;
}

ThemeData buildThinnTheme() {
  return ThemeData(
    // This is the theme of your application.
    //
    // Try running your application with "flutter run". You'll see the
    // application has a blue toolbar. Then, without quitting the app, try
    // changing the primarySwatch below to Colors.green and then invoke
    // "hot reload" (press "r" in the console where you ran "flutter run",
    // or simply save your changes to "hot reload" in a Flutter IDE).
    // Notice that the counter didn't reset back to zero; the application
    // is not restarted.

    // Define the default brightness and colors.
    brightness: Brightness.light,
    primarySwatch: ThinnColors.primary,
    accentColor: ThinnColors.accent,

    // Define the default font family.
    fontFamily: 'Montserrat',

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );
}