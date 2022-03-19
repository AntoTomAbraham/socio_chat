import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

class playvideo extends StatefulWidget {
  String videoLink;
  playvideo({required this.videoLink});
  //const playvideo({Key? key}) : super(key: key);

  @override
  State<playvideo> createState() => _playvideoState();
}

class _playvideoState extends State<playvideo> {
  VideoPlayerController? _controller;
  ChewieController? _chewieController;
  //InAppWebViewController webView;
  @override
  void initState() {
    // try {
    //   _controller = VideoPlayerController.network(widget.videoLink);
    // } catch (e) {
    //   print(e);
    // }

    // _chewieController = ChewieController(
    //   looping: true,
    //   aspectRatio: 16 / 9,
    //   autoInitialize: true,
    //   videoPlayerController: _controller as VideoPlayerController,
    // );
    // print("This is video Link " + widget.videoLink);
    // _controller = VideoPlayerController.network(widget.videoLink)
    //   ..initialize().then((_) {
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //     setState(() {});
    //   });
    // super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController!.dispose();
    // TODO: implement dispose
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.place, color: Colors.white),
      //   onPressed: () {
      //     setState(() {
      //       _controller!.value.isPlaying
      //           ? _controller!.pause()
      //           : _controller!.play();
      //     });
      //   },
      // ),
      body: SingleChildScrollView(
          child: Container(
        color: Colors.black,
        height: Get.height * 1,
        width: Get.width * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Chewie(controller: _chewieController as ChewieController)
            Container(
              height: Get.height * .5,
              child: WebView(
                initialUrl: widget.videoLink,
                javascriptMode: JavascriptMode.unrestricted,
              ),
            )
            // InAppWebView(
            //   initialUrl:
            //       "https://drive.google.com/file/d/1O8WF2MsdyoKpQZE2973IFPRpqwKUjm_q/preview",
            //   initialHeaders: {},
            //   initialOptions: InAppWebViewGroupOptions(
            //     crossPlatform: InAppWebViewOptions(
            //       debuggingEnabled: true,
            //     ),
            //   ),
            //   onWebViewCreated: (InAppWebViewController controller) {
            //     webView = controller;
            //   },
            //   onLoadStart: (InAppWebViewController controller, String url) {},
            //   onLoadStop: (InAppWebViewController controller, String url) {},
            // )
            // Center(
            //   child: _controller!.value.isInitialized
            //       ? AspectRatio(
            //           aspectRatio: _controller!.value.aspectRatio,
            //           child: VideoPlayer(_controller!),
            //         )
            //       : Container(),
            // )
          ],
        ),
      )),
    );
  }
}
