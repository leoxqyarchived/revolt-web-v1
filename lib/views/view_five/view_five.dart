import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import '../../materials/materials.dart';
import '../../widgets/homePageGestureDetectors.dart';
import '../../main.dart';
import '../../materials/utilities.dart';
import '../../extensions/hover.dart';
import '../../widgets/AppNavBar.dart';
import '../../materials/imageLoader.dart';

import 'package:google_tag_manager/google_tag_manager.dart' as gtm;

class ViewFive extends StatefulWidget {
  Utilities utilities;
  PageController _pageController;
  ViewFive(Utilities utilities, PageController _pageController) {
    this.utilities = utilities;
    this._pageController = _pageController;
  }
  @override
  State<StatefulWidget> createState() => _ViewFiveState(utilities);
}

class _ViewFiveState extends State<ViewFive> with TickerProviderStateMixin  {
  Utilities utilities;
  _ViewFiveState(Utilities utilities) {
    this.utilities = utilities;
  }

  //variables
  static final int universialAnimationDuration = 1500;
  static final double widgetMoveDelta = 15;
  static final double widgetOpacityDelta = 1;
  static final Curve universialCurve = Curves.easeInOutQuart;

  bool facebookEntered = false;
  bool twitterEntered = false;
  bool linkedInEntered = false;
  bool instaEntered = false;

  //variables
  String facebookIconAsset;
  String twitterIconAsset;
  String instaIconAsset;
  String linkedinIconAsset;

  //Wheel area
  // Header Move animation
  Animation<double> animationHeaderMove;
  AnimationController animationHeaderMoveController;
  AnimationStatus animationHeaderMoveStatus;
  double animationHeaderMoveValue;

  Animation<double> animationTextOneMove;
  AnimationController animationTextOneMoveController;
  AnimationStatus animationTextOneMoveStatus;
  double animationTextOneMoveValue;

  Animation<double> animationBubbleMove;
  AnimationController animationBubbleMoveController;
  AnimationStatus animationBubbleMoveStatus;
  double animationBubbleMoveValue;

  Animation<double> animationHeaderTwoMove;
  AnimationController animationHeaderTwoMoveController;
  AnimationStatus animationHeaderTwoMoveStatus;
  double animationHeaderTwoMoveValue;


  Animation<double> animationImageMove;
  AnimationController animationImageMoveController;
  AnimationStatus animationImageMoveStatus;
  double animationImageMoveValue;

  Animation<double> animationArrowMove;
  AnimationController animationArrowMoveController;
  AnimationStatus animationArrowMoveStatus;
  double animationArrowMoveValue;

  Animation<double> animationTextTwoMove;
  AnimationController animationTextTwoMoveController;
  AnimationStatus animationTextTwoMoveStatus;
  double animationTextTwoMoveValue;

  Animation<double> animationImageTwoMove;
  AnimationController animationImageTwoMoveController;
  AnimationStatus animationImageTwoMoveStatus;
  double animationImageTwoMoveValue;

  Animation<double> animationAppMove;
  AnimationController animationAppMoveController;
  AnimationStatus animationAppMoveStatus;
  double animationAppMoveValue;

  Animation<double> animationIphoneMove;
  AnimationController animationIphoneMoveController;
  AnimationStatus animationIphoneMoveStatus;
  double animationIphoneMoveValue;


  Animation<double> animationBarMove;
  AnimationController animationBarMoveController;
  AnimationStatus animationBarMoveStatus;
  double animationBarMoveValue;


  Animation<double> animationBarTextOneMove;
  AnimationController animationBarTextOneMoveController;
  AnimationStatus animationBarTextOneMoveStatus;
  double animationBarTextOneMoveValue;


  Animation<double> animationBarTextTwoMove;
  AnimationController animationBarTextTwoMoveController;
  AnimationStatus animationBarTextTwoMoveStatus;
  double animationBarTextTwoMoveValue;


  Animation<double> animationBarTextThreeMove;
  AnimationController animationBarTextThreeMoveController;
  AnimationStatus animationBarTextThreeMoveStatus;
  double animationBarTextThreeMoveValue;

  Animation<double> animationBarTextFourMove;
  AnimationController animationBarTextFourMoveController;
  AnimationStatus animationBarTextFourMoveStatus;
  double animationBarTextFourMoveValue;




  //////OPACITIES

  //Wheel area
  // Header Opacity animation
  Animation<double> animationHeaderOpacity;
  AnimationController animationHeaderOpacityController;
  AnimationStatus animationHeaderOpacityStatus;
  double animationHeaderOpacityValue;

  Animation<double> animationTextOneOpacity;
  AnimationController animationTextOneOpacityController;
  AnimationStatus animationTextOneOpacityStatus;
  double animationTextOneOpacityValue;

  Animation<double> animationBubbleOpacity;
  AnimationController animationBubbleOpacityController;
  AnimationStatus animationBubbleOpacityStatus;
  double animationBubbleOpacityValue;

  Animation<double> animationHeaderTwoOpacity;
  AnimationController animationHeaderTwoOpacityController;
  AnimationStatus animationHeaderTwoOpacityStatus;
  double animationHeaderTwoOpacityValue;


  Animation<double> animationImageOpacity;
  AnimationController animationImageOpacityController;
  AnimationStatus animationImageOpacityStatus;
  double animationImageOpacityValue;

