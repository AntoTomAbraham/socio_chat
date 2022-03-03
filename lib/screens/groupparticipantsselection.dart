import 'package:chat_app_/screens/add_group.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class groupselection extends StatelessWidget {
  List ele = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          Get.to(addgroup());
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back, color: Colors.blue)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Group",
              style: TextStyle(fontSize: 22, color: Colors.blue),
            ),
            Text(
              "1 of 2000 selected",
              style: TextStyle(fontSize: 10, color: Colors.blue),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height * .1,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 21.0),
                  child: Text(
                    "Add group participants",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            Container(
              height: Get.height * 1,
              child: ListView(
                children: ele.map((e) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 29,
                      backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80",
                      ),
                    ),
                    title: Text("Albert"),
                    subtitle: Text("last seen FEB 25 at 9.39 pm"),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
