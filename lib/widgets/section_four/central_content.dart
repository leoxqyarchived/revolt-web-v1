import 'dart:html';
import 'package:flutter/material.dart';
import '../../materials/utilities.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

class CentralContentFour extends StatelessWidget {
  Utilities utilities;
  CentralContentFour(Utilities utilities){
    this.utilities = utilities;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned( child:
              TextContent(utilities)
          )
        ],
      ),
    );
  }
}

class TextContent extends StatelessWidget{
  Utilities utilities;
  TextContent(Utilities utilities){
    this.utilities = utilities;
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedContainer(
      transform: Matrix4Transform().up(18).matrix4,
      duration: Duration(milliseconds: 4000),
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 42*utilities.width_rate,
                  fontFamily: 'KarbonSemibold',
                  color: Color(0xff78A11B),
                  fontWeight: FontWeight.w800,
                  height: 1.0
                ),
                children: <TextSpan>[
                  TextSpan(text: "If you're paying for power\n"),
                  TextSpan(text: "it would make sense to see\nwhere it goes",
                    style: TextStyle(
                      fontSize: 42*utilities.width_rate,
                      fontFamily: 'KarbonSemibold',
                      color: Color(0xff282C3B),
                      fontWeight: FontWeight.w800,
                      height: 1.0
                    ),
                  )
                ]
              )
            ),
            SizedBox(height: 38*utilities.height_rate,),
            Text(
              "Once installed, our GreenE meter gives\nyou real time information about your\nplugged-in devices.",
              style: TextStyle(
                fontFamily: "MontserratRegular",
                fontSize: 18*utilities.width_rate,
                height: 1.88,
                color: Color(0xff666F80)
              ),
            ),
            SizedBox(height: 40*utilities.height_rate,),
            Text(
              "Never have a high bill again",
              style: TextStyle(
                  fontFamily: "MontserratRegular",
                  fontSize: 20*utilities.width_rate,
                  height: 1.88,
                  color: Color(0xff78A11B),
                  fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: 36*utilities.height_rate,),
            Text(
              "Unlike your current energy retailer,\nwe don't profit on your energy usage.\nWhen your usage peaks, we'll send\nnotifications for the specific devices\nthat cause it.",
              style: TextStyle(
              fontFamily: "MontserratRegular",
              fontSize: 20*utilities.width_rate,
              height: 1.88,
              color: Color(0xff666F80),
              fontWeight: FontWeight.w500
              )
            )
        ]
      ),

    );
  }
}

