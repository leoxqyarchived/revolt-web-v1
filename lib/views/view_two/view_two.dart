import 'dart:async';
import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../../materials/materials.dart';
import '../../views/home/home_view.dart';
import '../../main.dart';
import '../../materials/utilities.dart';
import 'package:google_tag_manager/google_tag_manager.dart' as gtm;

class ViewTwo extends StatefulWidget {
  Utilities utilities;
  PageController _pageController;
  ViewTwo(Utilities utilities, PageController _pageController) {
    this.utilities = utilities;
    this._pageController = _pageController;
  }
    @override
    State<StatefulWidget> createState() => _ViewTwoState(utilities);
}


class _ViewTwoState extends State<ViewTwo> with TickerProviderStateMixin  {
  Utilities utilities;
  _ViewTwoState(Utilities utilities) {
    this.utilities = utilities;
  }

  //variables
  static final int universialAnimationDuration = 1300;
  static final double widgetMoveDelta = 15;
  static final Curve universialCurve = Curves.easeInOutQuart;

  //Moving Animation variables
  //content area
  //Headerone move animation
  Animation<double> animationHeaderMove;
  AnimationController animationHeaderMoveController;
  AnimationStatus animationHeaderMoveStatus;
  double animationHeaderMoveValue;

  //HeaderTwo move animation
  Animation<double> animationHeaderTwoMove;
  AnimationController animationHeaderTwoMoveController;
  AnimationStatus animationHeaderTwoMoveStatus;
  double animationHeaderTwoMoveValue;

  //HeaderThree move animation
  Animation<double> animationHeaderThreeMove;
  AnimationController animationHeaderThreeMoveController;
  AnimationStatus animationHeaderThreeMoveStatus;
  double animationHeaderThreeMoveValue;

  //HeaderFourThree move animation
  Animation<double> animationHeaderFourMove;
  AnimationController animationHeaderFourMoveController;
  AnimationStatus animationHeaderFourMoveStatus;
  double animationHeaderFourMoveValue;

  //TextOne move animation
  Animation<double> animationTextOneMove;
  AnimationController animationTextOneMoveController;
  AnimationStatus animationTextOneMoveStatus;
  double animationTextOneMoveValue;

  //TextTwo move animation
  Animation<double> animationTextTwoMove;
  AnimationController animationTextTwoMoveController;
  AnimationStatus animationTextTwoMoveStatus;
  double animationTextTwoMoveValue;

  //TextThree move animation
  Animation<double> animationTextThreeMove;
  AnimationController animationTextThreeMoveController;
  AnimationStatus animationTextThreeMoveStatus;
  double animationTextThreeMoveValue;

  //DashOne Move animation
  Animation<double> animationDashOneMove;
  AnimationController animationDashOneMoveController;
  AnimationStatus animationDashOneMoveStatus;
  double animationDashOneMoveValue;

  //DashTwo Move animation
  Animation<double> animationDashTwoMove;
  AnimationController animationDashTwoMoveController;
  AnimationStatus animationDashTwoMoveStatus;
  double animationDashTwoMoveValue;

  //Background Move animation
  Animation<double> animationBackgroundMove;
  AnimationController animationBackgroundMoveController;
  AnimationStatus animationBackgroundMoveStatus;
  double animationBackgroundMoveValue;


  //Opacity Animation variables
  //content area
  //Headerone Opacity animation
  Animation<double> animationHeaderOpacity;
  AnimationController animationHeaderOpacityController;
  AnimationStatus animationHeaderOpacityStatus;
  double animationHeaderOpacityValue;

  //HeaderTwo Opacity animation
  Animation<double> animationHeaderTwoOpacity;
  AnimationController animationHeaderTwoOpacityController;
  AnimationStatus animationHeaderTwoOpacityStatus;
  double animationHeaderTwoOpacityValue;

