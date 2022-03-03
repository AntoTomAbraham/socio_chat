import 'package:chat_app_/screens/group_chat.dart';
import 'package:chat_app_/widgets/iconn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class addgroup extends StatelessWidget {
  List ele = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 21.0, right: 21.0),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: iconn(icons: Icons.arrow_back_ios, wid: 8)
                      // child: Container(
                      //   child: Icon(Icons.arrow_back_ios),
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.all(Radius.circular(35)),
                      //       boxShadow: [
                      //         BoxShadow(
                      //             color: Colors.white70,
                      //             offset: Offset(5.0, 5.0),
                      //             blurRadius: 15.0,
                      //             spreadRadius: 1.0),
                      //         BoxShadow(
                      //             color: Colors.white70,
                      //             offset: Offset(-5.0, -5.0),
                      //             blurRadius: 15.0,
                      //             spreadRadius: 1.0),
                      //       ]),
                      // ),
                      ),
                  SizedBox(width: Get.width * .26),
                  Center(
                    child: Text(
                      "Create Group",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: 84,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 42,
                      backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80",
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 50,
                      child: Center(
                          child: Text(
                        "+",
                        style: TextStyle(color: Colors.white),
                      )),
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 200,
              child: Material(
                borderRadius: BorderRadius.circular(90),
                elevation: 20.0,
                shadowColor: Colors.white70,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[400],
                    focusColor: Colors.grey[100],
                    hintText: "Enter group name",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade400, width: 1),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade400, width: 1),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade400, width: 1),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(90),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 70),
            Container(
              height: Get.height * .6,
              width: Get.width * 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                ),
                color: Colors.black,
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Contacts",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    direction: Axis.horizontal,
                    children: ele.map((e) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                        child: CircleAvatar(
                          radius: 32,
                          backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80",
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10),
                  FlatButton(
                    onPressed: () {
                      Get.to(groupchat());
                    },
                    child: Text("Add Group"),
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
