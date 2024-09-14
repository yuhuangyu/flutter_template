import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetState {
  SetState() {
    ///Initialize variables
  }


  final isObscure = true.obs;

  final themeMode = ThemeMode.system.obs;

  final locale = const Locale('zh').obs;

  final version = "1.0.0".obs;



}
