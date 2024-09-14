import 'dart:ui';

import 'package:fdflutter/data/repositories/todo_repository.dart';
import 'package:get/get.dart';

import 'setting_state.dart';

class SettingLogic extends GetxController {
  final SettingState state = SettingState();
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


  void setLocale(Locale lol) {
    Get.updateLocale(lol);
    state.locale.value = lol;
    _repository.saveLocale(lol.languageCode);
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


  String languageName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'zh':
        return '简体中文';
      case 'ja':
        return '小日子';
      default:
        return 'English';
    }
  }

  void switchLocale() {
    state.locale.value =
        _parseLocale(state.locale.value.languageCode == 'en' ? 'zh' : 'en');
  }
}
