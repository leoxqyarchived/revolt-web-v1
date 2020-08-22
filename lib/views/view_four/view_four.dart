import 'dart:async';
import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../../materials/imageLoader.dart';
import '../../main.dart';
import '../../materials/utilities.dart';
import 'package:google_tag_manager/google_tag_manager.dart' as gtm;

class ViewFour extends StatefulWidget {
  Utilities utilities;
  PageController _pageController;
  ViewFour(Utilities utilities, PageController _pageController) {
    this.utilities = utilities;
    this._pageController = _pageController;
  }
  @override
  State<StatefulWidget> createState() => _ViewFourState(utilities);
}

class _ViewFourState extends State<ViewFour> with TickerProviderStateMixin  {
  Utilities utilities;
  _ViewFourState(Utilities utilities) {
    this.utilities = utilities;
  }

  //variables
  static final int universialAnimationDuration = 1000;
  static final double widgetMoveDelta = 15;
  static final double widgetOpacityDelta = 1;

  static final Curve universialCurve = Curves.easeInOutQuart;

  //Wheel area
  // w2000 move animation
  Animation<double> animationw2000Move;
  AnimationController animationw2000MoveController;
  AnimationStatus animationw2000MoveStatus;
  double animationw2000MoveValue;

  // Always move animation
  Animation<double> animationAlwaysMove;
  AnimationController animationAlwaysMoveController;
  AnimationStatus animationAlwaysMoveStatus;
  double animationAlwaysMoveValue;


  // C1 move animation
  Animation<double> animationC1Move;
  AnimationController animationC1MoveController;
  AnimationStatus animationC1MoveStatus;
  double animationC1MoveValue;


  // C2 move animation
  Animation<double> animationC2Move;
  AnimationController animationC2MoveController;
  AnimationStatus animationC2MoveStatus;
  double animationC2MoveValue;


  // C3 move animation
  Animation<double> animationC3Move;
  AnimationController animationC3MoveController;
  AnimationStatus animationC3MoveStatus;
  double animationC3MoveValue;


  // C4 move animation
  Animation<double> animationC4Move;
  AnimationController animationC4MoveController;
  AnimationStatus animationC4MoveStatus;
  double animationC4MoveValue;


  // C5 move animation
  Animation<double> animationC5Move;
  AnimationController animationC5MoveController;
  AnimationStatus animationC5MoveStatus;
  double animationC5MoveValue;


  // C51 move animation
  Animation<double> animationC51Move;
  AnimationController animationC51MoveController;
  AnimationStatus animationC51MoveStatus;
  double animationC51MoveValue;


  // C52 move animation
  Animation<double> animationC52Move;
  AnimationController animationC52MoveController;
  AnimationStatus animationC52MoveStatus;
  double animationC52MoveValue;


  // C53 move animation
  Animation<double> animationC53Move;
  AnimationController animationC53MoveController;
  AnimationStatus animationC53MoveStatus;
  double animationC53MoveValue;


  // C54 move animation
  Animation<double> animationC54Move;
  AnimationController animationC54MoveController;
  AnimationStatus animationC54MoveStatus;
  double animationC54MoveValue;



  // C55 move animation
  Animation<double> animationC55Move;
  AnimationController animationC55MoveController;
  AnimationStatus animationC55MoveStatus;
  double animationC55MoveValue;


  // Kitchen move animation
  Animation<double> animationKitchenMove;
  AnimationController animationKitchenMoveController;
  AnimationStatus animationKitchenMoveStatus;
  double animationKitchenMoveValue;


  // Other move animation
  Animation<double> animationOtherMove;
  AnimationController animationOtherMoveController;
  AnimationStatus animationOtherMoveStatus;
  double animationOtherMoveValue;


  // Shadow move animation
  Animation<double> animationShadowMove;
  AnimationController animationShadowMoveController;
  AnimationStatus animationShadowMoveStatus;
  double animationShadowMoveValue;

  // Home move animation
  Animation<double> animationHomeMove;
  AnimationController animationHomeMoveController;
  AnimationStatus animationHomeMoveStatus;
  double animationHomeMoveValue;

  // Heat move animation
  Animation<double> animationHeatMove;
  AnimationController animationHeatMoveController;
  AnimationStatus animationHeatMoveStatus;
  double animationHeatMoveValue;

  // Red move animation
  Animation<double> animationRedMove;
  AnimationController animationRedMoveController;
  AnimationStatus animationRedMoveStatus;
  double animationRedMoveValue;


  //Opacity Animation variables
  //Wheel area
  // w2000 Opacity animation
  Animation<double> animationw2000Opacity;
  AnimationController animationw2000OpacityController;
  AnimationStatus animationw2000OpacityStatus;
  double animationw2000OpacityValue;

  // Always Opacity animation
  Animation<double> animationAlwaysOpacity;
  AnimationController animationAlwaysOpacityController;
  AnimationStatus animationAlwaysOpacityStatus;
  double animationAlwaysOpacityValue;


  // C1 Opacity animation
  Animation<double> animationC1Opacity;
  AnimationController animationC1OpacityController;
  AnimationStatus animationC1OpacityStatus;
  double animationC1OpacityValue;


  // C2 Opacity animation
  Animation<double> animationC2Opacity;
  AnimationController animationC2OpacityController;
  AnimationStatus animationC2OpacityStatus;
  double animationC2OpacityValue;


  // C3 Opacity animation
  Animation<double> animationC3Opacity;
  AnimationController animationC3OpacityController;
  AnimationStatus animationC3OpacityStatus;
  double animationC3OpacityValue;


  // C4 Opacity animation
  Animation<double> animationC4Opacity;
  AnimationController animationC4OpacityController;
  AnimationStatus animationC4OpacityStatus;
  double animationC4OpacityValue;


  // C5 Opacity animation
  Animation<double> animationC5Opacity;
  AnimationController animationC5OpacityController;
  AnimationStatus animationC5OpacityStatus;
  double animationC5OpacityValue;


  // C51 Opacity animation
  Animation<double> animationC51Opacity;
  AnimationController animationC51OpacityController;
  AnimationStatus animationC51OpacityStatus;
  double animationC51OpacityValue;


