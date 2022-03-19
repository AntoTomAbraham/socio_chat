import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GamesVideoTile extends StatelessWidget {
  final String view, imgAssetPath;
  GamesVideoTile({required this.imgAssetPath, required this.view});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.amber,
        ),
        width: 110,
        padding: const EdgeInsets.only(right: 12),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                imgAssetPath,
                height: 170,
                // imageUrl: imgAssetPath,
                // placeholder: (context, string) => const Center(
                //   child: SizedBox(
                //       height: 25, width: 25, child: CircularProgressIndicator()),
                // ),
                fit: BoxFit.fill,
                // errorWidget: (context, _, error) => const Icon(
                //   Icons.error,
                //   color: Colors.black,
                // ),
              ),
            ],
          ),
          Positioned(
              left: 12,
              child: CircleAvatar(
                  radius: 12,
                  child: Icon(
                    Icons.shopping_bag,
                    size: 15,
                  ))),
          Positioned(
              left: 12,
              bottom: 10,
              child: Text(
                view,
                style: TextStyle(color: Colors.white),
              ))
        ]),
      ),
    );
  }
}
