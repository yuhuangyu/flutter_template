import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'todo_logic.dart';

class TodoPage extends StatelessWidget {
  TodoPage({Key? key}) : super(key: key);

  final logic = Get.put(TodoLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TodoPage')),
      body: Center(child: Text('TodoPage', style: TextStyle(fontSize: 30.0))),
    );
  }
}
