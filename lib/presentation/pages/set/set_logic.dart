import 'package:fdflutter/data/repositories/todo_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'set_state.dart';

class SetLogic extends GetxController {
  final SetState state = SetState();
  final _repository = TodoRepository();
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() async {
    await getThemeModeFromPreferences();
    await getLocaleFromPreferences();
    super.onInit();
  }

  void setThemeMode(ThemeMode model) async {
    Get.changeThemeMode(model);
    state.themeMode.value = model;
    _repository.saveTheme(model.toString().split('.')[1]);
  }

  getThemeModeFromPreferences() async {
    ThemeMode themeMode;
    String themeText = await _repository.getTheme(defaultValue: "system");
    try {
      themeMode =
          ThemeMode.values.firstWhere((e) => describeEnum(e) == themeText);
    } catch (e) {
      themeMode = ThemeMode.system;
    }
    setThemeMode(themeMode);
  }

  void switchLocale() {
    state.locale.value =
        _parseLocale(state.locale.value.languageCode == 'en' ? 'zh' : 'en');
  }

  Locale _parseLocale(String locale) {
    switch (locale) {
      case 'en':
        return const Locale('en');
      case 'zh':
        return const Locale('zh');
      default:
        throw Exception('system locale');
    }
  }

  void setLocale(Locale lol) {
    Get.updateLocale(lol);
    state.locale.value = lol;
    _repository.saveLocale(lol.languageCode);
  }

  getLocaleFromPreferences() async {
    Locale locale;
    String localeText = await _repository.getLocale(defaultValue: "zh");
    try {
      locale = _parseLocale(localeText);
    } catch (e) {
      locale = Get.deviceLocale!;
    }
    setLocale(locale);
  }
}
