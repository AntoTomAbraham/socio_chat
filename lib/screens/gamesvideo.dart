import 'package:chat_app_/models/game.dart';
import 'package:chat_app_/models/token.dart';
import 'package:chat_app_/models/topgame.dart';
import 'package:chat_app_/models/twitch.dart';
import 'package:chat_app_/screens/gametile.dart';
import 'package:chat_app_/screens/playgame.dart';
import 'package:chat_app_/screens/playtwitchvideo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GamesVideoScreen extends StatefulWidget {
  const GamesVideoScreen({Key? key}) : super(key: key);

  @override
  State<GamesVideoScreen> createState() => _GamesVideoScreenState();
}

class _GamesVideoScreenState extends State<GamesVideoScreen> {
  Future<game> getJson() async {
    print("Called the ffunction  ");
    var url = Uri.parse(
      'https://pub.gamezop.com/v3/games?id=3443',
    );

    http.Response response = await http.get(url);

    print(json.decode(response.body));
    return game.fromJson(json.decode(response.body));
  }

  Future<Topgame> getJsonfortwitch() async {
    print("Called the ffunction  ");
    var url = Uri.parse(
      'https://api.twitch.tv/helix/videos?game_id=21779',
    );
    var header = {
      "Authorization": "Bearer ${tok!.accessToken}",
      "Client-Id": "sb813t02ggjak3ioaq06dcmvdy2ulu",
    };
    print(header);
    http.Response response = await http.get(url, headers: header);
    print(json.decode(response.body));
    return Topgame.fromJson(json.decode(response.body));
  }

  Token? tok;
  bool istoken = false;
  Future<Token> gettwitch() async {
    tok = await getTwitchapi.fetchAppAccessToken();
    setState(() {
      if (tok != null) {
        istoken = true;
      }
    });
    print(tok!.accessToken);
    print(await getTwitchapi.fetchAppAccessToken());
    print("This is the accesstoken");
    print(value);
    return await getTwitchapi.fetchAppAccessToken();
  }

  Future gettwitchvideo(String val) async {
    var value = await getTwitchapi.fetchVideoId("33214", val);
    print("This is the video");
    print(value);
  }

  var value = "";
  @override
  void initState() {
    gettwitch();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.supervisor_account_outlined)),
        title: Text('Games Feed'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.backpack))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(12.0),
            //   child: Row(
            //     children: [
            //       Text(
            //         'Top Picks',
            //         style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //     height: 200,
            //     child: FutureBuilder(
            //         future: getJson(),
            //         builder: (context, snapshot) {
            //           game? Game = snapshot.data as game?;
            //           if (snapshot.hasData) {
            //             return ListView.builder(
            //                 itemCount: Game!.games!.length,
            //                 scrollDirection: Axis.horizontal,
            //                 shrinkWrap: true,
            //                 physics: ClampingScrollPhysics(),
            //                 itemBuilder: (context, i) {
            //                   return GestureDetector(
            //                     onTap: () {
            //                       Get.to(playgame(
            //                           gameLink: Game.games![i].url as String));
            //                     },
            //                     // onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (_)=> BookDetails(bookModel: allBooks)),),
            //                     child: GamesVideoTile(
            //                       imgAssetPath:
            //                           Game.games![i].assets!.cover as String,
            //                       //'https://tse2.mm.bing.net/th?id=OIP.a_BHCwSwkoMHPGeyMCEfCQAAAA&pid=Api&P=0&w=220&h=166',
            //                       view: Game.games![i].rating.toString(),
            //                     ),
            //                   );
            //                 });
            //           } else {
            //             return Center(child: CircularProgressIndicator());
            //           }
            //         })),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text(
                    'Discover',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                  ),
                ],
              ),
            ),
            istoken == true
                ? Container(
                    height: Get.height * .8,
                    child: FutureBuilder(
                        future: getJsonfortwitch(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            Topgame? topgamee = snapshot.data as Topgame?;
                            return MasonryGridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 1,
                              crossAxisSpacing: 4,
                              itemCount: topgamee!.data!.length,
                              itemBuilder: (context, index) {
                                Topgame? topgame = snapshot.data as Topgame?;
                                String thumbnail = topgame!
                                    .data![index].thumbnailUrl as String;
                                thumbnail =
                                    thumbnail.replaceAll("%{width}", "400");
                                thumbnail =
                                    thumbnail.replaceAll("%{height}", "300");
                                print("THis is image");
                                print(thumbnail);
                                //print(topgame.data![index].thumbnailUrl);
                                return GestureDetector(
                                    onTap: () {
                                      Get.to(playtwitch(
                                          videoId: topgame.data![index].url
                                              as String));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        height: 200,
                                        width: 160,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 140,
                                              width: 160,
                                              child: Image.network(
                                                thumbnail,
                                                //"https://tse4.mm.bing.net/th?id=OIP.a4g1NoYJgs3Oys6g8E71PAHaEK&pid=Api&P=0&w=280&h=157",
                                                //'https://static-cdn.jtvnw.net/previews-ttv/live_user_${topgame.data![index].userLogin}.jpg',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            Container(
                                                height: 30,
                                                child: Text(topgame.data![index]
                                                    .title as String)),
                                            Row(
                                              children: [
                                                Icon(Icons.remove_red_eye),
                                                Text(topgame
                                                    .data![index].viewCount
                                                    .toString()),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ));
                              },
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        }),
                  )
                : Container(height: 100)
          ],
        ),
      ),
    );
  }
}
