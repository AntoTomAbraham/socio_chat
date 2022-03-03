import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class iconn extends StatelessWidget {
  IconData icons;
  double wid;
  Color? colour;
  Color? iconcolour;
  iconn({required this.icons, required this.wid, this.colour, this.iconcolour});
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
          depth: 10,
          shadowLightColorEmboss: Colors.white,
          shadowDarkColorEmboss: Colors.black,
          color: colour == null ? Colors.white : colour,
          boxShape: NeumorphicBoxShape.circle(),
          intensity: 0.7,
          disableDepth: false,
          shape: NeumorphicShape.concave,
          lightSource: LightSource.left,
          border: NeumorphicBorder(
            width: 2,
            color: Colors.white24,
          )),
      child: Padding(
        padding: EdgeInsets.all(wid),
        child: Icon(
          icons,
          color: colour == null ? Colors.blue : iconcolour,
          size: 20,
        ),
      ),
    );
  }
}
