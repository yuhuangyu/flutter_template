import 'dart:ui';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:get/get.dart';

class SettingState {
  SettingState() {
    ///Initialize variables
  }
  final locale = const Locale('zh').obs;

  List<(AdaptiveThemeMode, String)> themeList = <(AdaptiveThemeMode, String)>[
    (AdaptiveThemeMode.light, "Light"),
    (AdaptiveThemeMode.dark, "Dark"),
    (
    AdaptiveThemeMode.system,
    "System",
    )
  ];

  List<String> mapLocales = ['en','zh'];

}
