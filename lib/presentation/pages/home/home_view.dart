import 'package:fdflutter/presentation/pages/setting/setting_view.dart';
import 'package:fdflutter/presentation/pages/todo/todo_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Scaffold(
      appBar: AppBar(
        title: Text('appTitle'.tr),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // if (value == 'all') {
              //   controller.fetchToDos();
              // } else if (value == 'completed') {
              //   controller.fetchToDos(completed: true);
              // } else if (value == 'incomplete') {
              //   controller.fetchToDos(completed: false);
              // }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'all',
                child: Text('All'),
              ),
              const PopupMenuItem<String>(
                value: 'completed',
                child: Text('Completed'),
              ),
              const PopupMenuItem<String>(
                value: 'incomplete',
                child: Text('Incomplete'),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        elevation: 8,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'appTitle'.tr,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // const GithubUserInfoWidget(),
                  ],
                ),
                Divider(
                  color: Theme.of(Get.context!).colorScheme.primary,
                  thickness: 0.5,
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      ListTile(
                        title: Text('Home'.tr),
                        leading: const Icon(Icons.list),
                        onTap: () {
                          Get.back();
                        },
                      ),
                      ListTile(
                        title: Text('Settings'.tr),
                        leading: const Icon(Icons.settings),
                        onTap: () {
                          Get.to(SettingPage());
                        },
                      ),
                      ListTile(
                        title: Text('Help'.tr),
                        leading: const Icon(Icons.help),
                        onTap: () {
                          // Add your help page navigation logic here
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: const Text(
                    'App Version 1.1.0',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TodoPage(),
    );
  }
}
