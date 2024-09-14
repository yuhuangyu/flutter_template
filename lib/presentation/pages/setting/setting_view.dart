import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:fdflutter/core/localization/config.dart';
import 'package:fdflutter/data/repositories/todo_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:get/get.dart';
import 'setting_logic.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key? key}) : super(key: key);

  final logic = Get.put(SettingLogic());
  final state = Get.find<SettingLogic>().state;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:
      AppBar(title: Text("settingPageTitle".tr)),
        body: Obx(() {
          return SettingsList(sections: [
            SettingsSection(
              title: const Text('General settings'),
              tiles: [
                SettingsTile.navigation(
                    title: const Text('Language'),
                    leading: const Icon(Icons.language),
                    descriptionInlineIos: true,
                    description: Text(
                        logic.languageName(state.locale.value.languageCode)),

                    onPressed: (BuildContext context) {
                      // show bottom sheet
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          // show picker
                          return SizedBox(
                            height: 200,
                            child: CupertinoPicker(
                              itemExtent: 50,
                              useMagnifier: true,
                              onSelectedItemChanged: (int index) {
                                // change language
                                // _localization.translate(
                                //   mapLocales[index].languageCode,
                                // );
                                var lag = state.mapLocales[index];
                                logic.setLocale(Locale(lag));
                              },
                              children: state.mapLocales
                                  .map((e) => Text(logic.languageName(e)))
                                  .toList(),
                            ),
                          );
                        },
                      );
                    }),
                SettingsTile.navigation(
                    title: const Text('Theme'),
                    leading: const Icon(Icons.dark_mode),
                    descriptionInlineIos: true,
                    description: Text(AdaptiveTheme
                        .of(context)
                        .mode
                        .modeName),
                    onPressed: (BuildContext context) {
                      // show bottom sheet
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          // show picker
                          return SizedBox(
                            height: 200,
                            child: CupertinoPicker(
                                itemExtent: 50,
                                useMagnifier: true,
                                onSelectedItemChanged: (int index) {
                                  // change language
                                  AdaptiveTheme.of(context)
                                      .setThemeMode(state.themeList[index].$1);
                                },
                                children:
                                state.themeList.map((e) => Text(e.$2))
                                    .toList()),
                          );
                        },
                      );
                    }),
              ],
            ),
          ]);
        }),
    );
  }

}
