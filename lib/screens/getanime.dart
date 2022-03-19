import 'dart:convert';

import 'package:chat_app_/models/anime.dart';
import 'package:chat_app_/screens/playanimevideo.dart';
import 'package:chat_app_/screens/playvideo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class getanime extends StatefulWidget {
  @override
  State<getanime> createState() => _getanimeState();
}

Anime? anime;

class _getanimeState extends State<getanime> {
  Future<dynamic> getJson() async {
    print("Called the ffunction  ");
    var url = Uri.parse(
      'https://api.aniapi.com/v1/anime',
    );
    print("covered url");
    http.Response response = await http.get(url);
    print("after response");
    print(response.statusCode);
    print(json.decode(response.body));
    //anime = animeFromJson(json.decode(response.body));
    //print(anime);
    return Anime.fromJson(json.decode(response.body));
  }

  @override
  void initState() {
    getJson();
    // TODO: implement initState
    super.initState();
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
            child: Icon(Icons.arrow_back, color: Colors.blue)),
        backgroundColor: Colors.white,
        title: Text(
          "Watch Animes",
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        height: Get.height * 1,
        child: Column(
          children: [
            Container(
              height: Get.height * 1 - 100,
              child: FutureBuilder(
                future: getJson(),
                builder: (_, snapshot) {
                  Anime? anime = snapshot.data as Anime?;
                  if (snapshot.hasData) {
                    print("Tihis is snapshot data");
                    // ignore: avoid_print
                    print(anime!.data!.documents!.length);
                    //return Container();
                    return ListView.builder(
                        itemCount: anime.data!.documents!.length,
                        itemBuilder: (context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(playanimeVideo(
                                videoLink: anime
                                    .data!.documents![index].trailerUrl
                                    .toString(),
                                tmdbid: anime.data!.documents![index].tmdbId
                                    .toString(),
                              ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0,
                                  bottom: 8.0,
                                  left: 21.0,
                                  right: 21.0),
                              child: Container(
                                  height: Get.height * .3,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.5), //color of shadow
                                        spreadRadius: 5, //spread radius
                                        blurRadius: 7, // blur radius
                                        offset: Offset(
                                            0, 2), // changes position of shadow
                                        //first paramerter of offset is left-right
                                        //second parameter is top to down
                                      ),
                                      //you can set more BoxShadow() here
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: Get.height * .2,
                                        child: Image.network(
                                          anime.data!.documents![index]
                                              .coverImage as String,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        anime.data!.documents![index].titles!.en
                                            as String,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // Text(anime.data!.documents![0].trailerUrl
                                      //     as String),
                                    ],
                                  )),
                            ),
                          );
                        });
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
