
import 'dart:async';
import 'dart:html';

import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:revolt_landing/views/sign_in/reset_password.dart';
import '../../materials/utilities.dart';
import '../../extensions/hover.dart';

import 'dart:async';
import 'dart:html';

import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../main.dart';
import '../../materials/validator.dart';
import '../../materials/materials.dart';
import '../../materials/utilities.dart';
import '../../extensions/hover.dart';
import '../../materials/utilities.dart';
import '../../extensions/hover.dart';

import '../../materials/auth_service.dart';
import '../../materials/imageLoader.dart';
import '../../widgets/revolt_text.dart';



import '../../materials/auth_service.dart';
import '../../materials/imageLoader.dart';
import '../../widgets/revolt_text.dart';


import 'package:google_tag_manager/google_tag_manager.dart' as gtm;



class SignInPage extends StatefulWidget {
  Utilities utilities;
  PageController _pageController;
  SignInPage(Utilities utilities, PageController _pageController) {
    this.utilities = utilities;
    this._pageController = _pageController;
  }
  @override
  State<StatefulWidget> createState() => SignInPageState(utilities, _pageController);
}

class SignInPageState extends State<SignInPage> with TickerProviderStateMixin {
  Utilities utilities;
  PageController pageController;

  String email = "";
  String password = "";

  SignInPageState(Utilities utilities, PageController pageController) {
    this.utilities = utilities;
    this.pageController = pageController;
  }

