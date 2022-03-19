import 'dart:convert';

import 'package:chat_app_/models/nft.dart';
import 'package:chat_app_/screens/nfts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

class ntfscreen extends StatefulWidget {
  const ntfscreen({Key? key}) : super(key: key);

  @override
  State<ntfscreen> createState() => _ntfscreenState();
}

class _ntfscreenState extends State<ntfscreen> {
  Future<dynamic> getJson() async {
    print("Called the ffunction  ");
    var url = Uri.parse(
      'https://eth-mainnet.alchemyapi.io/v2/demo/getNFTs/?owner=0x22D7c48720AbE65EFcA2C39eE2cb4978f4eA12D2',
    );
    print("covered url");
    http.Response response = await http.get(url);
    print("after response");
    print(response.statusCode);
    print(json.decode(response.body));
    return nft.fromJson(json.decode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Your NFTs",
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              height: Get.height * 1,
              child: Center(
                child: FutureBuilder(
                    future: getJson(),
                    builder: (context, snapshot) {
                      nft? Nft = snapshot.data as nft?;
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: Nft!.totalCount,
                            itemBuilder: (context, int i) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(nftpage(
                                    contractadd:
                                        Nft.ownedNfts![i].balance.toString(),
                                    desc: Nft.ownedNfts![i].metadata
                                        ?.description as String,
                                    img: Nft.ownedNfts![i].metadata!.image
                                        as String,
                                    name: Nft.ownedNfts![i].metadata?.name
                                        as String,
                                  ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 21.0,
                                      right: 21.0,
                                      bottom: 10,
                                      top: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    height: Get.height * .25,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, top: 8),
                                          child: Container(
                                            width: Get.width * .3,
                                            child: WebView(
                                              initialUrl: Nft.ownedNfts![i]
                                                  .metadata!.image as String,
                                              javascriptMode:
                                                  JavascriptMode.unrestricted,
                                            ),
                                            // child: Image.network(Nft.ownedNfts![i]
                                            //     .metadata!.image as String),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        // Image.network(Nft.ownedNfts![i].metadata!
                                        //     .image as String)
                                        Container(
                                          width: Get.width * .5,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                Nft.ownedNfts![i].metadata?.name
                                                    as String,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                Nft.ownedNfts![i].metadata!
                                                    .description as String,
                                                style: TextStyle(fontSize: 11),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