  // C52 Opacity animation
  Animation<double> animationC52Opacity;
  AnimationController animationC52OpacityController;
  AnimationStatus animationC52OpacityStatus;
  double animationC52OpacityValue;


  // C53 Opacity animation
  Animation<double> animationC53Opacity;
  AnimationController animationC53OpacityController;
  AnimationStatus animationC53OpacityStatus;
  double animationC53OpacityValue;


  // C54 Opacity animation
  Animation<double> animationC54Opacity;
  AnimationController animationC54OpacityController;
  AnimationStatus animationC54OpacityStatus;
  double animationC54OpacityValue;



  // C55 Opacity animation
  Animation<double> animationC55Opacity;
  AnimationController animationC55OpacityController;
  AnimationStatus animationC55OpacityStatus;
  double animationC55OpacityValue;


  // Kitchen Opacity animation
  Animation<double> animationKitchenOpacity;
  AnimationController animationKitchenOpacityController;
  AnimationStatus animationKitchenOpacityStatus;
  double animationKitchenOpacityValue;


  // Other Opacity animation
  Animation<double> animationOtherOpacity;
  AnimationController animationOtherOpacityController;
  AnimationStatus animationOtherOpacityStatus;
  double animationOtherOpacityValue;


  // Shadow Opacity animation
  Animation<double> animationShadowOpacity;
  AnimationController animationShadowOpacityController;
  AnimationStatus animationShadowOpacityStatus;
  double animationShadowOpacityValue;

  // Home Opacity animation
  Animation<double> animationHomeOpacity;
  AnimationController animationHomeOpacityController;
  AnimationStatus animationHomeOpacityStatus;
  double animationHomeOpacityValue;

  // Heat Opacity animation
  Animation<double> animationHeatOpacity;
  AnimationController animationHeatOpacityController;
  AnimationStatus animationHeatOpacityStatus;
  double animationHeatOpacityValue;

  // Red Opacity animation
  Animation<double> animationRedOpacity;
  AnimationController animationRedOpacityController;
  AnimationStatus animationRedOpacityStatus;
  double animationRedOpacityValue;


  //Else
  //move
  //Background Move animation
  Animation<double> animationBackgroundMove;
  AnimationController animationBackgroundMoveController;
  AnimationStatus animationBackgroundMoveStatus;
  double animationBackgroundMoveValue;

  Animation<double> animationCenterMove;
  AnimationController animationCenterMoveController;
  AnimationStatus animationCenterMoveStatus;
  double animationCenterMoveValue;


  //opacity
  //Background Opacity animation
  Animation<double> animationBackgroundOpacity;
  AnimationController animationBackgroundOpacityController;
  AnimationStatus animationBackgroundOpacityStatus;
  double animationBackgroundOpacityValue;

  Animation<double> animationCenterOpacity;
  AnimationController animationCenterOpacityController;
  AnimationStatus animationCenterOpacityStatus;
  double animationCenterOpacityValue;

  //SPECIAL ANIMATIONS
  //Number tickup
  Animation<int> animationNumberTick;
  AnimationController animationNumberTickController;
  AnimationStatus animationNumberTickStatus;
  int animationNumberTickValue;





  //OTHERs
  Animation<double> animationHeaderMove;
  AnimationController animationHeaderMoveController;
  AnimationStatus animationHeaderMoveStatus;
  double animationHeaderMoveValue;


  Animation<double> animationTextMove;
  AnimationController animationTextMoveController;
  AnimationStatus animationTextMoveStatus;
  double animationTextMoveValue;

  Animation<double> animationHeaderTwoMove;
  AnimationController animationHeaderTwoMoveController;
  AnimationStatus animationHeaderTwoMoveStatus;
  double animationHeaderTwoMoveValue;

  Animation<double> animationTextTwoMove;
  AnimationController animationTextTwoMoveController;
  AnimationStatus animationTextTwoMoveStatus;
  double animationTextTwoMoveValue;

  Animation<double> animationTextThreeMove;
  AnimationController animationTextThreeMoveController;
  AnimationStatus animationTextThreeMoveStatus;
  double animationTextThreeMoveValue;


  Animation<double> animationHeaderOpacity;
  AnimationController animationHeaderOpacityController;
  AnimationStatus animationHeaderOpacityStatus;
  double animationHeaderOpacityValue;


  Animation<double> animationTextOpacity;
  AnimationController animationTextOpacityController;
  AnimationStatus animationTextOpacityStatus;
  double animationTextOpacityValue;

  Animation<double> animationHeaderTwoOpacity;
  AnimationController animationHeaderTwoOpacityController;
  AnimationStatus animationHeaderTwoOpacityStatus;
  double animationHeaderTwoOpacityValue;

  Animation<double> animationTextTwoOpacity;
  AnimationController animationTextTwoOpacityController;
  AnimationStatus animationTextTwoOpacityStatus;
  double animationTextTwoOpacityValue;

  Animation<double> animationTextThreeOpacity;
  AnimationController animationTextThreeOpacityController;
  AnimationStatus animationTextThreeOpacityStatus;
  double animationTextThreeOpacityValue;



