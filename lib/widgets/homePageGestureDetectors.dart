import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../materials/utilities.dart';
import '../views/sign_in/sign_in_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../extensions/hover.dart';

class HomePageGestureDectors extends StatelessWidget{
  Utilities utilities;
  PageController pageController;
  HomePageGestureDectors(Utilities utilities, PageController pageController){
    this.utilities = utilities;
    this.pageController = pageController;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
        alignment: Alignment.topCenter,
        width: 1600*utilities.width_rate,
        height: 96*utilities.height_rate,
      padding: EdgeInsets.fromLTRB(0, 0, 160*utilities.width_rate, 0),
        child:
        Container(
          alignment: Alignment.centerRight,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: Row( //SEARCH ABOUT SHOP
                    children: <Widget>[
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap:(){
                          launchFacebook();
                        },
                        child: Container(
                          width: 10.31*utilities.width_rate,
                          height: 20*utilities.height_rate,
                        ),
                      ),
                      SizedBox(width: 24*utilities.width_rate,),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap:(){
                          launchTwitter();
                        },
                        child: Container(
                          width: 20*utilities.width_rate,
                          height: 16.24*utilities.height_rate,

                        ),
                      ),

                      SizedBox(width: 24*utilities.width_rate,),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap:(){
                          launchLinkedIn();
                        },
                        child: Container(
                          width: 20*utilities.width_rate,
                          height: 20*utilities.height_rate,
                        ),
                      ),
                      SizedBox(width: 24*utilities.width_rate,),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap:(){
                          launchInsta();
                        },
                        child: Container(
                          width: 20*utilities.width_rate,
                          height: 20*utilities.height_rate,
                        ),
                      ),

                    ],
                  ),
                ),

                SizedBox(width: 47.69*utilities.width_rate,),

                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                    Navigator.push<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(builder: (context) => SignInPage(utilities, pageController)),
                   );
                  },
                  child: Container(
                    width: 104*utilities.width_rate,
                    height: 48*utilities.height_rate,
                    color: Colors.transparent,
                  ),
                ).showCursorOnHover,

              ]
          ),
        ),
      );
  }

  static void launchFacebook() async{
    const url = 'https://www.facebook.com/revoltau';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static void launchTwitter() async{
    const url = 'https://twitter.com/reVoltAus';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static void launchLinkedIn() async{
    const url = 'https://www.linkedin.com/company/re-volt-energy';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static void launchInsta() async{
    const url = 'https://www.instagram.com/revoltaus/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}