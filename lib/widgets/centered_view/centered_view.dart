import 'package:flutter/material.dart';
import '../../materials/materials.dart';

class CenteredView extends StatelessWidget {
  final Widget child; //takes in a unchangable widget called child
  const CenteredView({Key key, this.child}): super(key:key);

  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundHomeJpg),
              fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter
        )
      ),
      padding: const EdgeInsets.fromLTRB(200, 48, 200, 0), //the margin of all content on the page to the boarder
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(),
        child: child,
      )
    );
  }
}