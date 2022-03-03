import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/message_model.dart';

class chat extends StatelessWidget {
  // const chat({Key? key}) : super(key: key);
  int? index;
  chat({this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 11.0, right: 11.0),
      child: Container(
        color: Colors.white,
        height: Get.height * .1,
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage(
                  chats[index!.toInt()].sender!.imageUrl.toString()),
            ),
            SizedBox(
              width: Get.width * .03,
            ),
            Padding(
              padding: EdgeInsets.only(top: 11),
              child: Container(
                width: Get.width * .6,
                height: Get.height * .1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chats[index!.toInt()].sender!.name.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      chats[index!.toInt()].text as String,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 11),
              child: Column(
                children: [
                  Text(
                    chats[index!.toInt()].time.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  chats[index!.toInt()].unread == true
                      ? Container(
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              "12",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      : SizedBox()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
