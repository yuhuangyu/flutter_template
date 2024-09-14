
import 'package:fdflutter/presentation/pages/home/home_view.dart';
import 'package:fdflutter/presentation/pages/set/set_view.dart';
import 'package:fdflutter/presentation/pages/setting/setting_view.dart';
import 'package:fdflutter/presentation/pages/todo/todo_view.dart';
import 'package:get/get.dart';

final routes = [
  GetPage(name: '/', page: () =>  HomePage()),
  GetPage(name: '/set', page: () => SetPage()),
  GetPage(name: '/setting', page: () => SettingPage()),
  GetPage(name: '/todo', page: () => TodoPage())
];
