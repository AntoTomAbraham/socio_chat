import 'package:carousel_slider/carousel_slider.dart';
import 'package:chat_app_/screens/add_group.dart';
import 'package:chat_app_/screens/groupparticipantsselection.dart';
import 'package:chat_app_/widgets/chat.dart';
import 'package:chat_app_/widgets/chat_widget.dart';
import 'package:chat_app_/widgets/iconn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/group_notification.dart';

class groupscreen extends StatelessWidget {
  // const groupscreen({Key? key}) : super(key: key);
  List colors = [
    0xffa57ecc,
    0xff80b2c4,
    0xffcc7ec2,
    0xffa57ecc,
    0xff80b2c4,
    0xffcc7ec2
  ];
  List items = [
    "Flutter Community",
    "Random Stuff",
    "Gamers",
    "Designers",
    "Singers"
  ];
  List nums = [0, 1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .9,
      child: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 21.0, right: 21.0),
            child: Material(
              borderRadius: BorderRadius.circular(90),
              elevation: 20.0,
              shadowColor: Colors.white70,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for group chat's ",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(90),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(90),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(90),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(90),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 21.0, right: 21.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Groups",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Get.to(groupselection());
                    },
                    child: iconn(icons: Icons.add, wid: 8)),
              ],
            ),
          ),
          SizedBox(height: 20),
          CarouselSlider(
            options: CarouselOptions(height: 140.0, enlargeCenterPage: true),
            items: items.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: Color(colors.elementAt(items.indexOf(i))),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white10,
                                offset: Offset(5.0, 5.0),
                                blurRadius: 15.0,
                                spreadRadius: 1.0),
                            BoxShadow(
                                color: Colors.white10,
                                offset: Offset(-5.0, -5.0),
                                blurRadius: 15.0,
                                spreadRadius: 1.0),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    i,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.red,
                                    child: Text(
                                      "1",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              groupnotification(),
                            ],
                          ),
                        ),
                      ));
                },
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 21.0, right: 21.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Recents",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
              height: Get.height * .35,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: nums.map((e) {
                  return chat(
                    index: e,
                  );
                }).toList(),
              ))
        ],
      ),
    );
  }
}
