import 'package:chat_app_/widgets/chat.dart';
import 'package:chat_app_/widgets/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class sharedata extends StatelessWidget {
  List ele = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 9, 8, 7];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: Get.height * 1,
            width: Get.width * 1,
            child: ListView(
              children: ele.map((e) {
                return chatwidget();
              }).toList(),
            ),
          )
        ],
      )),
    );
  }
}
