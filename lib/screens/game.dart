import 'dart:convert';
import 'package:chat_app_/models/game.dart';
import 'package:chat_app_/screens/playgame.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class games extends StatelessWidget {
  Future<game> getJson() async {
    print("Called the ffunction  ");
    var url = Uri.parse(
      'https://pub.gamezop.com/v3/games?id=3443',
    );

    http.Response response = await http.get(url);

    print(json.decode(response.body));
    return game.fromJson(json.decode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.supervisor_account_outlined)),
        title: Text('Play Games'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.backpack))],
      ),
      body: Container(
        height: Get.height * 1,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: Get.height * 1,
              child: FutureBuilder(
                  future: getJson(),
                  builder: (context, snapshot) {
                    game? Game = snapshot.data as game?;
                    if (snapshot.hasData) {
                      return MasonryGridView.count(
                          crossAxisCount: 3,
                          mainAxisSpacing: 1,
                          crossAxisSpacing: 4,
                          itemCount: Game!.games!.length,
                          itemBuilder: (context, i) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(playgame(
                                    gameLink: Game.games![i].url as String));
                              },
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                width: Get.width * .3,
                                child: Column(
                                  children: [
                                    Image.network(
                                      Game.games![i].assets!.cover as String,
                                      fit: BoxFit.cover,
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Icon(Icons.star_border),
                                    //     //  Text(Game.games![i].rating as String)
                                    //   ],
                                    // )
                                  ],
                                ),
                              ),
                              // onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (_)=> BookDetails(bookModel: allBooks)),),
                              // child: GamesVideoTile(
                              //   imgAssetPath:
                              //       Game.games![i].assets!.cover as String,
                              //   //'https://tse2.mm.bing.net/th?id=OIP.a_BHCwSwkoMHPGeyMCEfCQAAAA&pid=Api&P=0&w=220&h=166',
                              //   view: Game.games![i].assets,
                              // ),
                            );
                          });
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            )
          ],
        )),
      ),
    );
  }
}