  void initState(){

    NotifyingPageViewState.showhomePageGestureDectors = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    utilities.update(context);
    utilities.setCurrentPage(PageType.SIGN_IN);

    signInViewLanded();

    //actual content size
    return Scaffold(
      backgroundColor: Color(0xff78A11B),

      body:

      Stack(
        children: <Widget> [

          Positioned(
            right:((utilities.WIDTH-1600*utilities.width_rate)/2+945)*utilities.width_rate,
            child:
            Container(
              child: ImageLoaderState.pgSignInFadedVLOAD,
              width: 1200*utilities.width_rate,
              height: 1130*utilities.height_rate,
            ),
          ),
          Container(alignment: Alignment.topCenter,
              child:
              Container(
                width: 1600*utilities.width_rate,
                height: utilities.HEIGHT,
                child:
                Stack(
                  alignment: Alignment.topCenter,
                    children: <Widget>[
                      Container(
                        color: Colors.transparent,
                        height: 128*utilities.height_rate,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 116.09*utilities.width_rate,
                              margin: EdgeInsets.only(left: 64*utilities.width_rate),
                              child: ImageLoaderState.pgSignInRevoltTextLOAD,
                            ),
                            GestureDetector(
                              child: Container(
                                width: 18.67*utilities.width_rate,
                                margin: EdgeInsets.only(right: 70.67*utilities.width_rate),
                                child: ImageLoaderState.pgSignInCrossButtonLOAD,
                              ),
                              onTap: (){
                                Navigator.pop(context);
                              },
                            ).showCursorOnHover
                          ],
                        ),
                      ),
                      Positioned(
                        top: 223*utilities.height_rate,
                        child: Container(
                          child: Text(
                            "Sign in to your reVolt account",
                            style: TextStyle(
                                fontFamily: "KarbonSemibold",
                                fontSize: 42*utilities.width_rate,
                                color: Colors.white,
                                height: 1.1,
                                fontWeight: FontWeight.w800
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 277*utilities.height_rate,
                        child: Container(
                          child: Text(
                            "Track your impact, automate your account, and access everything else.",
                            style: TextStyle(
                                fontFamily: "MontserratRegular",
                                fontSize: 15*utilities.width_rate,
                                color: Color(0xffFFFFF).withOpacity(0.6),
                                height: 2.13,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 357*utilities.height_rate,
                        child:
                          Container(
                            width: 584*utilities.width_rate,
                            height: 348*utilities.height_rate,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Container(
                                    width: 584*utilities.width_rate,
                                    height: 348*utilities.height_rate,
                                    color: Colors.white,
                                  ),
                                ),
                                Positioned(
                                  top: 44*utilities.width_rate,
                                  child: Form(
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            width: 488*utilities.width_rate,
                                            child: TextFormField(
                                              style: TextStyle(
                                                  color: Color(0xff282C3B),
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "MontserratMedium",
                                                  fontSize: 17*utilities.width_rate,
                                                  height: 1.88
                                              ),
                                              cursorWidth: 1.3,
                                              cursorRadius: Radius.circular(3),
                                              cursorColor: Color(0xff78A11B),
                                              decoration: InputDecoration(
                                                enabledBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                    color: Color(0xffEEEEF0)
                                                  ),
                                                ),
                                                focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xffEEEEF0)
                                                  ),
                                                ),
                                                contentPadding: EdgeInsets.all(0),
                                                  labelText: "Email address",
                                                  labelStyle: TextStyle(
                                                    fontFamily: "MontserratMedium",
                                                    fontSize: 17*utilities.width_rate,
                                                    color: Color(0xff9EA2B0),
                                                    height: 1.88,
                                                    fontWeight: FontWeight.w500,
                                                  )
                                              ),
                                              onChanged: (value){
                                                setState(() {
                                                  email = value;
                                                });
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 14*utilities.height_rate,),
                                          Container(
                                            width: 488*utilities.width_rate,
                                            child: TextFormField(
                                              style: TextStyle(
                                                color: Color(0xff78A11B),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "MontserratMedium",
                                                fontSize: 17*utilities.width_rate,
                                                height: 1.88
                                              ),
                                              obscureText: true,
                                              cursorWidth: 1.3,
                                              cursorRadius: Radius.circular(3),
                                              cursorColor: Color(0xff78A11B),
                                              decoration: InputDecoration(
                                                  enabledBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Color(0xffEEEEF0)
                                                      )
                                                  ),
                                                  focusedBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Color(0xffEEEEF0)
                                                    ),
                                                  ),
                                                  contentPadding: EdgeInsets.all(0),
                                                  labelText: "Password",
                                                  labelStyle: TextStyle(
                                                    fontFamily: "MontserratMedium",
                                                    fontSize: 17*utilities.width_rate,
                                                    color: Color(0xff9EA2B0),
                                                    height: 1.88,
                                                    fontWeight: FontWeight.w500,
                                                  )
                                              ),
                                              onChanged: (value){
                                                password = value;
                                              },
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                ),
                                Positioned(
                                  right: 48*utilities.width_rate,
                                  bottom: 48*utilities.height_rate,
                                  child: GestureDetector(
                                    onTap: (){

                                    },
                                    child: Container(
                                      width: 157*utilities.width_rate,
                                      height: 56*utilities.height_rate,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(28*utilities.width_rate),
                                              child: Container(
                                                width: 157*utilities.width_rate,
                                                height: 56*utilities.height_rate,
                                                color: Color(0xff78A11B),
                                              ),
                                            ),

                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                  "Sign in",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16*utilities.width_rate,
                                                  height: 1.12,
                                                  fontFamily: "MontserratSemibold"
                                                ),
                                              ),
                                              SizedBox(width: 16*utilities.width_rate,),
                                              Container(
                                                width: 16*utilities.width_rate,
                                                height: 16*utilities.width_rate,
                                                child: ImageLoaderState.pgSignInSignInArrowLOAD,
                                              )

                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ).showCursorOnHover,
                                ),

                                Positioned(
                                    left: 48*utilities.width_rate,
                                    top: 200*utilities.width_rate,
                                    child: Container(
                                      child: GestureDetector(
                                          behavior: HitTestBehavior.translucent,
                                          onTap: (){
                                            Navigator.push<dynamic>(
                                            context,
                                            MaterialPageRoute<dynamic>(builder: (context) => ResetPassword(utilities, pageController)),
                                            );
                                          },
                                        child: Text(
                                          "Forgot password?",
                                          style: TextStyle(
                                            fontFamily: "MontserratMedium",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13*utilities.width_rate,
                                            height: 1.54,
                                            color: Color(0xff9EA2B0)
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          ),
                      ),
//                      Positioned(
//                        top: 753*utilities.height_rate,
//                        child: Row(
//                          children: <Widget>[
//                            Text(
//                              "Don't have an account yet?",
//                              style: TextStyle(
//                                  color: Color(0xffFFFFF).withOpacity(0.5),
//                                  fontFamily: "MontserratMedium",
//                                  height: 2.13,
//                                  fontSize: 15*utilities.width_rate
//                              ),
//                            ),
//                            SizedBox(width: 16*utilities.width_rate,),
//                            Text(
//                              "Sign up via the App",
//                              style: TextStyle(
//                                  color: Color(0xffFFFFFF),
//                                  fontFamily: "MontserratMedium",
//                                  height: 2.13,
//                                  fontSize: 15*utilities.width_rate
//                              ),
//                            ),
//                          ],
//
//                        ),
//                      ),
//                      Positioned(
//                        top: 801.6*utilities.height_rate,
//                        child: Row(
//                          children: <Widget>[
//                            Container(
//                              width: 158.4*utilities.width_rate,
//                              height: 46.8*utilities.height_rate,
//                              child: ImageLoaderState.pgSignInAppStoreLOAD,
//                            ),
//                            SizedBox(width: 17.2*utilities.width_rate,),
//                            Container(
//                              width: 158.4*utilities.width_rate,
//                              height: 46.8*utilities.height_rate,
//                              child: ImageLoaderState.pgSignInGooglePlayLOAD,
//                            ),
//                          ],
//
//                        ),
//                      )

                    ]
                ),
              )
          )

          //the wheel, Ratio:
          //width:height = 1.3700
        ],
      ),
    );
  }

  void signInViewLanded(){
    gtm.pushEvent('signInView-landed');
  }

}