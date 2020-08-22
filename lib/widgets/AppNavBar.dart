import 'dart:async';
import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../materials/imageLoader.dart';

import '../materials/materials.dart';
import '../materials/utilities.dart';
import 'package:flutter/cupertino.dart';
import '../extensions/hover.dart';

class AppNavBar extends StatefulWidget {
  Utilities utilities;
  PageController _pageController;

  AppNavBar(Utilities utilities, PageController _pageController) {
    this.utilities = utilities;
    this._pageController = _pageController;
  }

  @override
  State<StatefulWidget> createState() {
    return AppNavBarState(utilities);
  }
}

class AppNavBarState extends State<AppNavBar> with TickerProviderStateMixin {
  //Constructor
  Utilities utilities;

  AppNavBarState(Utilities utilities) {
    this.utilities = utilities;
  }

  //constants
   int universialAnimationDuration = 300;
  static const Curve universialCurve = Curves.easeInOutCubic;

  //variables
  bool buttonOnePressed = false;
  bool buttonTwoPressed = false;
  bool buttonThreePressed = false;
  bool buttonFourPressed = false;


  int backgroundColorChangeTime ;
  double joinButtonOpacity;

  bool lastScrollDirectionDown = true;



  //background opacity variable

  Animation<double> animationBackgroundOpacity;
  AnimationController animationBackgroundOpacityController;
  AnimationStatus animationBackgroundOpacityStatus;
  double animationBackgroundOpacityValue;


  Animation<double> animationJoinButtonOpacity;
  static AnimationController animationJoinButtonOpacityController;
  AnimationStatus animationJoinButtonOpacityStatus;
  double animationJoinButtonOpacityValue;


  //barLength
  double topBarWidth = 0;

  String navBarString;

  Color normalColor;
  Color pressedColor;
  Color backgroundColor;
  Color joinColor;
  Image joinImage;

  double opacityOne;
  double opacityTwo;

  double blinkOpacity;
  Timer timer;


  @override
  void initState() {
    super.initState();
    normalColor = Colors.white;
    pressedColor = Colors.white;
    joinColor = Color(0xffFFFFFF);
    joinImage = ImageLoaderState.joinTheRevoltButtonPngLOAD;
    backgroundColor = Colors.transparent;
    backgroundColorChangeTime = 300;
    opacityOne = 1;
    opacityTwo = 0;
    blinkOpacity = 1;
    joinButtonOpacity = 0;

    navBarString =  navBarWhitePng;


    animationBackgroundOpacityController = AnimationController(
        duration: Duration(milliseconds: backgroundColorChangeTime),
        vsync: this);
    animationBackgroundOpacity = Tween<double>(begin: 0, end: 1).animate(
        new CurvedAnimation(
            parent: animationBackgroundOpacityController, curve: universialCurve));
    animationBackgroundOpacity.addListener(() {
      setState(() {
        animationBackgroundOpacityValue = animationBackgroundOpacity.value;
      });
    });

    animationJoinButtonOpacityController = AnimationController(
        duration: Duration(milliseconds: 350),
        vsync: this);
    animationJoinButtonOpacity = Tween<double>(begin: 0, end: 1).animate(
        new CurvedAnimation(
            parent: animationJoinButtonOpacityController, curve: universialCurve));
    animationJoinButtonOpacity.addListener(() {
      setState(() {
        animationJoinButtonOpacityValue = animationJoinButtonOpacity.value;
      });
    });



    //Init actions
    widget._pageController.addListener(loadWidgets);
    widget._pageController.addListener(change);
    widget._pageController.addListener(changeBackwards);

    timer = new Timer.periodic(Duration(seconds: 20), (timer) {
      Timer newTimer;
      setState(() {
        blinkOpacity = 0;
        });

      newTimer = Timer(Duration(milliseconds: 500),(){
      setState(() {
          blinkOpacity = 1;
      });
      });
    });
  }