  //HeaderThree Opacity animation
  Animation<double> animationHeaderThreeOpacity;
  AnimationController animationHeaderThreeOpacityController;
  AnimationStatus animationHeaderThreeOpacityStatus;
  double animationHeaderThreeOpacityValue;


  //TextOne Opacity animation
  Animation<double> animationTextOneOpacity;
  AnimationController animationTextOneOpacityController;
  AnimationStatus animationTextOneOpacityStatus;
  double animationTextOneOpacityValue;

  //TextTwo Opacity animation
  Animation<double> animationTextTwoOpacity;
  AnimationController animationTextTwoOpacityController;
  AnimationStatus animationTextTwoOpacityStatus;
  double animationTextTwoOpacityValue;

  //TextThree Opacity animation
  Animation<double> animationTextThreeOpacity;
  AnimationController animationTextThreeOpacityController;
  AnimationStatus animationTextThreeOpacityStatus;
  double animationTextThreeOpacityValue;

  //DashOne Opacity animation
  Animation<double> animationDashOneOpacity;
  AnimationController animationDashOneOpacityController;
  AnimationStatus animationDashOneOpacityStatus;
  double animationDashOneOpacityValue;

  //DashTwo Opacity animation
  Animation<double> animationDashTwoOpacity;
  AnimationController animationDashTwoOpacityController;
  AnimationStatus animationDashTwoOpacityStatus;
  double animationDashTwoOpacityValue;

  //Background Opacity animation
  Animation<double> animationBackgroundOpacity;
  AnimationController animationBackgroundOpacityController;
  AnimationStatus animationBackgroundOpacityStatus;
  double animationBackgroundOpacityValue;

  Animation<double> animationDownArrowMove;
  AnimationController animationDownArrowMoveController;
  AnimationStatus animationDownArrowMoveStatus;
  double animationDownArrowMoveValue;

  Animation<double> animationDownArrowOpacity;
  AnimationController animationDownArrowOpacityController;
  AnimationStatus animationDownArrowOpacityStatus;
  double animationDownArrowOpacityValue;


  Animation<double> animationDownArrowJump;
  AnimationController animationDownArrowJumpController;
  AnimationStatus animationDownArrowJumpStatus;
  double animationDownArrowJumpValue;


