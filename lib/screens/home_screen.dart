import 'package:chat_app_/models/message_model.dart';
import 'package:chat_app_/screens/add_group.dart';
import 'package:chat_app_/screens/group_screen.dart';
import 'package:chat_app_/screens/groupparticipantsselection.dart';
import 'package:chat_app_/screens/searchscreen.dart';
import 'package:chat_app_/widgets/chat_widget.dart';
import 'package:chat_app_/widgets/iconn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  bool isgroup = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: new Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              DrawerHeader(
                  child: Container(
                color: Colors.white54,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 29,
                      backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80",
                      ),
                    ),
                    SizedBox(height: 30),
                    Text("Mr xyz", style: TextStyle(color: Colors.black)),
                    Text("+91 0000000000",
                        style: TextStyle(color: Colors.grey, fontSize: 12))
                  ],
                ),
              )),
              GestureDetector(
                  onTap: () {
                    Get.to(groupselection());
                  },
                  child: tile("New Group", Icons.group)),
              tile("Contact", Icons.person),
              tile("Calls", Icons.call),
              tile("People", Icons.near_me),
              tile("Saved message", Icons.saved_search_rounded),
              tile("Settings", Icons.settings),
              tile("Invite Friends", Icons.person_add),
              tile("Features", Icons.question_mark),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   child: Icon(Icons.add),
        //   backgroundColor: Colors.blue,
        // ),
        appBar: AppBar(
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.only(
          //         bottomLeft: Radius.circular(22),
          //         bottomRight: Radius.circular(22))),
          elevation: 0.0,
          //shadowColor: Colors.white70,
          // shadowColor: Colors.grey.shade300,
          bottom: TabBar(tabs: [
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
                "Groups",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff0088CC),
                ),
              ),
            ),
          ]),
          leading: Padding(
            padding: const EdgeInsets.only(left: 21.0),
            child: GestureDetector(
              onTap: () => _scaffoldKey.currentState?.openDrawer(),
              child: iconn(
                icons: Icons.menu,
                wid: 8,
              ),
            ),
          ),
          leadingWidth: 54,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: GestureDetector(
                  onTap: () {
                    Get.to(searchscreen());
                  },
                  child: iconn(
                    icons: Icons.search,
                    wid: 8,
                  )),
            ),
          ],
          backgroundColor: Colors.white,
          //backgroundColor: Color(0xff0088CC),
          title: Text(
            "Telegram",
            style: TextStyle(
              color: Color(0xff0088CC),
              fontWeight: FontWeight.w600,
            ),
            //backgroundColor: Color(0xff0088CC),
          ),
        ),
        body: TabBarView(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                chatwidget(),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    groupscreen(),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget tile(String name, IconData iconns) {
    return ListTile(
      iconColor: Colors.blue[200],
      title: Text(name, style: TextStyle(color: Colors.blue)),
      leading: iconn(icons: iconns, wid: 8),
    );
  }
}