  @override
  void dispose() {
    animationBackgroundOpacityController.dispose();
    animationJoinButtonOpacityController.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    utilities.update(context);
    return  Opacity(
          opacity: 1,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Container(
                height: 4*utilities.height_rate,
                width: topBarWidth,
                child: Image.asset(navBarString, fit: BoxFit.fill,),
            ),
          ),

      //For shadowing
            Opacity(
              opacity: 0,
              child: Container(
              width: utilities.WIDTH,
              height: 98 * utilities.height_rate,
                child: Image.asset(NavBackPng, fit: BoxFit.fill,),
                decoration: new BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.02),
                      blurRadius: 64, // has the effect of softening the shadow
                      spreadRadius: 24, // has the effect of extending the shadow
                      offset: Offset(
                        0, // horizontal, move right 0
                        12, // vertical, move down 32
                      ),
                    )
                  ],
                ),
                ),
            ),
            Container(
                    width: 843 * utilities.width_rate,
                    height: 98 * utilities.height_rate,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                          Container(
                            alignment: Alignment.center,
                            height: 68 * utilities.width_rate,
                            width: 186 * utilities.width_rate,

                              child: Text(
                                "Green Energy",
                                style: buttonOnePressed
                                    ? TextStyle(

                                    height: 2.5,
                                        fontFamily: "MontserratSemibold",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16 * utilities.width_rate,
                                        color: normalColor)
                                    : TextStyle(
                                        height: 2.5,
                                        fontFamily: "MontserratRegular",
                                        fontSize: 16 * utilities.width_rate,
                                        color: pressedColor),
                            ),
                          ),

                         Container(
                            alignment: Alignment.center,
                            height: 68 * utilities.width_rate,
                            width: 186 * utilities.width_rate,
                              child: Text(
                                "Plan + Power",
                                style: buttonTwoPressed
                                    ? TextStyle(height: 2.5,
                                        fontFamily: "MontserratSemibold",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16 * utilities.width_rate,
                                        color: normalColor)
                                    : TextStyle(height: 2.5,
                                        fontFamily: "MontserratRegular",
                                        fontSize: 16 * utilities.width_rate,
                                        color: pressedColor),
                              )
                          ),

                           Container(
                              alignment: Alignment.center,
                              height: 68 * utilities.width_rate,
                              width: 186 * utilities.width_rate,
                                child: Text(
                                  "Usage By Device",
                                  style: buttonThreePressed
                                      ? TextStyle(height: 2.5,
                                          fontFamily: "MontserratSemibold",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16 * utilities.width_rate,
                                          color: normalColor)
                                      : TextStyle(height: 2.5,
                                          fontFamily: "MontserratRegular",
                                          fontSize: 16 * utilities.width_rate,
                                          color: pressedColor),
                                ),
                              ),

                           Container(
                            alignment: Alignment.center,
                            height: 68 * utilities.width_rate,
                            width: 186 * utilities.width_rate,

                              child: Text(
                                "Referral Bonus",
                                style: buttonFourPressed
                                    ? TextStyle(height: 2.5,
                                        fontFamily: "MontserratSemibold",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16 * utilities.width_rate,
                                        color: normalColor)
                                    : TextStyle(height: 2.5,
                                        fontFamily: "MontserratRegular",
                                        fontSize: 16 * utilities.width_rate,
                                        color: pressedColor),
                            ),
                          ),

                      ],
                    )),

            Stack(
              children: <Widget>[
                AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: blinkOpacity,
                  child:Opacity(
                    opacity: animationJoinButtonOpacity.value,
                    child: Container(
                          alignment: Alignment.centerRight,
                          width: 1536 * utilities.width_rate,
                          height: 98 * utilities.height_rate,

                          child: Container(
                            width: 196*utilities.width_rate,
                            height: 48*utilities.height_rate,
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Container(
                                  width: 196*utilities.width_rate,
                                  height: 48*utilities.height_rate,
                                  child: joinImage,
                                ),
                                Text(
                                  "JOIN THE REVOLT",
                                  style: TextStyle(
                                    color: joinColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16*utilities.width_rate,
                                    height: 1.3
                                  ),
                                )
                              ],
                            ),
                        )
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  width: 1536 * utilities.width_rate,
                  height: 98 * utilities.height_rate,
                  child:
                  GestureDetector(
                    onTap: (){
                      if (animationJoinButtonOpacity.value > 0) {
                        widget._pageController.animateToPage(
                            0, duration: Duration(milliseconds: 1500 - ((4 -
                            widget._pageController.page.round()) * 250)),
                            curve: Curves.easeOutCubic);
                        utilities.lastScrollIsDown = false;
                      }
                    },
                    behavior: HitTestBehavior.translucent,
                    child: SizedBox(
                      width: 196*utilities.width_rate,
                      height: 48*utilities.height_rate,
                    ),
                  ),
                )
              ],
            )
            ]
            )
          );

  }

  void loadWidgets() {

    if(widget._pageController.page != 0){

      setState(() {
        topBarWidth =(utilities.WIDTH-1600*utilities.width_rate)/2+(290*utilities.width_rate)+widget._pageController.page*190;
        print("++"+topBarWidth.toString());
      });

      if (utilities.lastScrollIsDown){
        if(widget._pageController.page>0.1){
          lightTextOne();
        }
        if(widget._pageController.page>1.1){
          lightTextTwo();
        }
        if(widget._pageController.page>2.1){
          lightTextThree();
        }
        if(widget._pageController.page>3.1){
          lightTextFour();
        }

        if(widget._pageController.page>1.995){
          setState(() {
            navBarString = navBarBarPng;
            joinImage = ImageLoaderState.joinTheRevoltButtonTwoPngLOAD;
            joinColor = Color(0xff78A11B);
          });
        }
      }

      else{



        if(widget._pageController.page<4){
          lightTextThree();
        }
        if(widget._pageController.page<3){
          lightTextTwo();
        }
        if(widget._pageController.page<2){
          lightTextOne();
        }
        if(widget._pageController.page<1){
          lightOffAllSetState();
        }
        if(widget._pageController.page<2) {
          setState(() {
            navBarString = navBarWhitePng;
            joinImage = ImageLoaderState.joinTheRevoltButtonPngLOAD;
            joinColor = Color(0xffFFFFFF);
          });
        }
      }
    }

    if (widget._pageController.page > 1.95) {
      colorChange();
      backgroundFadeIn();
    }
    if (widget._pageController.page < 1.95) {
      backgroundFadeOut();
      colorChangeBack();
    }
    if (widget._pageController.page > 2) {
      backgroundFadeIn();
    }


  }



  void colorChange() {
    setState(() {
      normalColor = Color(0xff78A11B);
      pressedColor = Color(0xff9EA2B0);
    });
  }

  void colorChangeBack() {
    setState(() {
      normalColor = Colors.white;
      pressedColor = Colors.white;
    });
  }

  void backgroundFadeIn(){
    setState(() {
      backgroundColorChangeTime = 300;
      animationBackgroundOpacityController.forward();
    });
  }

  void backgroundFadeOut(){
    setState(() {
      backgroundColorChangeTime = 1;
      animationBackgroundOpacityController.reverse();
    });
  }


  void change(){
    if (widget._pageController.page >= 1.6){
      oneFadeOut();
      twoFadeIn();
      widget._pageController.removeListener(change);
      widget._pageController.addListener(changeBackwards);
    }
  }

  void changeBackwards(){
    if (widget._pageController.page < 1.6){
      oneFadeIn();
      twoFadeOut();
      widget._pageController.removeListener(changeBackwards);
      widget._pageController.addListener(change);
    }
  }

  //second-change backwards sub
  void oneFadeIn(){
    setState(() {
      opacityOne = 1;
    });
  }

  void oneFadeOut(){
    setState(() {
      opacityOne = 0;
    });
  }


  //second-change backwards sub
  void twoFadeIn(){
    setState(() {
      opacityTwo = 1;
    });
  }
  void twoFadeOut(){
    setState(() {
      opacityTwo = 0;
    });
  }

  void lightTextOne(){
    setState(() {
      lightOffAll();
      buttonOnePressed = true;
    });
  }


  void lightTextTwo(){
    setState(() {
      lightOffAll();
      buttonTwoPressed = true;
    });
  }



  void lightTextThree(){
    setState(() {
      lightOffAll();
      buttonThreePressed = true;
    });
  }


  void lightTextFour(){
    setState(() {
      lightOffAll();
      buttonFourPressed = true;
    });
  }

  void lightOffAllSetState(){
    setState(() {
      lightOffAll();
    });
  }
  
  
  void lightOffAll(){
    buttonOnePressed = false;
    buttonTwoPressed = false;
    buttonThreePressed = false;
    buttonFourPressed = false;
  }




}
