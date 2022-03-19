import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

class playtwitch extends StatefulWidget {
  String videoId;
  playtwitch({required this.videoId});

  @override
  State<playtwitch> createState() => _playtwitchState();
}

class _playtwitchState extends State<playtwitch> {
  // Future<dynamic> getJson() async {
  //   print("Called the ffunction  ");
  //   var url = Uri.parse(
  //     'https://eth-mainnet.alchemyapi.io/v2/demo/getNFTs/?owner=0xfAE46f94Ee7B2Acb497CEcAFf6Cff17F621c693D',
  //   );
  //   print("covered url");
  //   http.Response response = await http.get(url);
  //   print("after response");
  //   print(response.statusCode);
  //   print(json.decode(response.body));
  //   return nft.fromJson(json.decode(response.body));
  // }
  @override
  Widget build(BuildContext context) {
    print("https://www.twitch.tv/videos/${widget.videoId}");
    return Scaffold(
      body: Container(
        height: Get.height * 1,
        child: Container(
          width: Get.width * 1,
          child: WebView(
            initialUrl: widget.videoId,
            //initialUrl: 'https://www.twitch.tv/videos/368048199',
            //initialUrl: "https://www.twitch.tv/videos/${widget.videoId}",
            javascriptMode: JavascriptMode.unrestricted,
          ),
          // child: Image.network(Nft.ownedNfts![i]
          //     .metadata!.image as String),
        ),
        //child: FutureBuilder(future: , builder: (context, i) {}),
      ),
    );
  }
}