  @override
  void initState(){
    super.initState();
    HomeViewState.topElementsLock = true;
    NotifyingPageViewState.showhomePageGestureDectors = false;

    //Animations

    //MOVES
    //Headerr
    animationHeaderMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationHeaderMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationHeaderMoveController, curve: universialCurve));
    animationHeaderMove.addListener(() {
      setState(() {
        animationHeaderMoveValue = animationHeaderMove.value;
      });
    });
    animationHeaderMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationHeaderMoveStatus = animationHeaderMove.status;
      });
    });


    //HeaderTwo
    animationHeaderTwoMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationHeaderTwoMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationHeaderTwoMoveController, curve: universialCurve));
    animationHeaderTwoMove.addListener(() {
      setState(() {
        animationHeaderTwoMoveValue = animationHeaderTwoMove.value;
      });
    });
    animationHeaderTwoMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationHeaderTwoMoveStatus = animationHeaderTwoMove.status;
      });
    });

    //HeaderThree
    animationHeaderThreeMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationHeaderThreeMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationHeaderThreeMoveController, curve: universialCurve));
    animationHeaderThreeMove.addListener(() {
      setState(() {
        animationHeaderThreeMoveValue = animationHeaderThreeMove.value;
      });
    });
    animationHeaderThreeMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationHeaderThreeMoveStatus = animationHeaderThreeMove.status;
      });
    });


    //TextOne
    animationTextOneMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationTextOneMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationTextOneMoveController, curve: universialCurve));
    animationTextOneMove.addListener(() {
      setState(() {
        animationTextOneMoveValue = animationTextOneMove.value;
      });
    });
    animationTextOneMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationTextOneMoveStatus = animationTextOneMove.status;
      });
    });

    //Text2
    animationTextTwoMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationTextTwoMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationTextTwoMoveController, curve: universialCurve));
    animationTextTwoMove.addListener(() {
      setState(() {
        animationTextTwoMoveValue = animationTextTwoMove.value;
      });
    });
    animationTextTwoMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationTextTwoMoveStatus = animationTextTwoMove.status;
      });
    });

    //Text3
    animationTextThreeMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationTextThreeMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationTextThreeMoveController, curve: universialCurve));
    animationTextThreeMove.addListener(() {
      setState(() {
        animationTextThreeMoveValue = animationTextThreeMove.value;
      });
    });
    animationTextThreeMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationTextThreeMoveStatus = animationTextThreeMove.status;
      });
    });

    //DashOne
    animationDashOneMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationDashOneMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationDashOneMoveController, curve: universialCurve));
    animationDashOneMove.addListener(() {
      setState(() {
        animationDashOneMoveValue = animationDashOneMove.value;
      });
    });
    animationDashOneMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationDashOneMoveStatus = animationDashOneMove.status;
      });
    });

    //DashTwo
    animationDashTwoMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationDashTwoMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationDashTwoMoveController, curve: universialCurve));
    animationDashTwoMove.addListener(() {
      setState(() {
        animationDashTwoMoveValue = animationDashTwoMove.value;
      });
    });
    animationDashTwoMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationDashTwoMoveStatus = animationDashTwoMove.status;
      });
    });

    //bg
    animationBackgroundMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationBackgroundMove = Tween<double>(begin: 0, end: 100).animate(new CurvedAnimation(parent: animationBackgroundMoveController, curve: universialCurve));
    animationBackgroundMove.addListener(() {
      setState(() {
        animationBackgroundMoveValue = animationBackgroundMove.value;
      });
    });
    animationBackgroundMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBackgroundMoveStatus = animationBackgroundMove.status;
      });
    });


    //Opacity
    //Header
    animationHeaderOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationHeaderOpacity = Tween<double>(begin: 0, end: 1).animate(new CurvedAnimation(parent: animationHeaderOpacityController, curve: universialCurve));
    animationHeaderOpacity.addListener(() {
      setState(() {
        animationHeaderOpacityValue = animationHeaderOpacity.value;
      });
    });
    animationHeaderOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationHeaderOpacityStatus = animationHeaderOpacity.status;
      });
    });


    //HeaderTwo
    animationHeaderTwoOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationHeaderTwoOpacity = Tween<double>(begin: 0, end: 1).animate(new CurvedAnimation(parent: animationHeaderTwoOpacityController, curve: universialCurve));
    animationHeaderTwoOpacity.addListener(() {
      setState(() {
        animationHeaderTwoOpacityValue = animationHeaderTwoOpacity.value;
      });
    });
    animationHeaderTwoOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationHeaderTwoOpacityStatus = animationHeaderTwoOpacity.status;
      });
    });

    //HeaderThree
    animationHeaderThreeOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationHeaderThreeOpacity = Tween<double>(begin: 0, end: 1).animate(new CurvedAnimation(parent: animationHeaderThreeOpacityController, curve: universialCurve));
    animationHeaderThreeOpacity.addListener(() {
      setState(() {
        animationHeaderThreeOpacityValue = animationHeaderThreeOpacity.value;
      });
    });
    animationHeaderThreeOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationHeaderThreeOpacityStatus = animationHeaderThreeOpacity.status;
      });
    });


    //TextOne
    animationTextOneOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationTextOneOpacity = Tween<double>(begin: 0, end: 1).animate(new CurvedAnimation(parent: animationTextOneOpacityController, curve: universialCurve));
    animationTextOneOpacity.addListener(() {
      setState(() {
        animationTextOneOpacityValue = animationTextOneOpacity.value;
      });
    });
    animationTextOneOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationTextOneOpacityStatus = animationTextOneOpacity.status;
      });
    });

    //Text2
    animationTextTwoOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationTextTwoOpacity = Tween<double>(begin: 0, end: 1).animate(new CurvedAnimation(parent: animationTextTwoOpacityController, curve: universialCurve));
    animationTextTwoOpacity.addListener(() {
      setState(() {
        animationTextTwoOpacityValue = animationTextTwoOpacity.value;
      });
    });
    animationTextTwoOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationTextTwoOpacityStatus = animationTextTwoOpacity.status;
      });
    });

    //Text3
    animationTextThreeOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationTextThreeOpacity = Tween<double>(begin: 0, end: 1).animate(new CurvedAnimation(parent: animationTextThreeOpacityController, curve: universialCurve));
    animationTextThreeOpacity.addListener(() {
      setState(() {
        animationTextThreeOpacityValue = animationTextThreeOpacity.value;
      });
    });
    animationTextThreeOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationTextThreeOpacityStatus = animationTextThreeOpacity.status;
      });
    });

    //DashOne
    animationDashOneOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationDashOneOpacity = Tween<double>(begin: 0, end: 1).animate(new CurvedAnimation(parent: animationDashOneOpacityController, curve: universialCurve));
    animationDashOneOpacity.addListener(() {
      setState(() {
        animationDashOneOpacityValue = animationDashOneOpacity.value;
      });
    });
    animationDashOneOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationDashOneOpacityStatus = animationDashOneOpacity.status;
      });
    });

    //DashTwo
    animationDashTwoOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationDashTwoOpacity = Tween<double>(begin: 0, end: 1).animate(new CurvedAnimation(parent: animationDashTwoOpacityController, curve: universialCurve));
    animationDashTwoOpacity.addListener(() {
      setState(() {
        animationDashTwoOpacityValue = animationDashTwoOpacity.value;
      });
    });
    animationDashTwoOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationDashTwoOpacityStatus = animationDashTwoOpacity.status;
      });
    });

    //bg
    animationBackgroundOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationBackgroundOpacity = Tween<double>(begin: 0, end: 1).animate(new CurvedAnimation(parent: animationBackgroundOpacityController, curve: universialCurve));
    animationBackgroundOpacity.addListener(() {
      setState(() {
        animationBackgroundOpacityValue = animationBackgroundOpacity.value;
      });
    });
    animationBackgroundOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBackgroundOpacityStatus = animationBackgroundOpacity.status;
      });
    });

    animationDownArrowMoveController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationDownArrowMove = Tween<double>(begin: 0, end: 25).animate(
        new CurvedAnimation(parent: animationDownArrowMoveController,
            curve: universialCurve));
    animationDownArrowMove.addListener(() {
      setState(() {
        animationDownArrowMoveValue = animationDownArrowMove.value;
      });
    });
    animationDownArrowMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationDownArrowMoveStatus = animationDownArrowMove.status;
      });
    });
    animationDownArrowOpacityController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationDownArrowOpacity =
        Tween<double>(begin: 0, end: 1).animate(
            new CurvedAnimation(
                parent: animationDownArrowOpacityController,
                curve: universialCurve));
    animationDownArrowOpacity.addListener(() {
      setState(() {
        animationDownArrowOpacityValue =
            animationDownArrowOpacity.value;
      });
    });

    animationDownArrowJumpController = AnimationController(
        duration: Duration(milliseconds: 1700),
        vsync: this);
    animationDownArrowJump =
        Tween<double>(begin: 6, end: 0).animate(
            new CurvedAnimation(
                parent: animationDownArrowJumpController,
                curve: Curves.elasticOut));
    animationDownArrowJump.addListener(() {
      setState(() {
        animationDownArrowJumpValue =
            animationDownArrowJump.value;
      });
    });


    //Init actions
    widget._pageController.addListener(loadWidgets);
  }


  @override
  void dispose() {
    animationHeaderMoveController.dispose();
    animationHeaderOpacityController.dispose();
    animationHeaderTwoMoveController.dispose();
    animationHeaderThreeMoveController.dispose();
    animationHeaderThreeOpacityController.dispose();
    animationTextOneMoveController.dispose();
    animationTextOneOpacityController.dispose();
    animationTextTwoMoveController.dispose();
    animationTextTwoOpacityController.dispose();
    animationDashOneMoveController.dispose();
    animationDashOneOpacityController.dispose();
    animationDashTwoMoveController.dispose();
    animationDashTwoOpacityController.dispose();
    animationBackgroundOpacityController.dispose();
    animationBackgroundMoveController.dispose();
    animationDownArrowMoveController.dispose();
    animationDownArrowOpacityController.dispose();
    animationDownArrowJumpController.dispose();

    super.dispose();
  }

  @override
  void setState(fn) {
    if(mounted){
      super.setState(fn);
    }
  }


  @override
  Widget build(BuildContext context) {
    utilities.update(context);
    utilities.setCurrentPage(PageType.TWO);
    viewTwoLanded();

    //actual content size
    return Scaffold(
      backgroundColor: Color(0xff78A11B),

        body:

            Stack(
                alignment: Alignment.topCenter,
                children: <Widget> [
                  Positioned(
                    top: 245*utilities.height_rate - animationBackgroundMove.value,
                    child:
                  Opacity(opacity: animationBackgroundOpacity.value, child:
                      Container(
                        alignment: Alignment.center,
                        height: 500*utilities.height_rate,
                        width: 630*utilities.width_rate,
                        child:  Image.asset(ausMapPng,fit: BoxFit.fill,),
                      )
                  ),
                  ),

              Container(alignment: Alignment.topCenter,
                child:
                Container(
                width: 1600*utilities.width_rate,
                alignment: Alignment.center,
                child:
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: <Widget>[
                    //header one
                    Positioned(
                        top: 243*utilities.height_rate  + widgetMoveDelta - animationHeaderMove.value ,
                        child:
                            Opacity(
                              opacity: animationHeaderOpacity.value,
                              child: Container(
                                child: Container(
                                  child:
                                  RichText(
                                      textAlign: TextAlign.center,
                                      text: new TextSpan(
                                        style: TextStyle(
                                          height: 1.25,
                                        ),
                                        children: <TextSpan>[
                                          new TextSpan(text: "Australia ",
                                            style: TextStyle(
                                                fontSize: 37*utilities.width_rate,
                                                fontFamily: 'KarbonSemibold',fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w800,
                                                height: 1.25,
                                                color: Color(0xffDCDC5A)
                                            ), ),
                                          new TextSpan(text: "is a dormant\nrenewables superpower",
                                              style: new TextStyle(
                                                  color: Color(0xffFFFFFF),
                                                  fontSize: 37*utilities.width_rate,
                                                  height: 1.25,
                                                  fontFamily: 'KarbonSemibold')
                                          )
                                        ],
                                      )
                                  ),
                                ),
                              ),
                            ),

                    ),

                    Positioned(
                      top: 360*utilities.height_rate  + widgetMoveDelta - animationTextOneMove.value ,
                      child:
                        Opacity(opacity: animationTextOneOpacity.value,
                            child:
                                  Container(
                                    alignment: Alignment.topCenter,
                                    child:
                                    Text(
                                      "Play your part in a revolution",
                                      style: TextStyle(
                                        height: 1.6,
                                        color: Color(0xff3B6704),
                                        fontFamily: "MontserratSemibold",
                                        fontSize: 18.5*utilities.width_rate,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                        ),
                    ),

                    Positioned(
                      top: 420*utilities.height_rate  + widgetMoveDelta - animationTextOneMove.value ,
                      child: Opacity(
                        opacity: animationTextOneOpacity.value,
                        child: Container(
                            height: 64*utilities.height_rate,
                            child: Image.asset(pg2DashLineStraightPng)),
                      ),
                    ),
                    //text one
                    //dash one
                    //header two
                    Positioned(
                      top: 500*utilities.height_rate  + widgetMoveDelta - animationHeaderTwoMove.value ,
                      child:
                      Container(
                        width: 1073*utilities.width_rate,
                        alignment: Alignment.topCenter,
                        child:
                        Opacity(opacity: animationHeaderTwoOpacity.value,
                            child:
                            Container(
                              alignment: Alignment.topCenter,
                                    width: 420*utilities.width_rate,
                                    height:107* utilities.width_rate,
                                    child:
                                    Text(
                                      "Get 100%",
                                      style: TextStyle(
                                        color: Color(0xffDCDC5A),
                                        fontFamily: "KarbonSemibold",
                                        fontSize: 64*utilities.width_rate,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                            )
                        ),
                      ),
                    //header three
                    Positioned(
                      top: 580*utilities.height_rate  + widgetMoveDelta - animationHeaderThreeMove.value ,
                      child:
                      Container(
                        width: 386*utilities.width_rate,
                        child:
                        Opacity(opacity: animationHeaderThreeOpacity.value,
                            child:
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[

                                  Container(
                                    width: 137*utilities.width_rate,
                                    height:134* utilities.width_rate,
                                    child:
                                      Stack(
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          Container(
                                            width: 137*utilities.width_rate,
                                            height:104* utilities.height_rate,
                                            child:
                                            Image.asset(darkGreenRecPng),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            width: 137*utilities.width_rate,
                                            height:104* utilities.height_rate,
                                            child: RichText(
                                                textAlign: TextAlign.center,
                                                text: new TextSpan(
                                                  style: TextStyle(height: 1.2),
                                                  children: <TextSpan>[
                                                    new TextSpan(text: "Green\n",
                                                      style: TextStyle(
                                                          fontSize: 31*utilities.width_rate,
                                                          fontFamily: 'KarbonMedium',fontStyle: FontStyle.normal,
                                                          fontWeight: FontWeight.w500,
                                                          color: Color(0xffDCDC5A)
                                                      ), ),
                                                    new TextSpan(text: "energy",
                                                        style: new TextStyle(
                                                            color: Color(0xffFFFFFF),
                                                            fontSize: 31*utilities.width_rate,
                                                            fontWeight: FontWeight.w500,
                                                            fontFamily: 'KarbonMedium')
                                                    )
                                                  ],
                                                )
                                            ),
                                          ),
                                        ],
                                      )
                                    ,

                                  ),

                                  Container(
                                    height: 48*utilities.height_rate,
                                    width: 48*utilities.width_rate,
                                    child: Image.asset(crossPng),
                                  ),

                                  Container(
                                    width: 137*utilities.width_rate,
                                    height:134* utilities.width_rate,
                                    child:
                                    Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 137*utilities.width_rate,
                                          height:104* utilities.height_rate,
                                          child:
                                          Image.asset(darkGreenRecPng),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 137*utilities.width_rate,
                                          height:104* utilities.height_rate,
                                          child: RichText(
                                              textAlign: TextAlign.center,
                                              text: new TextSpan(
                                                style: TextStyle(height: 1.2),
                                                children: <TextSpan>[
                                                  new TextSpan(text: "Cheap\n",
                                                    style: TextStyle(
                                                        fontSize: 31*utilities.width_rate,
                                                        fontFamily: 'KarbonMedium',fontStyle: FontStyle.normal,
                                                        fontWeight: FontWeight.w500,
                                                        color: Color(0xffDCDC5A)
                                                    ), ),
                                                  new TextSpan(text: "Power",
                                                      style: new TextStyle(
                                                          color: Color(0xffFFFFFF),
                                                          fontSize: 31*utilities.width_rate,
                                                          fontWeight: FontWeight.w500,
                                                          fontFamily: 'KarbonMedium')
                                                  )
                                                ],
                                              )
                                          ),
                                        ),
                                      ],
                                    )
                                    ,

                                  ),

                                ]
                            )
                        ),
                      ),
                    ),
                    //dash two
                    Positioned(
                      top: 708*utilities.height_rate+widgetMoveDelta - animationDashTwoMove.value ,
                      child:
                      Opacity(
                        opacity: animationDashTwoOpacity.value,
                        child:

                      Container(
                        height: 82*utilities.height_rate,
                        width: 80*utilities.width_rate,
                        child: Image.asset(dashTwoPng),
                      ),
                      ),
                    ),
                    //text two
                    Positioned(
                        top: 815*utilities.height_rate+widgetMoveDelta - animationTextTwoMove.value ,
                        child:Opacity(opacity: animationTextTwoOpacity.value, child:
                        Container(
                          alignment: Alignment.topCenter,
                          child:
                          Text(
                            "Decarbonise Australia’s\nenergy grid with us",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: "MontserratRegular",
                              color: Colors.white,
                              height: 1.6,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        )
                    ),


                    Positioned(
                        top: 973*utilities.height_rate- widgetMoveDelta + animationDownArrowMove.value
                            +animationDownArrowJump.value,
                        child:Opacity(opacity: animationDownArrowOpacity.value, child:
                        Container(
                          alignment: Alignment.topCenter,
                          width: 14*utilities.width_rate,
                          height: 8*utilities.height_rate,
                          child: Image.asset(pg1DownArrow),
                        ),
                        )
                    )


                  ],
                )

          )
              )
                ]

            )
            );

  }

  void loadWidgets(){
    if (widget._pageController.page == 1) {
      Timer(Duration(milliseconds: 50), headerFadeIn);
      Timer(Duration(milliseconds: 250), textOneFadeIn);
      Timer(Duration(milliseconds: 500), dashOneFadeIn);
      Timer(Duration(milliseconds: 750), headerTwoFadeIn);
      Timer(Duration(milliseconds: 900), headerThreeFadeIn);
      Timer(Duration(milliseconds: 1150), dashTwoFadeIn);
      Timer(Duration(milliseconds: 1300), textTwoFadeIn);
      Timer(Duration(milliseconds: 350), backgroundFadeIn);
      Timer(Duration(milliseconds: 2000), downArrowFadeIn);
      Timer(Duration(milliseconds: 2000), downArrowJump);
      Timer(Duration(milliseconds: (2000+1500*0.45).round()), NotifyingPageViewState.enableScrollDown);

    }
  }

  //sub controller funcs
  void headerFadeIn(){
    animationHeaderMoveController.forward();
    animationHeaderOpacityController.forward();
  }
  void textOneFadeIn(){
    animationTextOneMoveController.forward();
    animationTextOneOpacityController.forward();
  }
  void dashOneFadeIn(){
    animationDashOneMoveController.forward();
    animationDashOneOpacityController.forward();
  }
  void headerTwoFadeIn(){
    animationHeaderTwoMoveController.forward();
    animationHeaderTwoOpacityController.forward();
  }

  void headerThreeFadeIn(){
    animationHeaderThreeMoveController.forward();
    animationHeaderThreeOpacityController.forward();
  }
  void dashTwoFadeIn(){
    animationDashTwoMoveController.forward();
    animationDashTwoOpacityController.forward();
  }

  void textTwoFadeIn(){
    animationTextTwoMoveController.forward();
    animationTextTwoOpacityController.forward();
  }

  void backgroundFadeIn(){
    animationBackgroundMoveController.forward();
    animationBackgroundOpacityController.forward();
  }


  void downArrowFadeIn(){
    animationDownArrowMoveController.forward();
    animationDownArrowOpacityController.forward();
  }

  void downArrowJump(){
    animationDownArrowJumpController.forward();
    animationDownArrowJumpController.repeat( reverse: true, period: Duration(milliseconds: 1300));
  }


  void viewTwoLanded(){
    gtm.pushEvent('viewTwo-landed');
  }

}