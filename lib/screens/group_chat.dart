import 'package:chat_app_/widgets/iconn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class groupchat extends StatelessWidget {
  const groupchat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20.0,
        shadowColor: Colors.white70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 21.0),
          child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: iconn(icons: Icons.arrow_back, wid: 8)),
        ),
        leadingWidth: 54,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage(
                "https://tse1.mm.bing.net/th?id=OIP.e7nZj9X805HiOC-ptn7rDQHaE8&pid=Api&P=0&w=236&h=157",
              ),
            ),
            SizedBox(width: 15),
            Text(
              "Group Chat",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert_outlined),
            iconSize: 30.0,
            color: Colors.blue,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: Get.height * 1 - 70 - 90,
          ),
          _buildMessageComposer(),
        ],
      )),
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Colors.grey,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Colors.grey,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
