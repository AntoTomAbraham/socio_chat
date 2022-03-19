import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class playgame extends StatelessWidget {
  String gameLink;
  playgame({required this.gameLink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: Get.height * 1,
        child: WebView(
          initialUrl: gameLink,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
