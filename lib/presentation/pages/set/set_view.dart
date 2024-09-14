import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'set_logic.dart';

class SetPage extends StatelessWidget {
  SetPage({Key? key}) : super(key: key);

  final logic = Get.put(SetLogic());
  final state = Get.find<SetLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr),
      ),
      body: Obx(() {
        return ListView(
          children: [
            const Divider(),
            ListTile(
              dense: true,
              title: Text('theme'.tr,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            RadioListTile(
              title: const Text('跟随系统'),
              value: ThemeMode.system,
              groupValue: state.themeMode.value,
              onChanged: (value) {
                logic.setThemeMode(ThemeMode.system);
              },
            ),
            RadioListTile(
              title: const Text('暗黑模式'),
              value: ThemeMode.dark,
              groupValue: state.themeMode.value,
              onChanged: (value) {
                logic.setThemeMode(ThemeMode.dark);
              },
            ),
            RadioListTile(
              title: const Text('白色模式'),
              value: ThemeMode.light,
              groupValue: state.themeMode.value,
              onChanged: (value) {
                logic.setThemeMode(ThemeMode.light);
              },
            ),
            const Divider(),
            ListTile(
              dense: true,
              title: Text('language'.tr,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            RadioListTile(
              title: const Text('中文'),
              value: 'zh',
              groupValue: state.locale.value.languageCode,
              onChanged: (value) {
                logic.setLocale(const Locale('zh'));
              },
            ),
            RadioListTile(
              title: const Text('英文'),
              value: 'en',
              groupValue: state.locale.value.languageCode,
              onChanged: (value) {
                logic.setLocale(const Locale('en'));
              },
            ),
          ],
        );
      }),
    );
  }
}
