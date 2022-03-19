import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

class playanimeVideo extends StatefulWidget {
  String videoLink;
  String tmdbid;
  playanimeVideo({required this.videoLink, required this.tmdbid});
  @override
  State<playanimeVideo> createState() => _playanimeVideoState();
}

class _playanimeVideoState extends State<playanimeVideo> {
  final String api = "18029917e50e6d47c0df46210bcf6f65";
  final String acessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxODAyOTkxN2U1MGU2ZDQ3YzBkZjQ2MjEwYmNmNmY2NSIsInN1YiI6IjYxMzA2ZGU1ZTM4YmQ4MDA0MzZiNjIxNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.w57d_bvI7aLDADWn51gW9IJ1olNsmVQyc7b0NoM5GiA";
  @override
  void initState() {
    print(widget.videoLink);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String id=widget.tmdbid;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Container(
        height: Get.height * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                color: Colors.black,
                height: Get.height * .5,
                child: WebView(
                  initialUrl:"https://www.2embed.ru/embed/tmdb/movie?id=${id}",
                  //initialUrl: widget.videoLink,
                  // initialUrl: Uri.dataFromString(
                  //         '<html><body><iframe src=${widget.videoLink}></iframe></body></html>',
                  //         mimeType: 'text/html')
                  //     .toString(),
                  javascriptMode: JavascriptMode.unrestricted,
                ))
          ],
        ),
      )),
    );
    //   },
    //   );
//  }
  }
}
