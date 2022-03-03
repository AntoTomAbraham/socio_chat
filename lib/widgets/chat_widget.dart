import 'package:chat_app_/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/message_model.dart';

class chatwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .9,
      color: Colors.grey[50],
      child: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (BuildContext context, int index) {
            final Message chat = chats[index];
            return GestureDetector(
              onTap: () => Get.to(ChatScreen(
                user: chat.sender,
              )),
              child: Padding(
                padding: const EdgeInsets.only(left: 11.0, right: 11.0),
                child: Container(
                  color: Colors.white,
                  height: Get.height * .1,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundImage:
                            NetworkImage(chat.sender!.imageUrl.toString()),
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
                                chat.sender!.name.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff0088CC),
                                ),
                              ),
                              Text(
                                chat.text as String,
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
                              chat.time.toString(),
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff0088CC),
                                // color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            chat.unread == true
                                ? Container(
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.white54,
                                            offset: Offset(5.0, 5.0),
                                            blurRadius: 15.0,
                                            spreadRadius: 1.0),
                                        BoxShadow(
                                            color: Colors.white54,
                                            offset: Offset(-5.0, -5.0),
                                            blurRadius: 15.0,
                                            spreadRadius: 1.0),
                                      ],
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
              ),
            );
          }),
    );
  }
}
