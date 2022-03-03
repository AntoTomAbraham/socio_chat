import 'package:chat_app_/widgets/iconn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class searchscreen extends StatelessWidget {
  List ele = [1, 2, 3, 4, 5, 6];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 54,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 21.0),
            child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: iconn(
                  icons: Icons.arrow_back,
                  wid: 8,
                )),
          ),
          title: TextField(
            decoration: InputDecoration(
              hintText: "Search",
            ),
          ),
          bottom: TabBar(isScrollable: true, tabs: [
            Tab(
              child: Text(
                "Chat",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff0088CC),
                ),
              ),
              // text: "Chat",
            ),
            Tab(
              child: Text(
                "Media",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff0088CC),
                ),
              ),
              // text: "Chat",
            ),
            Tab(
              child: Text(
                "Links",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff0088CC),
                ),
              ),
              // text: "Chat",
            ),
            Tab(
              child: Text(
                "Files",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff0088CC),
                ),
              ),
              // text: "Chat",
            ),
            Tab(
              child: Text(
                "Music",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff0088CC),
                ),
              ),
              // text: "Chat",
            ),
            Tab(
              child: Text(
                "Videos",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff0088CC),
                ),
              ),
              // text: "Chat",
            ),
          ]),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              height: Get.height * .13,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: ele.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 29,
                          backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80",
                          ),
                        ),
                        Text("xyz")
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              height: 20,
              color: Colors.white70,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recent"),
                    Text("Clear"),
                  ],
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
        )),
      ),
    );
  }
}
