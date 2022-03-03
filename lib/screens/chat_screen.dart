import 'package:chat_app_/data/menuitems.dart';
import 'package:chat_app_/models/menu_item.dart';
import 'package:chat_app_/screens/share_data.dart';
import 'package:chat_app_/screens/videoaudioscreen.dart';
import 'package:chat_app_/widgets/iconn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/message_model.dart';
import '../models/user_model.dart';

class ChatScreen extends StatefulWidget {
  late final User? user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {
    final Widget msg = Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Container(
          margin: isMe
              ? EdgeInsets.only(
                  top: 8.0,
                  bottom: 8.0,
                  left: 80.0,
                )
              : EdgeInsets.only(
                  top: 8.0,
                  bottom: 8.0,
                ),
          padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 15.0),
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
            color: isMe ? Colors.green.shade200 : Color(0xFFFFEFEE),
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                message.time.toString(),
                style: TextStyle(
                  color: isMe ? Colors.green : Colors.grey,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                message.text.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ));
    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg,
        IconButton(
          icon: Icon(Icons.forward),
          iconSize: 15,
          color: Colors.blueGrey,
          onPressed: () {
            Get.to(sharedata());
          },
        )
      ],
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage(widget.user!.imageUrl.toString()),
            ),
            SizedBox(width: 15),
            Text(
              widget.user!.name.toString(),
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        elevation: 0.0,
        actions: <Widget>[
          GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alertt();
                  },
                );
              },
              child: iconn(icons: Icons.phone, wid: 8)),
          // IconButton(
          //   icon: Icon(Icons.phone),
          //   iconSize: 30.0,
          //   color: Colors.blue,
          //   onPressed: () {},
          // ),
          PopupMenuButton<menuItem>(
            itemBuilder: (context) => [
              ...menuitems.items.map(_buildItem).toList(),
            ],

            icon: iconn(icons: Icons.more_vert, wid: 8),
            // child: IconButton(
            //   icon: Icon(Icons.more_vert_outlined),
            //   iconSize: 30.0,
            //   color: Colors.blue,
            //   onPressed: () {},
            // ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      // topLeft: Radius.circular(30.0),
                      // topRight: Radius.circular(30.0),
                      ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      // topLeft: Radius.circular(30.0),
                      // topRight: Radius.circular(30.0),
                      ),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message message = messages[index];
                      final bool isMe = message.sender!.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<menuItem> _buildItem(menuItem item) => PopupMenuItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              item.iconn,
              color: Colors.blue,
            ),
            Text(item.item.toString()),
          ],
        ),
      );
  Widget alertt() {
    return AlertDialog(
      content: Container(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(videoaudioscreen());
              },
              child: Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Call",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Get.to(videoaudioscreen());
              },
              child: Row(
                children: [
                  Icon(
                    Icons.video_camera_front_rounded,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Video Call",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