  @override
  void initState(){

    NotifyingPageViewState.showhomePageGestureDectors = false;
    super.initState();
//Animations
    //Animations

    /*wheel*/
    //MOVES
    //w2000
    animationw2000MoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationw2000Move = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationw2000MoveController, curve: universialCurve));
    animationw2000Move.addListener(() {
      setState(() {
        animationw2000MoveValue = animationw2000Move.value;
      });
    });
    animationw2000Move.addStatusListener((AnimationStatus state) {
      setState(() {
        animationw2000MoveStatus = animationw2000Move.status;
      });
    });

    animationAlwaysMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationAlwaysMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationAlwaysMoveController, curve: universialCurve));
    animationAlwaysMove.addListener(() {
      setState(() {
        animationAlwaysMoveValue = animationAlwaysMove.value;
      });
    });
    animationAlwaysMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationAlwaysMoveStatus = animationAlwaysMove.status;
      });
    });

    animationC1MoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationC1Move = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationC1MoveController, curve: universialCurve));
    animationC1Move.addListener(() {
      setState(() {
        animationC1MoveValue = animationC1Move.value;
      });
    });
    animationC1Move.addStatusListener((AnimationStatus state) {
      setState(() {
        animationC1MoveStatus = animationC1Move.status;
      });
    });

    animationC2MoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationC2Move = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationC2MoveController, curve: universialCurve));
    animationC2Move.addListener(() {
      setState(() {
        animationC2MoveValue = animationC2Move.value;
      });
    });
    animationC2Move.addStatusListener((AnimationStatus state) {
      setState(() {
        animationC2MoveStatus = animationC2Move.status;
      });
    });

    animationC3MoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationC3Move = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationC3MoveController, curve: universialCurve));
    animationC3Move.addListener(() {
      setState(() {
        animationC3MoveValue = animationC3Move.value;
      });
    });
    animationC3Move.addStatusListener((AnimationStatus state) {
      setState(() {
        animationC3MoveStatus = animationC3Move.status;
      });
    });

    animationC4MoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationC4Move = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationC4MoveController, curve: universialCurve));
    animationC4Move.addListener(() {
      setState(() {
        animationC4MoveValue = animationC4Move.value;
      });
    });
    animationC4Move.addStatusListener((AnimationStatus state) {
      setState(() {
        animationC4MoveStatus = animationC4Move.status;
      });
    });

    animationC5MoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationC5Move = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationC5MoveController, curve: universialCurve));
    animationC5Move.addListener(() {
      setState(() {
        animationC5MoveValue = animationC5Move.value;
      });
    });
    animationC5Move.addStatusListener((AnimationStatus state) {
      setState(() {
        animationC5MoveStatus = animationC5Move.status;
      });
    });

    animationC51MoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationC51Move = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationC51MoveController, curve: universialCurve));
    animationC51Move.addListener(() {
      setState(() {
        animationC51MoveValue = animationC51Move.value;
      });
    });
    animationC51Move.addStatusListener((AnimationStatus state) {
      setState(() {
        animationC51MoveStatus = animationC51Move.status;
      });
    });

    animationC52MoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationC52Move = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationC52MoveController, curve: universialCurve));
    animationC52Move.addListener(() {
      setState(() {
        animationC52MoveValue = animationC52Move.value;
      });
    });
    animationC52Move.addStatusListener((AnimationStatus state) {
      setState(() {
        animationC52MoveStatus = animationC52Move.status;
      });
    });

    animationC53MoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationC53Move = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationC53MoveController, curve: universialCurve));
    animationC53Move.addListener(() {
      setState(() {
        animationC53MoveValue = animationC53Move.value;
      });
    });
    animationC53Move.addStatusListener((AnimationStatus state) {
      setState(() {
        animationC53MoveStatus = animationC53Move.status;
      });
    });

    animationC54MoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationC54Move = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationC54MoveController, curve: universialCurve));
    animationC54Move.addListener(() {
      setState(() {
        animationC54MoveValue = animationC54Move.value;
      });
    });
    animationC54Move.addStatusListener((AnimationStatus state) {
      setState(() {
        animationC54MoveStatus = animationC54Move.status;
      });
    });

    animationC54MoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationC54Move = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationC54MoveController, curve: universialCurve));
    animationC54Move.addListener(() {
      setState(() {
        animationC54MoveValue = animationC54Move.value;
      });
    });
    animationC54Move.addStatusListener((AnimationStatus state) {
      setState(() {
        animationC54MoveStatus = animationC54Move.status;
      });
    });

    animationKitchenMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationKitchenMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationKitchenMoveController, curve: universialCurve));
    animationKitchenMove.addListener(() {
      setState(() {
        animationKitchenMoveValue = animationKitchenMove.value;
      });
    });
    animationKitchenMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationKitchenMoveStatus = animationKitchenMove.status;
      });
    });


    animationOtherMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationOtherMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationOtherMoveController, curve: universialCurve));
    animationOtherMove.addListener(() {
      setState(() {
        animationOtherMoveValue = animationOtherMove.value;
      });
    });
    animationOtherMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationOtherMoveStatus = animationOtherMove.status;
      });
    });


    animationShadowMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationShadowMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationShadowMoveController, curve: universialCurve));
    animationShadowMove.addListener(() {
      setState(() {
        animationShadowMoveValue = animationShadowMove.value;
      });
    });
    animationShadowMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationShadowMoveStatus = animationShadowMove.status;
      });
    });

    animationHomeMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationHomeMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationHomeMoveController, curve: universialCurve));
    animationHomeMove.addListener(() {
      setState(() {
        animationHomeMoveValue = animationHomeMove.value;
      });
    });
    animationHomeMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationHomeMoveStatus = animationHomeMove.status;
      });
    });

    animationRedMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationRedMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationRedMoveController, curve: universialCurve));
    animationRedMove.addListener(() {
      setState(() {
        animationRedMoveValue = animationRedMove.value;
      });
    });
    animationRedMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationRedMoveStatus = animationRedMove.status;
      });
    });

    animationHeatMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationHeatMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationHeatMoveController, curve: universialCurve));
    animationHeatMove.addListener(() {
      setState(() {
        animationHeatMoveValue = animationHeatMove.value;
      });
    });
    animationHeatMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationHeatMoveStatus = animationHeatMove.status;
      });
    });

    animationCenterMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationCenterMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationCenterMoveController, curve: universialCurve));
    animationCenterMove.addListener(() {
      setState(() {
        animationCenterMoveValue = animationCenterMove.value;
      });
    });
    animationCenterMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationCenterMoveStatus = animationCenterMove.status;
      });
    });


    //OpacityS

    //w2000
    animationw2000OpacityController = AnimationController(duration: Duration(milliseconds: 1800), vsync: this);
    animationw2000Opacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationw2000OpacityController, curve: universialCurve));
    animationw2000Opacity.addListener(() {
      setState(() {
        animationw2000OpacityValue = animationw2000Opacity.value;
      });
    });
    animationw2000Opacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationw2000OpacityStatus = animationw2000Opacity.status;
      });
    });

    animationAlwaysOpacityController = AnimationController(duration: Duration(milliseconds: 1800), vsync: this);
    animationAlwaysOpacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationAlwaysOpacityController, curve: universialCurve));
    animationAlwaysOpacity.addListener(() {
      setState(() {
        animationAlwaysOpacityValue = animationAlwaysOpacity.value;
      });
    });
    animationAlwaysOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationAlwaysOpacityStatus = animationAlwaysOpacity.status;
      });
    });

    animationC1OpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationC1Opacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationC1OpacityController, curve: universialCurve));
    animationC1Opacity.addListener(() {
      setState(() {
        animationC1OpacityValue = animationC1Opacity.value;
      });
    });
    animationC1Opacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationC1OpacityStatus = animationC1Opacity.status;
      });
    });

    animationC2OpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationC2Opacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationC2OpacityController, curve: universialCurve));
    animationC2Opacity.addListener(() {
      setState(() {
        animationC2OpacityValue = animationC2Opacity.value;
      });
    });
    animationC2Opacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationC2OpacityStatus = animationC2Opacity.status;
      });
    });

    animationC3OpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationC3Opacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationC3OpacityController, curve: universialCurve));
    animationC3Opacity.addListener(() {
      setState(() {
        animationC3OpacityValue = animationC3Opacity.value;
      });
    });
    animationC3Opacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationC3OpacityStatus = animationC3Opacity.status;
      });
    });

    animationC4OpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationC4Opacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationC4OpacityController, curve: universialCurve));
    animationC4Opacity.addListener(() {
      setState(() {
        animationC4OpacityValue = animationC4Opacity.value;
      });
    });
    animationC4Opacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationC4OpacityStatus = animationC4Opacity.status;
      });
    });

    animationC5OpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationC5Opacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationC5OpacityController, curve: universialCurve));
    animationC5Opacity.addListener(() {
      setState(() {
        animationC5OpacityValue = animationC5Opacity.value;
      });
    });
    animationC5Opacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationC5OpacityStatus = animationC5Opacity.status;
      });
    });

    animationC51OpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationC51Opacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationC51OpacityController, curve: universialCurve));
    animationC51Opacity.addListener(() {
      setState(() {
        animationC51OpacityValue = animationC51Opacity.value;
      });
    });
    animationC51Opacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationC51OpacityStatus = animationC51Opacity.status;
      });
    });

    animationC52OpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationC52Opacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationC52OpacityController, curve: universialCurve));
    animationC52Opacity.addListener(() {
      setState(() {
        animationC52OpacityValue = animationC52Opacity.value;
      });
    });
    animationC52Opacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationC52OpacityStatus = animationC52Opacity.status;
      });
    });

    animationC53OpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationC53Opacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationC53OpacityController, curve: universialCurve));
    animationC53Opacity.addListener(() {
      setState(() {
        animationC53OpacityValue = animationC53Opacity.value;
      });
    });
    animationC53Opacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationC53OpacityStatus = animationC53Opacity.status;
      });
    });

    animationC54OpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationC54Opacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationC54OpacityController, curve: universialCurve));
    animationC54Opacity.addListener(() {
      setState(() {
        animationC54OpacityValue = animationC54Opacity.value;
      });
    });
    animationC54Opacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationC54OpacityStatus = animationC54Opacity.status;
      });
    });

    animationC55OpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationC55Opacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationC55OpacityController, curve: universialCurve));
    animationC55Opacity.addListener(() {
      setState(() {
        animationC55OpacityValue = animationC55Opacity.value;
      });
    });
    animationC55Opacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationC55OpacityStatus = animationC55Opacity.status;
      });
    });

    animationKitchenOpacityController = AnimationController(duration: Duration(milliseconds: 1800), vsync: this);
    animationKitchenOpacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationKitchenOpacityController, curve: universialCurve));
    animationKitchenOpacity.addListener(() {
      setState(() {
        animationKitchenOpacityValue = animationKitchenOpacity.value;
      });
    });
    animationKitchenOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationKitchenOpacityStatus = animationKitchenOpacity.status;
      });
    });


    animationOtherOpacityController = AnimationController(duration: Duration(milliseconds: 1800), vsync: this);
    animationOtherOpacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationOtherOpacityController, curve: universialCurve));
    animationOtherOpacity.addListener(() {
      setState(() {
        animationOtherOpacityValue = animationOtherOpacity.value;
      });
    });
    animationOtherOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationOtherOpacityStatus = animationOtherOpacity.status;
      });
    });


    animationShadowOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationShadowOpacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationShadowOpacityController, curve: universialCurve));
    animationShadowOpacity.addListener(() {
      setState(() {
        animationShadowOpacityValue = animationShadowOpacity.value;
      });
    });
    animationShadowOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationShadowOpacityStatus = animationShadowOpacity.status;
      });
    });
    
    
    animationHomeOpacityController = AnimationController(duration: Duration(milliseconds: 1800), vsync: this);
    animationHomeOpacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationHomeOpacityController, curve: universialCurve));
    animationHomeOpacity.addListener(() {
      setState(() {
        animationHomeOpacityValue = animationHomeOpacity.value;
      });
    });
    animationHomeOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationHomeOpacityStatus = animationHomeOpacity.status;
      });
    });

    animationRedOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationRedOpacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationRedOpacityController, curve: universialCurve));
    animationRedOpacity.addListener(() {
      setState(() {
        animationRedOpacityValue = animationRedOpacity.value;
      });
    });
    animationRedOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationRedOpacityStatus = animationRedOpacity.status;
      });
    });

    animationHeatOpacityController = AnimationController(duration: Duration(milliseconds: 1800), vsync: this);
    animationHeatOpacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationHeatOpacityController, curve: universialCurve));
    animationHeatOpacity.addListener(() {
      setState(() {
        animationHeatOpacityValue = animationHeatOpacity.value;
      });
    });
    animationHeatOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationHeatOpacityStatus = animationHeatOpacity.status;
      });
    });


    animationCenterOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationCenterOpacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationCenterOpacityController, curve: universialCurve));
    animationCenterOpacity.addListener(() {
      setState(() {
        animationCenterOpacityValue = animationCenterOpacity.value;
      });
    });
    animationCenterOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationCenterOpacityStatus = animationCenterOpacity.status;
      });
    });


    /*others*/
    //Move
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
    animationBackgroundOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationBackgroundOpacity = Tween<double>(begin: 0, end: 100).animate(new CurvedAnimation(parent: animationBackgroundOpacityController, curve: universialCurve));
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



    //NUMBER TICK
    animationNumberTickController = AnimationController(duration: Duration(milliseconds: 4500), vsync: this);
    animationNumberTick = IntTween(begin: 0, end: 158).animate(new CurvedAnimation(parent: animationNumberTickController, curve: Curves.fastLinearToSlowEaseIn));
    animationNumberTick.addListener(() {
      setState(() {
        animationNumberTickValue = animationNumberTick.value;
      });
    });
    animationNumberTick.addStatusListener((AnimationStatus state) {
      setState(() {
        animationNumberTickStatus = animationNumberTick.status;
      });
    });


    //OThers
    //Move
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

    animationTextMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationTextMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationTextMoveController, curve: universialCurve));
    animationTextMove.addListener(() {
      setState(() {
        animationTextMoveValue = animationTextMove.value;
      });
    });
    animationTextMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationTextMoveStatus = animationTextMove.status;
      });
    });

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

    //Op
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

    animationTextOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationTextOpacity = Tween<double>(begin: 0, end: 1).animate(new CurvedAnimation(parent: animationTextOpacityController, curve: universialCurve));
    animationTextOpacity.addListener(() {
      setState(() {
        animationTextOpacityValue = animationTextOpacity.value;
      });
    });
    animationTextOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationTextOpacityStatus = animationTextOpacity.status;
      });
    });

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




    //Init actions
    widget._pageController.addListener(loadWidgets);
  }


  @override
  void dispose() {
    animationw2000MoveController.dispose();
    animationAlwaysMoveController.dispose();
    animationC1MoveController.dispose();
    animationC2MoveController.dispose();
    animationC3MoveController.dispose();
    animationC4MoveController.dispose();
    animationC5MoveController.dispose();
    animationC51MoveController.dispose();
    animationC52MoveController.dispose();
    animationC53MoveController.dispose();
    animationC54MoveController.dispose();
    animationC55MoveController.dispose();
    animationKitchenMoveController.dispose();
    animationOtherMoveController.dispose();
    animationShadowMoveController.dispose();
    animationHomeMoveController.dispose();
    animationHeatMoveController.dispose();
    animationRedMoveController.dispose();
    animationCenterMoveController.dispose();
    animationBackgroundMoveController.dispose();

    animationw2000OpacityController.dispose();
    animationAlwaysOpacityController.dispose();
    animationC1OpacityController.dispose();
    animationC2OpacityController.dispose();
    animationC3OpacityController.dispose();
    animationC4OpacityController.dispose();
    animationC5OpacityController.dispose();
    animationC51OpacityController.dispose();
    animationC52OpacityController.dispose();
    animationC53OpacityController.dispose();
    animationC54OpacityController.dispose();
    animationC55OpacityController.dispose();
    animationKitchenOpacityController.dispose();
    animationOtherOpacityController.dispose();
    animationShadowOpacityController.dispose();
    animationHomeOpacityController.dispose();
    animationHeatOpacityController.dispose();
    animationRedOpacityController.dispose();
    animationCenterOpacityController.dispose();
    animationBackgroundOpacityController.dispose();
    
    animationNumberTickController.dispose();

    //others
    animationHeaderMoveController.dispose();
    animationHeaderTwoMoveController.dispose();
    animationTextMoveController.dispose();
    animationTextMoveController.dispose();
    animationTextThreeMoveController.dispose();

    animationHeaderOpacityController.dispose();
    animationHeaderTwoOpacityController.dispose();
    animationTextOpacityController.dispose();
    animationTextOpacityController.dispose();
    animationTextThreeOpacityController.dispose();
    
    
    
    super.dispose();
  }

  @override
  void setState(fn) {
    if(mounted){
      super.setState(fn);
    }
  }


  void viewFourLanded(){
    gtm.pushEvent('viewFour-landed');
  }


  @override
  Widget build(BuildContext context) {
    utilities.update(context);
    utilities.setCurrentPage(PageType.FOUR);
    viewFourLanded();

    //actual content size
    return Scaffold(
        backgroundColor: Color(0xffFFFFFF),

        body:

        Stack(
            children: <Widget> [

              Positioned(
                  right:((utilities.WIDTH-1600*utilities.width_rate)/2+945)*utilities.width_rate,
                  child:
                  Container(
                    child: ImageLoaderState.bigVPngLOAD,
                      width: 1200*utilities.width_rate,
                      height: 1130*utilities.height_rate,
                ),
              ),
              Container(alignment: Alignment.topCenter,
                  child:
                  Container(
                      width: 1600*utilities.width_rate,
                      alignment: Alignment.center,
                      child:
                      Stack(
                        children: <Widget>[
                          Positioned(
                            left:646*utilities.width_rate,
                            top: 300*utilities.height_rate,
                            child:

                            Container(
                              width: 880*utilities.width_rate,
                              height: 880/1.37*utilities.height_rate,
                              child: Stack(
                                  children: <Widget>[
                                    Opacity(
                                      opacity: animationShadowOpacity.value,
                                      child:
                                      ImageLoaderState.shadowPngLOAD,
                                    ),
                                    Opacity(
                                      opacity: animationC1Opacity.value,
                                      child:
                                      ImageLoaderState.c1PngLOAD,
                                    ),
                                    Opacity(
                                      opacity: animationC2Opacity.value,
                                      child:
                                      ImageLoaderState.c2PngLOAD,
                                    ),
                                    Opacity(
                                      opacity: animationC3Opacity.value,
                                      child:
                                      ImageLoaderState.c3PngLOAD,
                                    ),
                                    Opacity(
                                      opacity: animationC4Opacity.value,
                                      child:
                                      ImageLoaderState.c4PngLOAD,
                                    ),
                                    Opacity(
                                      opacity: animationC5Opacity.value,
                                      child:
                                      ImageLoaderState.c5PngLOAD,
                                    ),
                                    Opacity(
                                      opacity: animationC51Opacity.value,
                                      child:
                                      ImageLoaderState.c51PngLOAD,
                                    ),
                                    Opacity(
                                      opacity: animationC52Opacity.value,
                                      child:
                                      ImageLoaderState.c52PngLOAD,
                                    ),
                                    Opacity(
                                      opacity: animationC53Opacity.value,
                                      child:
                                      ImageLoaderState. c53PngLOAD,
                                    ),
                                    Opacity(
                                      opacity: animationC54Opacity.value,
                                      child:
                                      ImageLoaderState.c54PngLOAD,
                                    ),
                                    Opacity(
                                      opacity: animationC55Opacity.value,
                                      child:
                                      ImageLoaderState.c55PngLOAD,
                                    ),
                                    Positioned(
                                      left: 880*utilities.width_rate*0.323,
                                      top: 880/1.37*utilities.height_rate*0.63 + widgetMoveDelta - animationAlwaysMove.value,
                                      child: Container(
                                        width: 164*utilities.width_rate,
                                        height: 48*utilities.height_rate,
                                        child: Opacity(
                                          opacity: animationAlwaysOpacity.value,
                                          child:
                                          Stack(
                                            alignment: Alignment.center,
                                            children: <Widget>[
                                              ImageLoaderState.alwaysPngLOAD,
                                              Positioned(
                                                right: 20*utilities.width_rate,
                                                child: Container(
                                                  width: 164*utilities.width_rate,
                                                  height: 48*utilities.height_rate,
                                                  alignment: Alignment.centerRight,
                                                  child: Text(
                                                    "Always On",
                                                    style: TextStyle(
                                                      height: 2.11,
                                                      color: Color(0xff666F80),
                                                      fontSize: 17*utilities.width_rate,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "MontserratSemibold",
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 880*utilities.width_rate*0,
                                      top: 880/1.37*utilities.height_rate*0.487 + widgetMoveDelta - animationHomeMove.value,
                                      child: Container(
                                        width: 284*utilities.width_rate,
                                        height: 48*utilities.height_rate,
                                        child: Opacity(
                                          opacity: animationHomeOpacity.value,
                                          child:
                                          Stack(
                                            alignment: Alignment.center,
                                            children: <Widget>[
                                              ImageLoaderState.homePngLOAD,
                                              Positioned(
                                                right: 23*utilities.width_rate,
                                                child: Container(
                                                  width: 284*utilities.width_rate,
                                                  height: 48*utilities.height_rate,
                                                  alignment: Alignment.centerRight,
                                                  child: Text(
                                                    "Home & Entertainment",
                                                    style: TextStyle(
                                                      height: 2.11,
                                                      color: Color(0xff666F80),
                                                      fontSize: 17*utilities.width_rate,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "MontserratSemibold",
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 880*utilities.width_rate*0.138,
                                      top: 880/1.37*utilities.height_rate*0.160 + widgetMoveDelta - animationKitchenMove.value,
                                      child: Container(
                                        width: 138*utilities.width_rate,
                                        height: 48*utilities.height_rate,
                                        child: Opacity(
                                          opacity: animationKitchenOpacity.value,
                                          child:
                                          Stack(
                                            alignment: Alignment.center,
                                            children: <Widget>[
                                              ImageLoaderState.kitchenPngLOAD,
                                              Positioned(
                                                right: 18*utilities.width_rate,
                                                child: Container(
                                                  alignment: Alignment.centerRight,
                                                  width: 138*utilities.width_rate,
                                                  height: 48*utilities.height_rate,
                                                  child: Text(
                                                    "Kitchen",
                                                    style: TextStyle(
                                                      height: 2.11,
                                                      color: Color(0xff666F80),
                                                      fontSize: 17*utilities.width_rate,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "MontserratSemibold",
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 880*utilities.width_rate*0.388,
                                      top: 880/1.37*utilities.height_rate*0 + widgetMoveDelta - animationOtherMove.value,
                                      child: Container(
                                        width: 126*utilities.width_rate,
                                        height: 48*utilities.height_rate,
                                        child: Opacity(
                                          opacity: animationOtherOpacity.value,
                                          child:
                                          Stack(
                                            alignment: Alignment.center,
                                            children: <Widget>[
                                              ImageLoaderState.otherPngLOAD,
                                              Positioned(
                                                right: 23*utilities.width_rate,
                                                child: Container(
                                                  alignment: Alignment.centerRight,
                                                  width: 126*utilities.width_rate,
                                                  height: 48*utilities.height_rate,
                                                  child: Text(
                                                    "Other",
                                                    style: TextStyle(
                                                      height: 2.11,
                                                      color: Color(0xff666F80),
                                                      fontSize: 17*utilities.width_rate,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "MontserratSemibold",
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 880*utilities.width_rate*0.587,
                                      top: 880/1.37*utilities.height_rate*0.342 + widgetMoveDelta - animationHeatMove.value,
                                      child: Container(
                                        width: 261*utilities.width_rate,
                                        height: 48*utilities.height_rate,
                                        child: Opacity(
                                          opacity: animationHeatOpacity.value,
                                          child:
                                          Stack(
                                            alignment: Alignment.center,
                                            children: <Widget>[
                                              ImageLoaderState.heatPngLOAD,
                                              Positioned(
                                                right: 38*utilities.width_rate,
                                                child: Container(
                                                    width: 261*utilities.width_rate,
                                                    height: 48*utilities.height_rate,
                                                    alignment: Alignment.centerRight,
                                                    child: Text(
                                                      "Heating & Cooling",
                                                      style: TextStyle(
                                                        height: 1.9,
                                                        color: Color(0xffED7828),
                                                        fontSize: 17*utilities.width_rate,
                                                        fontWeight: FontWeight.w500,
                                                        fontFamily: "MontserratSemibold",
                                                      ),
                                                    ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 880*utilities.width_rate*0.570,
                                      top: 880/1.37*utilities.height_rate*0.500 + widgetMoveDelta - animationw2000Move.value,
                                      child: Container(
                                        width: 266*utilities.width_rate,
                                        height: 48*utilities.height_rate,
                                        child: Opacity(
                                          opacity: animationw2000Opacity.value,
                                          child:
                                          Stack(
                                            alignment: Alignment.center,
                                            children: <Widget>[
                                              Container(
                                                decoration: new BoxDecoration(
                                                boxShadow: [
                                                BoxShadow(
                                                color: Color.fromRGBO(0, 0, 0, 0.04),
                                                blurRadius: 34, // has the effect of softening the shadow
                                                spreadRadius: 3.0, // has the effect of extending the shadow
                                                offset: Offset(8, // horizontal, move right 0
                                                  8, // vertical, move down 32
                                                      ),
                                                    )
                                                  ]
                                                ),
                                                child:
                                                ImageLoaderState.w2000PngLOAD,
                                              ),
                                              Positioned(
                                                right: 22*utilities.width_rate,
                                                child: Container(
                                                  alignment: Alignment.centerRight,
                                                  width: 266*utilities.width_rate,
                                                  height: 48*utilities.height_rate,
                                                  child: Text(
                                                    "2000W Oil Heater",
                                                    style: TextStyle(
                                                      height: 2.37,
                                                      color: Color(0xff6E94C1C),
                                                      fontSize: 15*utilities.width_rate,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "MontserratSemibold",
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 880*utilities.width_rate*0.527,
                                      top: 880/1.37*utilities.height_rate*0.430 + widgetMoveDelta - animationRedMove.value,
                                      child: Container(
                                        width: 150*utilities.width_rate,
                                        height: 150*utilities.height_rate,
                                        child: Opacity(
                                          opacity: animationRedOpacity.value,
                                          child:
                                          Stack(
                                            alignment: Alignment.center,
                                            children: <Widget>[
                                              Container(
                                                child:
                                          ImageLoaderState.redPngLOAD,
                                              ),
                                              Container(
                                                child: Text(
                                                  "\$45",
                                                  style: TextStyle(
                                                    color: Color(0xffFFFFFF),
                                                    fontSize: 23*utilities.width_rate,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "MontserratSemibold",
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left:880*utilities.width_rate*0.367,
                                      top:880/1.37*utilities.height_rate*0.280 + widgetMoveDelta - animationCenterMove.value,
                                      child:
                                        Opacity(
                                          opacity: animationCenterOpacity.value,
                                          child: Container(
                                            alignment:Alignment.topLeft,
                                            width: 110*utilities.width_rate,
                                            height: 110*utilities.width_rate,
                                            child:
                                                  Stack(
                                                    children: <Widget>[
                                                      Positioned(
                                                        child:
                                                        RichText(
                                                          textAlign: TextAlign.center,
                                                          text: TextSpan(
                                                            style: TextStyle(height: 1.88),
                                                              children: [
                                                                TextSpan(
                                                                    text: "\$",
                                                                    style: TextStyle(
                                                                      height: 2.3,
                                                                      fontFamily: "MontserratBold",
                                                                      color: Color(0xff666F80),
                                                                      fontSize: 27*utilities.width_rate,
                                                                    )
                                                                ),
                                                                TextSpan(
                                                                    text: animationNumberTick.value.toString(),
                                                                    style: TextStyle(
                                                                      fontFamily: "MontserratBold",
                                                                      color: Color(0xff666F80),
                                                                      fontSize: 49*utilities.width_rate,
                                                                    )
                                                                ),
                                                              ]
                                                          ),

                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 8.5*utilities.width_rate,
                                                        top: 38*utilities.height_rate,
                                                        child:
                                                        Text(
                                                          "\nthis month",
                                                          style: TextStyle(
                                                            height: 2.2,
                                                            fontFamily: "MontserratRegular",
                                                            color: Color(0xff666F80),
                                                            fontSize: 16*utilities.width_rate,
                                                          ),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ),
                                        )
                                            )
                                  ]
                                        )
                                    )
                                  ),
                          Positioned(
                              left: 160*utilities.width_rate,
                              top: 320*utilities.height_rate + widgetMoveDelta - animationHeaderMove.value  ,
                              child:
                              Opacity(
                                opacity: animationHeaderOpacity.value,
                                child: Container(
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(height: 1.1),
                                        children: [
                                          TextSpan(
                                              text:
                                              "Paying for power?\n",
                                              style: TextStyle(
                                                fontFamily: "KarbonSemibold",
                                                fontWeight: FontWeight.w800,
                                                fontSize: 42*utilities.width_rate,
                                                height: 1.1,
                                                color: Color(0xff78A11B),
                                              )
                                          ),
                                          TextSpan(
                                              text:
                                              "It would make sense\nto know what uses it",
                                              style: TextStyle(
                                                fontFamily: "KarbonSemibold",
                                                fontWeight: FontWeight.w800,
                                                fontSize: 42*utilities.width_rate,
                                                height: 1.1,
                                                color: Color(0xff282C3B),
                                              )
                                          ),
                                        ]
                                    ),
                                  ),
                                ),
                              )
                          ),
                          Positioned(
                              left: 160*utilities.width_rate,
                              top: 500*utilities.height_rate + widgetMoveDelta - animationTextMove.value ,
                              child:
                              Opacity(
                                opacity: animationTextOpacity.value,
                                child: Container(
                                  child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(height: 1.88,),
                                        children: [
                                          TextSpan(
                                              text:
                                              "Once installed, our ",
                                              style: TextStyle(
                                                fontFamily: "MontserratRegular",
                                                fontSize: 17*utilities.width_rate,
                                                height: 1.88,
                                                color: Color(0xff666F80),
                                              )
                                          ),
                                          TextSpan(
                                              text:
                                              "GreenE meter ",
                                              style: TextStyle(
                                                fontFamily: "MontserratSemibold",
                                                fontSize: 17*utilities.width_rate,
                                                height: 1.88,
                                                color: Color(0xff666F80),
                                              )
                                          ),
                                          TextSpan(
                                              text:
                                              "gives\nyou real time information and smart\nnotifications for your plugged-in devices.",
                                              style: TextStyle(
                                                fontFamily: "MontserratRegular",
                                                fontSize: 17*utilities.width_rate,
                                                height: 1.88,
                                                color: Color(0xff666F80),
                                              )
                                          ),
                                        ]
                                    ),
                                  ),
                                ),
                              )
                          ),

                          Positioned(
                              left: 160*utilities.width_rate,
                              top: 620*utilities.height_rate + widgetMoveDelta - animationTextTwoMove.value ,
                              child:
                              Opacity(
                                opacity: animationTextTwoOpacity.value,
                                child: Container(
                                  child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(height: 1.88,),
                                        children: [
                                          TextSpan(
                                              text:
                                              "Unlike your current energy retailer,\n",
                                              style: TextStyle(
                                                fontFamily: "MontserratRegular",
                                                fontSize: 17*utilities.width_rate,
                                                height: 1.88,
                                                color: Color(0xff666F80),
                                              )
                                          ),
                                          TextSpan(
                                              text:
                                              "We're actually trying to lower your bills.\n",
                                              style: TextStyle(
                                                fontFamily: "MontserratSemibold",
                                                fontSize: 17*utilities.width_rate,
                                                height: 1.88,
                                                color: Color(0xff666F80),
                                              )
                                          ),
                                          TextSpan(
                                              text:
                                              "We don't profit on your usage.",
                                              style: TextStyle(
                                                fontFamily: "MontserratRegular",
                                                fontSize: 17*utilities.width_rate,
                                                height: 1.88,
                                                color: Color(0xff666F80),
                                              )
                                          ),
                                        ]
                                    ),
                                  ),
                                ),
                              )
                          ),

                                  ]
                              ),
                            )
                          )

                          //the wheel, Ratio:
                          //width:height = 1.3700
                              ],
                            ),
                          );
                          //header



  }

  void loadWidgets(){
    if (widget._pageController.page == 3) {
      Timer(Duration(milliseconds: 100), c1FadeIn);
      Timer(Duration(milliseconds: 300), c2FadeIn);
      Timer(Duration(milliseconds: 500), c3FadeIn);
      Timer(Duration(milliseconds: 700), c4FadeIn);
      Timer(Duration(milliseconds: 900), c5FadeIn);
      Timer(Duration(milliseconds: 700), c51FadeIn);
      Timer(Duration(milliseconds: 700+150), c52FadeIn);
      Timer(Duration(milliseconds: 700+150+200), c53FadeIn);
      Timer(Duration(milliseconds: 700+150+200+250), c54FadeIn);
      Timer(Duration(milliseconds: 700+150+200+250+300), c55FadeIn);
      Timer(Duration(milliseconds: 400), alwaysFadeIn);
      Timer(Duration(milliseconds: 400+200), homeFadeIn);
      Timer(Duration(milliseconds: 400+200+200), kitchenFadeIn);
      Timer(Duration(milliseconds: 400+200+200), otherFadeIn);
      Timer(Duration(milliseconds: 400+200+200+200), heatFadeIn);
      Timer(Duration(milliseconds: 400+200+200+200+200), w2000FadeIn);
      Timer(Duration(milliseconds: 700+150+200+250+350), redFadeIn);
      Timer(Duration(milliseconds: 700+150+200+250+300), shadowFadeIn);
      Timer(Duration(milliseconds: 750), centerFadeIn);
      Timer(Duration(milliseconds: 800), numberTick);

      Timer(Duration(milliseconds: 100), headerFadeIn);
      Timer(Duration(milliseconds: 100+150), textFadeIn);
      Timer(Duration(milliseconds: 100+150+150), textTwoFadeIn);

      Timer(Duration(milliseconds: (700+150+200+250+300+1500*0.7).round()), NotifyingPageViewState.enableScrollDown);

    }
  }

  //sub controller funcs

  //wheel
  void c1FadeIn(){
    animationC1OpacityController.forward();
  }

  void c2FadeIn(){
    animationC2OpacityController.forward();
  }


  void c3FadeIn(){
    animationC3OpacityController.forward();
  }


  void c4FadeIn(){
    animationC4OpacityController.forward();
  }


  void c5FadeIn(){
    animationC5OpacityController.forward();
  }

  void c51FadeIn(){
    animationC51OpacityController.forward();
  }

  void c52FadeIn(){
    animationC52OpacityController.forward();
  }

  void c53FadeIn(){
    animationC53OpacityController.forward();
  }

  void c54FadeIn(){
    animationC54OpacityController.forward();
  }

  void c55FadeIn(){
    animationC55OpacityController.forward();
  }

  void alwaysFadeIn(){
    animationAlwaysOpacityController.forward();
    animationAlwaysMoveController.forward();
  }

  void homeFadeIn(){
    animationHomeOpacityController.forward();
    animationHeatMoveController.forward();
  }

  void kitchenFadeIn(){
    animationKitchenOpacityController.forward();
    animationKitchenMoveController.forward();
  }
  void otherFadeIn(){
    animationOtherOpacityController.forward();
    animationOtherMoveController.forward();
  }
  void heatFadeIn(){
    animationHeatOpacityController.forward();
    animationHeatMoveController.forward();
  }
  void w2000FadeIn(){
    animationw2000OpacityController.forward();
    animationw2000MoveController.forward();
  }
  void redFadeIn(){
    animationRedOpacityController.forward();
    animationRedMoveController.forward();
  }
  void shadowFadeIn(){
    animationShadowMoveController.forward();
    animationShadowOpacityController.forward();
  }
  void centerFadeIn(){
    animationCenterMoveController.forward();
    animationCenterOpacityController.forward();
  }

  void numberTick(){
    animationNumberTickController.forward();
  }

  void backgroundFadeIn(){
    animationBackgroundMoveController.forward();
    animationBackgroundOpacityController.forward();
  }


  //Others
  void headerFadeIn(){
    animationHeaderMoveController.forward();
    animationHeaderOpacityController.forward();
  }


  void headerTwoFadeIn(){
    animationHeaderTwoMoveController.forward();
    animationHeaderTwoOpacityController.forward();
  }


  void textFadeIn(){
    animationTextMoveController.forward();
    animationTextOpacityController.forward();
  }

  void textTwoFadeIn(){
    animationTextTwoMoveController.forward();
    animationTextTwoOpacityController.forward();
  }


  void textThreeFadeIn(){
    animationTextThreeMoveController.forward();
    animationTextThreeOpacityController.forward();
  }


}