  Animation<double> animationArrowOpacity;
  AnimationController animationArrowOpacityController;
  AnimationStatus animationArrowOpacityStatus;
  double animationArrowOpacityValue;

  Animation<double> animationTextTwoOpacity;
  AnimationController animationTextTwoOpacityController;
  AnimationStatus animationTextTwoOpacityStatus;
  double animationTextTwoOpacityValue;

  Animation<double> animationImageTwoOpacity;
  AnimationController animationImageTwoOpacityController;
  AnimationStatus animationImageTwoOpacityStatus;
  double animationImageTwoOpacityValue;

  Animation<double> animationAppOpacity;
  AnimationController animationAppOpacityController;
  AnimationStatus animationAppOpacityStatus;
  double animationAppOpacityValue;

  Animation<double> animationIphoneOpacity;
  AnimationController animationIphoneOpacityController;
  AnimationStatus animationIphoneOpacityStatus;
  double animationIphoneOpacityValue;


  Animation<double> animationBarOpacity;
  AnimationController animationBarOpacityController;
  AnimationStatus animationBarOpacityStatus;
  double animationBarOpacityValue;


  Animation<double> animationBarTextOneOpacity;
  AnimationController animationBarTextOneOpacityController;
  AnimationStatus animationBarTextOneOpacityStatus;
  double animationBarTextOneOpacityValue;


  Animation<double> animationBarTextTwoOpacity;
  AnimationController animationBarTextTwoOpacityController;
  AnimationStatus animationBarTextTwoOpacityStatus;
  double animationBarTextTwoOpacityValue;


  Animation<double> animationBarTextThreeOpacity;
  AnimationController animationBarTextThreeOpacityController;
  AnimationStatus animationBarTextThreeOpacityStatus;
  double animationBarTextThreeOpacityValue;

  Animation<double> animationBarTextFourOpacity;
  AnimationController animationBarTextFourOpacityController;
  AnimationStatus animationBarTextFourOpacityStatus;
  double animationBarTextFourOpacityValue;



