import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class nftpage extends StatelessWidget {
  String name;
  String desc;
  String img;
  String contractadd;
  nftpage(
      {required this.name,
      required this.desc,
      required this.img,
      required this.contractadd});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.blue,
            ),
          ),
          title: Text(
            "Your NFT",
            style: TextStyle(color: Colors.blue),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
            child: Container(
          height: Get.height * 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 21.0, right: 21.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: Get.height * .3,
                  width: Get.width * .4,
                  child: WebView(
                    initialUrl: img,
                    javascriptMode: JavascriptMode.unrestricted,
                  ),
                  // child: Image.network(Nft.ownedNfts![i]
                  //     .metadata!.image as String),
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                ),
                Text(desc),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Balance:",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 20),
                    Text(
                      contractadd,
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
