import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../widgets/centered_view/centered_view.dart';
import '../../../materials/materials.dart';
import '../../../materials/utilities.dart';
import '../../../extensions/hover.dart';

class CentralContent extends StatefulWidget {

  PageController _pageController;
  Utilities utilities;
  CentralContent(Utilities utilities, PageController _pageController){
    this.utilities = utilities;
    this._pageController = _pageController;
  }



  @override
  State<StatefulWidget> createState()=> CentralContentState(utilities);
}

class CentralContentState extends State<CentralContent>{
  Utilities utilities;
  CentralContentState(Utilities utilities){
    this.utilities = utilities;
  }

  double phoneOpacity = 0;
  double headerOpacity = 0;
  double textOpacity = 0;
  double greenButtonOpacity = 0;
  double greyButtonOpacity = 0;


    Widget build(BuildContext context){
      utilities.update(context);

      return Container(
          width: 1600*utilities.width_rate,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 148*utilities.height_rate,
              ),

              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    SizedBox(width: 404*utilities.width_rate),

                    SizedBox(
                      width: 273*utilities.width_rate,
                      height: 554*utilities.height_rate,
                      child: Image.asset(iphonePng),
                    ),

                    SizedBox(
                      width: 134*utilities.width_rate,
                    ),

                    Container(
                        child:
                        Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 40*utilities.height_rate),

                            Container(

                              child: RichText(
                                  text: new TextSpan(
                                      style: new TextStyle(
                                          fontSize: 38*utilities.width_rate,
                                          fontFamily: 'KarbonSemibold',fontStyle: FontStyle.normal,
                                          color: Colors.white
                                      ),
                                      children: <TextSpan>[
                                        new TextSpan(text: "The power provider\nthat makes sense "),
                                        new TextSpan(text: "to us", style: new TextStyle(color: Color(0xff78A11B),fontSize: 38*utilities.width_rate, height: 1.17, fontStyle: FontStyle.normal,
                                            fontFamily: 'KarbonSemibold'))
                                      ]
                                  )
                              ),
                            ),

                            SizedBox(height: 16*utilities.height_rate,),

                            Container(
                              child:
                              Text('Accusamus et iusto odio dignissimos qui blanditiis\npraesentium ducimus qui blanditiis praesentium',
                                  style: new TextStyle(color: Color(0xffEEEEF0), fontSize: 13.9*utilities.width_rate,
                                      fontFamily: "MontserratRegular",
                                      height: 1.88)
                              ),

                            ),


                            SizedBox(
                              height: 48*utilities.height_rate,
                            ),


                            Row(
                              children: <Widget>[
                                Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      child:
                                      Image.asset(joinTheRevoltPng, width: 204*utilities.width_rate),
                                    ),

                                    Text("Join the reVolt",
                                      style: new TextStyle(
                                          fontFamily: "MontserratSemibold",
                                          fontSize: 16*utilities.width_rate,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(width: 16*utilities.width_rate,),
                                Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      child:
                                      Image.asset(darkGreyLongBubblePng, width: 307*utilities.width_rate),
                                    ),

                                    Container(
                                      alignment: Alignment.center,
                                      height: 64*utilities.height_rate,
                                      width: 307*utilities.width_rate,
                                      child:
                                      TextField(decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Enter your email...',
                                          hintStyle: TextStyle(
                                              fontFamily: "Monserrat Regular",
                                              fontSize: 18*utilities.width_rate,
                                              color: Color(0xffFFFFFF)
                                          )
                                      )
                                      ),
                                    )
                                  ],
                                ),],
                            )


                          ],
                        )
                    ),
                  ]
              )
            ],
          )

      );

  }

}