  @override
  void initState(){

    NotifyingPageViewState.showhomePageGestureDectors = false;
    super.initState();

    facebookIconAsset = pg5FacebookPng;
    twitterIconAsset = pg5TwitterPng;
    instaIconAsset = pg5InstaPng;
    linkedinIconAsset = pg5LinkedInPng;

//Animations
    //Animations

    /*wheel*/
    //MoveS
    //Header
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

    animationBubbleMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationBubbleMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationBubbleMoveController, curve: universialCurve));
    animationBubbleMove.addListener(() {
      setState(() {
        animationBubbleMoveValue = animationBubbleMove.value;
      });
    });
    animationBubbleMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBubbleMoveStatus = animationBubbleMove.status;
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


    animationImageMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationImageMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationImageMoveController, curve: universialCurve));
    animationImageMove.addListener(() {
      setState(() {
        animationImageMoveValue = animationImageMove.value;
      });
    });
    animationImageMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationImageMoveStatus = animationImageMove.status;
      });
    });


    animationArrowMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationArrowMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationArrowMoveController, curve: universialCurve));
    animationArrowMove.addListener(() {
      setState(() {
        animationArrowMoveValue = animationArrowMove.value;
      });
    });
    animationArrowMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationArrowMoveStatus = animationArrowMove.status;
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


    animationImageTwoMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationImageTwoMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationImageTwoMoveController, curve: universialCurve));
    animationImageTwoMove.addListener(() {
      setState(() {
        animationImageTwoMoveValue = animationImageTwoMove.value;
      });
    });
    animationImageTwoMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationImageTwoMoveStatus = animationImageTwoMove.status;
      });
    });

    animationAppMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationAppMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationAppMoveController, curve: universialCurve));
    animationAppMove.addListener(() {
      setState(() {
        animationAppMoveValue = animationAppMove.value;
      });
    });
    animationAppMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationAppMoveStatus = animationAppMove.status;
      });
    });

    animationIphoneMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationIphoneMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationIphoneMoveController, curve: universialCurve));
    animationIphoneMove.addListener(() {
      setState(() {
        animationIphoneMoveValue = animationIphoneMove.value;
      });
    });
    animationIphoneMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationIphoneMoveStatus = animationIphoneMove.status;
      });
    });


    animationBarMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationBarMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationBarMoveController, curve: universialCurve));
    animationBarMove.addListener(() {
      setState(() {
        animationBarMoveValue = animationBarMove.value;
      });
    });
    animationBarMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBarMoveStatus = animationBarMove.status;
      });
    });

    animationBarTextOneMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationBarTextOneMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationBarTextOneMoveController, curve: universialCurve));
    animationBarTextOneMove.addListener(() {
      setState(() {
        animationBarTextOneMoveValue = animationBarTextOneMove.value;
      });
    });
    animationBarTextOneMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBarTextOneMoveStatus = animationBarTextOneMove.status;
      });
    });



    animationBarTextTwoMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationBarTextTwoMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationBarTextTwoMoveController, curve: universialCurve));
    animationBarTextTwoMove.addListener(() {
      setState(() {
        animationBarTextTwoMoveValue = animationBarTextTwoMove.value;
      });
    });
    animationBarTextTwoMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBarTextTwoMoveStatus = animationBarTextTwoMove.status;
      });
    });



    animationBarTextThreeMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationBarTextThreeMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationBarTextThreeMoveController, curve: universialCurve));
    animationBarTextThreeMove.addListener(() {
      setState(() {
        animationBarTextThreeMoveValue = animationBarTextThreeMove.value;
      });
    });
    animationBarTextThreeMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBarTextThreeMoveStatus = animationBarTextThreeMove.status;
      });
    });


    animationBarTextFourMoveController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationBarTextFourMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(new CurvedAnimation(parent: animationBarTextFourMoveController, curve: universialCurve));
    animationBarTextFourMove.addListener(() {
      setState(() {
        animationBarTextFourMoveValue = animationBarTextFourMove.value;
      });
    });
    animationBarTextFourMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBarTextFourMoveStatus = animationBarTextFourMove.status;
      });
    });
    
    
    
    ///Opacities
    animationHeaderOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationHeaderOpacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationHeaderOpacityController, curve: universialCurve));
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

    animationTextOneOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationTextOneOpacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationTextOneOpacityController, curve: universialCurve));
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

    animationBubbleOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationBubbleOpacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationBubbleOpacityController, curve: universialCurve));
    animationBubbleOpacity.addListener(() {
      setState(() {
        animationBubbleOpacityValue = animationBubbleOpacity.value;
      });
    });
    animationBubbleOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBubbleOpacityStatus = animationBubbleOpacity.status;
      });
    });

    animationHeaderTwoOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationHeaderTwoOpacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationHeaderTwoOpacityController, curve: universialCurve));
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


    animationImageOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationImageOpacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationImageOpacityController, curve: universialCurve));
    animationImageOpacity.addListener(() {
      setState(() {
        animationImageOpacityValue = animationImageOpacity.value;
      });
    });
    animationImageOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationImageOpacityStatus = animationImageOpacity.status;
      });
    });


    animationArrowOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationArrowOpacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationArrowOpacityController, curve: universialCurve));
    animationArrowOpacity.addListener(() {
      setState(() {
        animationArrowOpacityValue = animationArrowOpacity.value;
      });
    });
    animationArrowOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationArrowOpacityStatus = animationArrowOpacity.status;
      });
    });



    animationTextTwoOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationTextTwoOpacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationTextTwoOpacityController, curve: universialCurve));
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


    animationImageTwoOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationImageTwoOpacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationImageTwoOpacityController, curve: universialCurve));
    animationImageTwoOpacity.addListener(() {
      setState(() {
        animationImageTwoOpacityValue = animationImageTwoOpacity.value;
      });
    });
    animationImageTwoOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationImageTwoOpacityStatus = animationImageTwoOpacity.status;
      });
    });

    animationAppOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationAppOpacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationAppOpacityController, curve: universialCurve));
    animationAppOpacity.addListener(() {
      setState(() {
        animationAppOpacityValue = animationAppOpacity.value;
      });
    });
    animationAppOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationAppOpacityStatus = animationAppOpacity.status;
      });
    });

    animationIphoneOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationIphoneOpacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationIphoneOpacityController, curve: universialCurve));
    animationIphoneOpacity.addListener(() {
      setState(() {
        animationIphoneOpacityValue = animationIphoneOpacity.value;
      });
    });
    animationIphoneOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationIphoneOpacityStatus = animationIphoneOpacity.status;
      });
    });


    animationBarOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationBarOpacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationBarOpacityController, curve: universialCurve));
    animationBarOpacity.addListener(() {
      setState(() {
        animationBarOpacityValue = animationBarOpacity.value;
      });
    });
    animationBarOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBarOpacityStatus = animationBarOpacity.status;
      });
    });

    animationBarTextOneOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationBarTextOneOpacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationBarTextOneOpacityController, curve: universialCurve));
    animationBarTextOneOpacity.addListener(() {
      setState(() {
        animationBarTextOneOpacityValue = animationBarTextOneOpacity.value;
      });
    });
    animationBarTextOneOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBarTextOneOpacityStatus = animationBarTextOneOpacity.status;
      });
    });



    animationBarTextTwoOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationBarTextTwoOpacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationBarTextTwoOpacityController, curve: universialCurve));
    animationBarTextTwoOpacity.addListener(() {
      setState(() {
        animationBarTextTwoOpacityValue = animationBarTextTwoOpacity.value;
      });
    });
    animationBarTextTwoOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBarTextTwoOpacityStatus = animationBarTextTwoOpacity.status;
      });
    });



    animationBarTextThreeOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationBarTextThreeOpacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationBarTextThreeOpacityController, curve: universialCurve));
    animationBarTextThreeOpacity.addListener(() {
      setState(() {
        animationBarTextThreeOpacityValue = animationBarTextThreeOpacity.value;
      });
    });
    animationBarTextThreeOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBarTextThreeOpacityStatus = animationBarTextThreeOpacity.status;
      });
    });


    animationBarTextFourOpacityController = AnimationController(duration: Duration(milliseconds: universialAnimationDuration), vsync: this);
    animationBarTextFourOpacity = Tween<double>(begin: 0, end: widgetOpacityDelta).animate(new CurvedAnimation(parent: animationBarTextFourOpacityController, curve: universialCurve));
    animationBarTextFourOpacity.addListener(() {
      setState(() {
        animationBarTextFourOpacityValue = animationBarTextFourOpacity.value;
      });
    });
    animationBarTextFourOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBarTextFourOpacityStatus = animationBarTextFourOpacity.status;
      });
    });

    widget._pageController.addListener(loadWidgets);
  }




  @override
  void dispose() {
    animationHeaderOpacityController.dispose();
    animationTextOneOpacityController.dispose();
    animationBubbleOpacityController.dispose();
    animationHeaderTwoOpacityController.dispose();
    animationImageOpacityController.dispose();
    animationArrowOpacityController.dispose();
    animationTextTwoOpacityController.dispose();
    animationImageTwoOpacityController.dispose();
    animationAppOpacityController.dispose();
    animationIphoneOpacityController.dispose();
    animationBarOpacityController.dispose();
    animationBarTextOneOpacityController.dispose();
    animationBarTextTwoOpacityController.dispose();
    animationBarTextThreeOpacityController.dispose();
    animationBarTextFourOpacityController.dispose();


    animationHeaderOpacityController.dispose();
    animationTextOneOpacityController.dispose();
    animationBubbleOpacityController.dispose();
    animationHeaderTwoOpacityController.dispose();
    animationImageOpacityController.dispose();
    animationArrowOpacityController.dispose();
    animationTextTwoOpacityController.dispose();
    animationImageTwoOpacityController.dispose();
    animationAppOpacityController.dispose();
    animationIphoneOpacityController.dispose();
    animationBarOpacityController.dispose();
    animationBarTextOneOpacityController.dispose();
    animationBarTextTwoOpacityController.dispose();
    animationBarTextThreeOpacityController.dispose();
    animationBarTextFourOpacityController.dispose();

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
    utilities.setCurrentPage(PageType.FIVE);

    viewFiveLanded();

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
                child: Image.asset(bigVPng,
                  width: 1200*utilities.width_rate,
                  height: 1130*utilities.height_rate,
                ),
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
                          left: 159*utilities.width_rate,
                          top: 260*utilities.height_rate,
                          child:
                            Container(
                              width: 623*utilities.width_rate,
                              height: 738.47*utilities.height_rate,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: <Widget>[
                                  Positioned(
                                        top: widgetMoveDelta - animationHeaderMove.value,
                                      child:
                                        Opacity(
                                            opacity: animationHeaderOpacity.value,
                                          child: Container(
                                            child:
                                            RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(
                                                  style: TextStyle(
                                                    height: 1.17,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: "Being green ",
                                                      style: TextStyle(
                                                          fontFamily: "KarbonSemibold",
                                                          fontWeight: FontWeight.w800,
                                                          fontSize: 48*utilities.width_rate,
                                                          color: Color(0xff78A11B)
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: "doesn't\nhave to cost the world",
                                                      style: TextStyle(
                                                          fontFamily: "KarbonSemibold",
                                                          fontWeight: FontWeight.w800,
                                                          fontSize: 48*utilities.width_rate,
                                                          color: Color(0xff282C3B)
                                                      ),
                                                    )
                                                  ]
                                              ),
                                            ),
                                          ),
                                        ),
                                    ),
                                  Positioned(
                                    top: 133*utilities.height_rate+ widgetMoveDelta - animationTextOneMove.value ,
                                    child: Opacity(
                                      opacity: animationTextOneOpacity.value,
                                      child: Text(
                                        "We're spreading the message and want your help",
                                        style: TextStyle(
                                          height: 1.6,
                                          color: Color(0xff666F80),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20*utilities.width_rate,
                                          fontFamily: "MontserratMedium"
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: (189+15)*utilities.height_rate+ widgetMoveDelta - animationHeaderTwoMove.value ,
                                    child: Opacity(
                                      opacity: animationHeaderTwoOpacity.value,
                                      child: Container(
                                        child:
                                        RichText(
                                          text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "once-off plan referrals get both",
                                                  style: TextStyle(
                                                      fontFamily: "MontserratSemibold",
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 20*utilities.width_rate,
                                                      color: Color(0xff78A11B),
                                                      height: 1.6
                                                  ),
                                                )
                                              ]
                                          ),
                                        ),
                                      ),
                                    )
                                  ),
                                  Positioned(
                                    top: 255*utilities.height_rate+ widgetMoveDelta - animationImageMove.value ,
                                    child:
                                    Opacity(
                                      opacity: animationImageOpacity.value,
                                      child: Container(
                                        width: (80+80+62)*utilities.width_rate,
                                        height: (200)*utilities.height_rate,
                                        child: Stack(
                                          alignment: Alignment.topCenter,
                                          children: <Widget>[
                                            Positioned(
                                              top: 10*utilities.height_rate,
                                              left: 25*utilities.width_rate,
                                              child: Container(
                                                width: 80*utilities.width_rate,
                                                height: 25*utilities.width_rate,
                                                child: Text(
                                                  "you",
                                                  style: TextStyle(
                                                    height: 1.88,
                                                    fontFamily: "MontserratSemibold",
                                                    fontSize: 17*utilities.width_rate,
                                                    color: Color(0xff78A11B),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 10*utilities.height_rate,
                                              left: 161*utilities.width_rate,
                                              child: Container(
                                                width: 80*utilities.width_rate,
                                                height: 25*utilities.width_rate,
                                                child: Text(
                                                  "them",
                                                  style: TextStyle(
                                                    height: 1.88,
                                                    fontFamily: "MontserratSemibold",
                                                    fontSize: 17*utilities.width_rate,
                                                    color: Color(0xff78A11B),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left:0,
                                              top: 40*utilities.height_rate,
                                              child:
                                                 Container(
                                                   width: 80*utilities.width_rate,
                                                   height: 80*utilities.height_rate,
                                                   child: Stack(
                                                        alignment: Alignment.center,
                                                        children: <Widget>[
                                                          Container(
                                                            width: 80*utilities.width_rate,
                                                            height: 80*utilities.height_rate,
                                                            child: Image.asset(greenSquareBubble),
                                                          ),
                                                          Container(
                                                            child: RichText(
                                                              textAlign: TextAlign.center,
                                                              text: TextSpan(
                                                                  style: TextStyle(height: 1.18),
                                                                  children: [
                                                                    TextSpan(
                                                                        text: "\$100",
                                                                        style: TextStyle(
                                                                          height: 1.45,
                                                                          fontFamily: "MontserratSemibold",
                                                                          fontWeight: FontWeight.w600,
                                                                          fontSize: 22*utilities.width_rate,
                                                                          color: Colors.white,
                                                                        )
                                                                    ),
                                                                    TextSpan(
                                                                        text: "\nCredit",
                                                                        style: TextStyle(
                                                                          height: 2.13,
                                                                          fontFamily: "MontserratRegular",
                                                                          fontSize: 15*utilities.width_rate,
                                                                          color: Colors.white,
                                                                        )
                                                                    ),

                                                                  ]
                                                              ),
                                                            ),

                                                      ),
                                                    ]
                                                ),
                                                 ),
                                            ),
                                            Positioned(
                                                      top:0,
                                                      child:
                                                      Container(
                                                        width: 64*utilities.width_rate,
                                                        height: 77*utilities.height_rate,
                                                        child: Image.asset(dashedConnectorPng),
                                                      ),
                                            ),
                                            Positioned(
                                                right:0,
                                                top: 40*utilities.height_rate,
                                                child:
                                                    Container(
                                                      width: 80*utilities.width_rate,
                                                      height: 80*utilities.height_rate,
                                                      child: Stack(alignment: Alignment.center,
                                                        children: <Widget>[
                                                          Container(
                                                            width: 80*utilities.width_rate,
                                                            height: 80*utilities.height_rate,
                                                            child: Image.asset(greenSquareBubble),
                                                          ),
                                                          Container(
                                                            child: RichText(
                                                              textAlign: TextAlign.center,
                                                              text: TextSpan(
                                                                  style: TextStyle(height: 1.18),
                                                                  children: [
                                                                    TextSpan(
                                                                        text: "\$100",
                                                                        style: TextStyle(
                                                                          height: 1.45,
                                                                          fontFamily: "MontserratSemibold",
                                                                          fontWeight: FontWeight.w600,
                                                                          fontSize: 22*utilities.width_rate,
                                                                          color: Colors.white,
                                                                        )
                                                                    ),
                                                                    TextSpan(
                                                                        text: "\nCredit",
                                                                        style: TextStyle(
                                                                          height: 2.13,
                                                                          fontFamily: "MontserratRegular",
                                                                          fontSize: 15*utilities.width_rate,
                                                                          color: Colors.white,
                                                                        )
                                                                    ),

                                                                  ]
                                                              ),
                                                            ),
                                                          )

                                                        ],
                                                      ),
                                                    ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ),
                                  Positioned(
                                    top: (335+45)*utilities.height_rate+ widgetMoveDelta - animationArrowMove.value ,
                                    child: Opacity(
                                      opacity: animationArrowOpacity.value,
                                      child: Container(
                                        width:23*utilities.width_rate,
                                        height:23*utilities.height_rate,
                                        child:
                                        Image.asset(arrowDownPng),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: (335+90)*utilities.height_rate+ widgetMoveDelta - animationTextTwoMove.value ,
                                    child: Opacity(
                                      opacity: animationTextTwoOpacity.value,
                                      child: Container(
                                        child: Text(
                                          "If you've already been referred, it's only...",
                                          style: TextStyle(
                                            height: 1.88,
                                            fontFamily: "MontserratSemibold",
                                            fontSize: 17*utilities.width_rate,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff666F80)
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top:(335+145)*utilities.height_rate+ widgetMoveDelta - animationImageTwoMove.value ,
                                    child: Opacity(
                                      opacity: animationImageTwoOpacity.value,
                                      child: Container(
                                        height: 110*utilities.height_rate,
                                        width: 311*utilities.width_rate,
                                        child: Stack(
                                          alignment: Alignment.topCenter,
                                          children: <Widget>[
                                            Positioned(
                                              top: 0,
                                              left: 0,
                                              child:Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    width: 48*utilities.width_rate,
                                                    height: 48*utilities.height_rate,
                                                    child: Image.asset(arrow0Png),
                                                  ),
                                                  SizedBox(height: 20*utilities.height_rate,),
                                                  Container(
                                                    child: Text(
                                                      "\$400",
                                                      style: TextStyle(
                                                        height: 2.46,
                                                          fontFamily: "MontserratRegular",
                                                          fontSize: 13*utilities.width_rate,
                                                          color: Color(0xff666F80)
                                                      ),
                                                    ),
                                                  )

                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              top: 0,
                                              left: 60*utilities.width_rate,
                                              child:Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    width: 48*utilities.width_rate,
                                                    height: 48*utilities.height_rate,
                                                    child: Image.asset(arrow1Png),
                                                  ),
                                                  SizedBox(height: 20*utilities.height_rate,),
                                                  Container(
                                                    child: Text(
                                                      "\$300",
                                                      style: TextStyle(
                                                          height: 2.46,
                                                          fontFamily: "MontserratRegular",
                                                          fontSize: 13*utilities.width_rate,
                                                          color: Color(0xff666F80)
                                                      ),
                                                    ),
                                                  )

                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              top: 0,
                                              left: 120*utilities.width_rate,
                                              child:Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    width: 48*utilities.width_rate,
                                                    height: 48*utilities.height_rate,
                                                    child: Image.asset(arrow2Png),
                                                  ),
                                                  SizedBox(height: 20*utilities.height_rate,),
                                                  Container(
                                                    child: Text(
                                                      "\$200",
                                                      style: TextStyle(
                                                          height: 2.46,
                                                          fontFamily: "MontserratRegular",
                                                          fontSize: 13*utilities.width_rate,
                                                          color: Color(0xff666F80)
                                                      ),
                                                    ),
                                                  )

                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              top: 0,
                                              left: 180*utilities.width_rate,
                                              child:Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    width: 48*utilities.width_rate,
                                                    height: 48*utilities.height_rate,
                                                    child: Image.asset(arrow3Png),
                                                  ),
                                                  SizedBox(height: 20*utilities.height_rate,),
                                                  Container(
                                                    child: Text(
                                                      "\$100",
                                                      style: TextStyle(
                                                          height: 2.46,
                                                          fontFamily: "MontserratRegular",
                                                          fontSize: 13*utilities.width_rate,
                                                          color: Color(0xff666F80)
                                                      ),
                                                    ),
                                                  )

                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              top: 0,
                                              left: 263*utilities.width_rate,
                                              child:Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    width: 48*utilities.width_rate,
                                                    height: 48*utilities.height_rate,
                                                    child: Image.asset(arrow4Png),
                                                  ),
                                                  SizedBox(height: 20*utilities.height_rate,),
                                                  Container(
                                                    child: Text(
                                                      "FREE",
                                                      style: TextStyle(
                                                          height: 2.46,
                                                          fontFamily: "MontserratSemibold",
                                                          fontSize: 13*utilities.width_rate,
                                                          color: Color(0xff78A11B)
                                                      ),
                                                    ),
                                                  )

                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              top: 11*utilities.height_rate,
                                              left: 240*utilities.width_rate,
                                              child:
                                                  Container(
                                                    width: 11*utilities.width_rate,
                                                    height: 32*utilities.height_rate,
                                                    child: Image.asset(equalPng),
                                                  ),
                                              ),
                                              ]
                                            ),

                                        ),
                                    )
                                    ),
                                        ],
                                      ),
                                    ),
                                  ),
                        Positioned(
                          top: 188*utilities.height_rate+ widgetMoveDelta - animationAppMove.value ,
                          left: 907*utilities.width_rate,
                          child: Opacity(
                            opacity: animationAppOpacity.value,
                            child: Container(
                              width: 158*utilities.width_rate,
                              height: 32*utilities.height_rate,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 13.33*utilities.width_rate,
                                    height: 18.33*utilities.height_rate,
                                    child: Image.asset(appComePng),
                                  ),
                                  SizedBox(
                                    width: 9.33*utilities.width_rate,
                                  ),
                                  Container(
                                    child: Text(
                                      "App coming soon!",
                                      style: TextStyle(
                                        height: 2.29,
                                        fontFamily: "MontserratSemibold",
                                        color: Color(0xff666F80),
                                        fontSize: 14*utilities.width_rate,
                                        fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 221*utilities.height_rate+ widgetMoveDelta - animationBarMove.value ,
                          left: 1241*utilities.width_rate,
                          child: Opacity(
                            opacity: animationBarOpacity.value,
                            child: (
                                Container(
                                  height: 638*utilities.height_rate,
                                  child: Image.asset(barPng),
                                )
                            ),
                          ),
                        ),
                        Positioned(
                          left: 1303*utilities.width_rate,
                          top: (416)*utilities.height_rate+ widgetMoveDelta - animationBarTextFourMove.value,
                          child: Opacity(
                            opacity: animationBarTextFourOpacity.value,
                            child: Container(
                                width:160*utilities.width_rate ,
                                height: 80*utilities.height_rate,
                                child:
                                  Text(
                                    "Scan an old bill",
                                    style: TextStyle(
                                      fontFamily: "MontserratSemibold",
                                      fontSize: 17*utilities.width_rate,
                                      color: Color(0xff78A11B),
                                      fontWeight: FontWeight.w600,
                                      height: 1.88

                                    ),
                                  )
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: 1600*utilities.width_rate,
                            height: 96*utilities.height_rate,
                            padding: EdgeInsets.symmetric(horizontal: 160*utilities.width_rate),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      MouseRegion(
                                        child: GestureDetector(
                                          onTap: (){HomePageGestureDectors.launchFacebook();},
                                          behavior: HitTestBehavior.translucent,
                                          child: Container(
                                            width: 10.31*utilities.width_rate,
                                            height: 20*utilities.height_rate,
                                            child: Image.asset(facebookIconAsset),
                                          ),
                                        ),
                                        onEnter: (e) {
                                          setState(() {
                                            facebookIconAsset =pg5FacebookGPng ;
                                          });
                                        },
                                        onExit: (e) => {
                                          setState(() {
                                            facebookIconAsset =pg5FacebookPng ;
                                          })
                                        }
                                      ).showCursorOnHover,
                                      SizedBox(
                                        width: 24*utilities.width_rate,
                                      ),
                                      MouseRegion(
                                        child: GestureDetector(
                                          onTap: (){HomePageGestureDectors.launchTwitter();},
                                          behavior: HitTestBehavior.translucent,
                                          child: Container(
                                            width: 20*utilities.width_rate,
                                            height: 16.24*utilities.height_rate,
                                            child: Image.asset(twitterIconAsset),
                                          ),
                                        ),
                                          onEnter: (e) {
                                            setState(() {
                                              twitterIconAsset =pg5TwitterGPng ;
                                            });
                                          },
                                          onExit: (e) => {
                                            setState(() {
                                              twitterIconAsset =pg5TwitterPng ;
                                            })
                                          }
                                      ).showCursorOnHover,
                                      SizedBox(
                                        width: 24*utilities.width_rate,
                                      ),
                                      MouseRegion(
                                        child: GestureDetector(
                                          onTap: (){HomePageGestureDectors.launchLinkedIn();},
                                          behavior: HitTestBehavior.translucent,
                                          child: Container(
                                            width: 20*utilities.width_rate,
                                            height: 20*utilities.height_rate,
                                            child: Image.asset(linkedinIconAsset),
                                          ),
                                        ),
                                          onEnter: (e) {
                                            setState(() {
                                              linkedinIconAsset =pg5LinkedInGPng ;
                                            });
                                          },
                                          onExit: (e) => {
                                            setState(() {
                                              linkedinIconAsset =pg5LinkedInPng ;
                                            })
                                          }
                                      ).showCursorOnHover,
                                      SizedBox(
                                        width: 24*utilities.width_rate,
                                      ),
                                      MouseRegion(
                                        child: GestureDetector(
                                          onTap: (){HomePageGestureDectors.launchInsta();},
                                          behavior: HitTestBehavior.translucent,
                                          child: Container(
                                            width: 20*utilities.width_rate,
                                            height: 20*utilities.height_rate,
                                            child: Image.asset(instaIconAsset),
                                          ),
                                        ),
                                          onEnter: (e) {
                                            setState(() {
                                              instaIconAsset =pg5InstaGPng ;
                                            });
                                          },
                                          onExit: (e) => {
                                            setState(() {
                                              instaIconAsset =pg5InstaPng ;
                                            })
                                          }
                                      ).showCursorOnHover,


                                     /* SizedBox(
                                        width: 48*utilities.width_rate,
                                      ),
                                      Text(
                                        "Link",
                                        style: TextStyle(
                                            color: Color(0xff666F80),
                                            fontFamily: "MontserratRegular",
                                            fontSize: 13*utilities.width_rate,
                                            height: 1.31
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20*utilities.width_rate,
                                      ),
                                      Text(
                                        "Link",
                                        style: TextStyle(
                                            color: Color(0xff666F80),
                                            fontFamily: "MontserratRegular",
                                            fontSize: 13*utilities.width_rate,
                                            height: 1.31
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20*utilities.width_rate,
                                      ),
                                      Text(
                                        "Link",
                                        style: TextStyle(
                                            color: Color(0xff666F80),
                                            fontFamily: "MontserratRegular",
                                            fontSize: 13*utilities.width_rate,
                                            height: 1.31
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20*utilities.width_rate,
                                      ),
                                      Text(
                                        "Link",
                                        style: TextStyle(
                                            color: Color(0xff666F80),
                                            fontFamily: "MontserratRegular",
                                            fontSize: 13*utilities.width_rate,
                                            height: 1.31
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20*utilities.width_rate,
                                      ),
                                      Text(
                                        "Investors",
                                        style: TextStyle(
                                            color: Color(0xff666F80),
                                            fontFamily: "MontserratRegular",
                                            fontSize: 13*utilities.width_rate,
                                            height: 1.31
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20*utilities.width_rate,
                                      ),*/



                                    ],
                                  ),
                                ),
                                Container(
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        height: 1.21,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Privacy ",
                                          style: TextStyle(
                                            fontFamily: "MontserratRegular",
                                            fontSize: 14*utilities.width_rate,
                                            color: Colors.black
                                          )
                                        ),
                                        TextSpan(
                                            text: "- ",
                                            style: TextStyle(
                                                fontFamily: "MontserratRegular",
                                                fontSize: 14*utilities.width_rate,
                                                color: Color(0xff666F80)
                                            )
                                        ),
                                        TextSpan(
                                            text: "Terms ",
                                            style: TextStyle(
                                                fontFamily: "MontserratRegular",
                                                fontSize: 14*utilities.width_rate,
                                                color: Colors.black
                                            )
                                        ),
                                        TextSpan(
                                          text: "- Copyright 2020 reVolt",
                                            style: TextStyle(
                                                fontFamily: "MontserratRegular",
                                                fontSize: 14*utilities.width_rate,
                                                color: Color(0xff666F80)
                                            )
                                        )
                                      ]
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 251*utilities.height_rate+ widgetMoveDelta - animationIphoneMove.value ,
                          left: 816*utilities.width_rate,
                          child: Opacity(
                            opacity: animationIphoneOpacity.value,
                            child: (
                                Container(

                                  height: 850*utilities.height_rate,
                                  width: 850*0.839*utilities.width_rate,
                                  child:
                                  Stack(
                                    alignment: Alignment.topCenter,
                                    children: <Widget>[
                                      Container(
                                        child:  ImageLoaderState.iPhonePg5PngLOAD,
                                      ),

                                      Positioned(
                                        top: 438.32*utilities.height_rate,
                                        left: 26*utilities.width_rate,
                                        child: Container(
                                            width: 290.34*utilities.width_rate,
                                            height: 44*utilities.height_rate,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                SizedBox(
                                                  width: 55*utilities.width_rate,
                                                ),
                                                Container(
                                                  width: 20*utilities.width_rate,
                                                  height: 20*utilities.height_rate,
                                                  child: Image.asset(scanIconPng),
                                                ),
                                                SizedBox(
                                                  width: 12*utilities.width_rate,
                                                ),
                                                Container(
                                                  child: Text(
                                                    "Scan any bill. Keep the\ncamera within the box",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w500,
                                                        height: 1.69,
                                                        fontSize: 13*utilities.width_rate,
                                                        fontFamily: "MontserratMedium",
                                                        color: Color(0xff282C3B)
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                        ),
                                      )

                                    ],
                                  ),

                                )
                            ),
                          ),
                        ),
                                        ],
                                      )
                                    )
                                  ),
          ],
                              ),
      );

  }

  void loadWidgets(){
    if (widget._pageController.page == 4){
      Timer(Duration(milliseconds: 100+200), headerFadeIn);
      Timer(Duration(milliseconds: 100+200*2), textOneFadeIn);
      Timer(Duration(milliseconds: 100+200*3), bubbleFadeIn);
      Timer(Duration(milliseconds: 100+200*4), headerTwoFadeIn);
      Timer(Duration(milliseconds: 100+200*5), imageFadeIn);
      Timer(Duration(milliseconds: 100+200*6), arrowFadeIn);
      Timer(Duration(milliseconds: 100+200*7), textTwoFadeIn);
      Timer(Duration(milliseconds: 100+200*8), imageTwoFadeIn);
      Timer(Duration(milliseconds: 100+200*9+200*6), appFadeIn);
      Timer(Duration(milliseconds: 800), iphoneFadeIn);
      Timer(Duration(milliseconds: 800+200), barFadeIn);
      Timer(Duration(milliseconds: 800+200+200*1), barTextOneFadeIn);
      Timer(Duration(milliseconds: 800+200+200*2), barTextTwoFadeIn);
      Timer(Duration(milliseconds: 800+200+200*3), barTextThreeFadeIn);
      Timer(Duration(milliseconds: 800+200+200*4), barTextFourFadeIn);

      Timer(Duration(seconds: 10),AppNavBarState.animationJoinButtonOpacityController.forward);
    }
  }
  
  void headerFadeIn(){
    animationHeaderMoveController.forward();
    animationHeaderOpacityController.forward();
  }
  void textOneFadeIn(){
    animationTextOneMoveController.forward();
    animationTextOneOpacityController.forward();
  }
  void bubbleFadeIn(){
    animationBubbleMoveController.forward();
    animationBubbleOpacityController.forward();
  }
  void headerTwoFadeIn(){
    animationHeaderTwoMoveController.forward();
    animationHeaderTwoOpacityController.forward();
  }
  void imageFadeIn(){
    animationImageMoveController.forward();
    animationImageOpacityController.forward();
  }
  void arrowFadeIn(){
    animationArrowMoveController.forward();
    animationArrowOpacityController.forward();
  }
  void textTwoFadeIn(){
    animationTextTwoMoveController.forward();
    animationTextTwoOpacityController.forward();
  }
  void imageTwoFadeIn(){
    animationImageTwoMoveController.forward();
    animationImageTwoOpacityController.forward();
  }
  void appFadeIn(){
    animationAppMoveController.forward();
    animationAppOpacityController.forward();
  }
  void iphoneFadeIn(){
    animationIphoneMoveController.forward();
    animationIphoneOpacityController.forward();
  }
  void barFadeIn(){
    animationBarMoveController.forward();
    animationBarOpacityController.forward();
  }
  void barTextOneFadeIn(){
    animationBarTextOneMoveController.forward();
    animationBarTextOneOpacityController.forward();
  }
  void barTextTwoFadeIn(){
    animationBarTextTwoMoveController.forward();
    animationBarTextTwoOpacityController.forward();
  }
  void barTextThreeFadeIn(){
    animationBarTextThreeMoveController.forward();
    animationBarTextThreeOpacityController.forward();
  }
  void barTextFourFadeIn(){
    animationBarTextFourMoveController.forward();
    animationBarTextFourOpacityController.forward();
  }
  void viewFiveLanded(){
    gtm.pushEvent('viewFive-landed');
  }

}

  //sub controller funcs

