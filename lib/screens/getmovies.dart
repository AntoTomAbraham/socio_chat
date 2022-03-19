import 'dart:convert';

import 'package:chat_app_/models/movies.dart';
import 'package:chat_app_/screens/playvideo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

class getmovies extends StatefulWidget {
  const getmovies({Key? key}) : super(key: key);

  @override
  State<getmovies> createState() => _getmoviesState();
}

class _getmoviesState extends State<getmovies> {
  Movies? movie;
  VideoPlayerController? _controller;
  // void getVideo(String videoLink) {
  //   _controller = VideoPlayerController.network(videoLink)
  //     ..initialize().then((_) {
  //       // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //       setState(() {});
  //     });
  // }

  Future<Movies?> getJson() async {
    print("Called the ffunction  " + movieController.text);
    var url = Uri.parse(
      'https://private-anon-916cb97172-superembed.apiary-proxy.com/?type=search&query=${search}&max_results=${1}',
    );
    print("covered url");
    http.Response response = await http.get(url);
    print("after response");
    print(response.statusCode);
    print(json.decode(response.body));
    movie = Movies.fromJson(json.decode(response.body));
    return movie;
  }

  final movieController = TextEditingController();
  String search = '';
  @override
  void initState() {
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
          "Watch Movies",
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        height: Get.height * 1,
        width: Get.width * 1,
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 21.0, right: 21.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: Get.width * .75,
                    child: TextField(
                      onChanged: (String element) {
                        setState(() {
                          search = element;
                        });
                      },
                      controller: movieController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Search Filims",
                          fillColor: Colors.white70),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        getJson();
                      },
                      child: Icon(
                        Icons.search,
                        color: Colors.blue,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            movieController.text != ""
                ? Container(
                    height: Get.height * 1 - 100,
                    child: FutureBuilder(
                      future: getJson(),
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          Movies? movie = snapshot.data as Movies?;
                          print(movie);
                          return ListView.builder(
                            itemCount: movie!.results.length,
                            itemBuilder: (context, index) {
                              //getVideo(movie.results[index].url);
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 21.0, right: 21.0, bottom: 20),
                                child: Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(238, 238, 238, 1),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    height: Get.height * .16,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: Get.height * .06,
                                          child: Text(
                                            movie.results[index].title,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FlatButton(
                                              onPressed: () {
                                                Get.to(playvideo(
                                                  videoLink:
                                                      movie.results[index].url,
                                                ));
                                              },
                                              child: Text("Play"),
                                              color: Colors.red,
                                            )
                                          ],
                                        )
                                      ],
                                    )),
                              );
                            },
                          );
                        } else {
                          return SizedBox(height: 10);
                        }
                      },
                    ),
                  )
                : Container(
                    height: 100,
                  )
          ],
        ),
      )),
    );
  }
}
