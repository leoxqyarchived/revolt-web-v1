
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

import 'package:google_tag_manager/google_tag_manager.dart' as gtm;



class HomeView extends StatefulWidget {
  Utilities utilities;
  PageController _pageController;
  HomeView(Utilities utilities, PageController _pageController) {
    this.utilities = utilities;
    this._pageController = _pageController;
  }
  @override
  @override
  State<StatefulWidget> createState() => HomeViewState(utilities);
}

class HomeViewState extends State<HomeView> with TickerProviderStateMixin  {
  Utilities utilities;
  HomeViewState(Utilities utilities,) {
    this.utilities = utilities;
  }

//Constants
  static final double widgetMoveDelta = 25;
  static final double widgetOpacityDelta = 1;
  static final int universialAnimationDuration = 1000;
  static final Curve universialCurve = Curves.easeOutCubic;

  TextEditingController textEditingController = TextEditingController();
  String email = '';
  bool hidden = true;
  static ValueNotifier<bool> submitEnabled;
  String hintText = "Enter your email... ";
  Color emailTextColor = Color(0xff9EA2B0);
  String emailText = "";
  static ValueNotifier<double> errorOpacity;
  String notificationMessage = "Email format invalid";
  String notificationIconAsset = pg1ExclamationSignPng;
  Color notificationTextColor = Color(0xffED7828);
  CustomTextField textField;
  static bool topElementsLock = false;

  Image facebookIconAsset = ImageLoaderState.pg5FacebookPngLOAD;
  Image twitterIconAsset = ImageLoaderState.pg5TwitterPngLOAD;
  Image linkedInIconAsset = ImageLoaderState.pg5LinkedInPngLOAD;
  Image instaIconAsset = ImageLoaderState.pg5InstaPngLOAD;


  //Global tap location
  Offset down0;
  Offset down1;



//Moving Animation variables
  //content area
//Iphone move animation
  Animation<double> animationIphoneMove;
  AnimationController animationIphoneMoveController;
  AnimationStatus animationIphoneMoveStatus;
  double animationIphoneMoveValue;

//Header move animation
  Animation<double> animationHeaderMove;
  AnimationController animationHeaderMoveController;
  AnimationStatus animationHeaderMoveStatus;
  double animationHeaderMoveValue;

  //Text move animation
  Animation<double> animationTextMove;
  AnimationController animationTextMoveController;
  AnimationStatus animationTextMoveStatus;
  double animationTextMoveValue;

  //Button move animation
  Animation<double> animationButtonMove;
  AnimationController animationButtonMoveController;
  AnimationStatus animationButtonMoveStatus;
  double animationButtonMoveValue;

  //bottom assets
  /*Bottom 4 widgets*/
  //BottomOne move animation
  Animation<double> animationBottomOneMove;
  AnimationController animationBottomOneMoveController;
  AnimationStatus animationBottomOneMoveStatus;
  double animationBottomOneMoveValue;

  //BottomTwo move animation
  Animation<double> animationBottomTwoMove;
  AnimationController animationBottomTwoMoveController;
  AnimationStatus animationBottomTwoMoveStatus;
  double animationBottomTwoMoveValue;

  //BottomThree move animation
  Animation<double> animationBottomThreeMove;
  AnimationController animationBottomThreeMoveController;
  AnimationStatus animationBottomThreeMoveStatus;
  double animationBottomThreeMoveValue;

  //BottomFour move animation
  Animation<double> animationBottomFourMove;
  AnimationController animationBottomFourMoveController;
  AnimationStatus animationBottomFourMoveStatus;
  double animationBottomFourMoveValue;

  //bottom text
  /*BottomText 4 widgets*/
  //BottomTextOne move animation
  Animation<double> animationBottomTextOneMove;
  AnimationController animationBottomTextOneMoveController;
  AnimationStatus animationBottomTextOneMoveStatus;
  double animationBottomTextOneMoveValue;

  //BottomTextTwo move animation
  Animation<double> animationBottomTextTwoMove;
  AnimationController animationBottomTextTwoMoveController;
  AnimationStatus animationBottomTextTwoMoveStatus;
  double animationBottomTextTwoMoveValue;

  //BottomTextThree move animation
  Animation<double> animationBottomTextThreeMove;
  AnimationController animationBottomTextThreeMoveController;
  AnimationStatus animationBottomTextThreeMoveStatus;
  double animationBottomTextThreeMoveValue;

  //BottomTextFour move animation
  Animation<double> animationBottomTextFourMove;
  AnimationController animationBottomTextFourMoveController;
  AnimationStatus animationBottomTextFourMoveStatus;
  double animationBottomTextFourMoveValue;

  Animation<double> animationDownArrowMove;
  AnimationController animationDownArrowMoveController;
  AnimationStatus animationDownArrowMoveStatus;
  double animationDownArrowMoveValue;




//Opacity Animation variables
  //content area
  //Opacities


  Animation<double> animationBackgroundOpacity;
  AnimationController animationBackgroundOpacityController;
  AnimationStatus animationBackgroundOpacityStatus;
  double animationBackgroundOpacityValue;
  
  //Iphone Opacity animation
  Animation<double> animationIphoneOpacity;
  AnimationController animationIphoneOpacityController;
  AnimationStatus animationIphoneOpacityStatus;
  double animationIphoneOpacityValue;

//Header Opacity animation
  Animation<double> animationHeaderOpacity;
  AnimationController animationHeaderOpacityController;
  AnimationStatus animationHeaderOpacityStatus;
  double animationHeaderOpacityValue;

  //Text Opacity animation
  Animation<double> animationTextOpacity;
  AnimationController animationTextOpacityController;
  AnimationStatus animationTextOpacityStatus;
  double animationTextOpacityValue;

  //Button Opacity animation
  Animation<double> animationButtonOpacity;
  AnimationController animationButtonOpacityController;
  AnimationStatus animationButtonOpacityStatus;
  double animationButtonOpacityValue;

  //bottom assets
  /*Bottom 4 widgets*/
  //BottomOne Opacity animation
  Animation<double> animationBottomOneOpacity;
  AnimationController animationBottomOneOpacityController;
  AnimationStatus animationBottomOneOpacityStatus;
  double animationBottomOneOpacityValue;

  //BottomTwo Opacity animation
  Animation<double> animationBottomTwoOpacity;
  AnimationController animationBottomTwoOpacityController;
  AnimationStatus animationBottomTwoOpacityStatus;
  double animationBottomTwoOpacityValue;

  //BottomThree Opacity animation
  Animation<double> animationBottomThreeOpacity;
  AnimationController animationBottomThreeOpacityController;
  AnimationStatus animationBottomThreeOpacityStatus;
  double animationBottomThreeOpacityValue;

  //BottomFour Opacity animation
  Animation<double> animationBottomFourOpacity;
  AnimationController animationBottomFourOpacityController;
  AnimationStatus animationBottomFourOpacityStatus;
  double animationBottomFourOpacityValue;

  //bottom text
  /*BottomText 4 widgets*/
  //BottomTextOne Opacity animation
  Animation<double> animationBottomTextOneOpacity;
  AnimationController animationBottomTextOneOpacityController;
  AnimationStatus animationBottomTextOneOpacityStatus;
  double animationBottomTextOneOpacityValue;

  //BottomTextTwo Opacity animation
  Animation<double> animationBottomTextTwoOpacity;
  AnimationController animationBottomTextTwoOpacityController;
  AnimationStatus animationBottomTextTwoOpacityStatus;
  double animationBottomTextTwoOpacityValue;

  //BottomTextThree Opacity animation
  Animation<double> animationBottomTextThreeOpacity;
  AnimationController animationBottomTextThreeOpacityController;
  AnimationStatus animationBottomTextThreeOpacityStatus;
  double animationBottomTextThreeOpacityValue;

  //BottomTextFour Opacity animation
  Animation<double> animationBottomTextFourOpacity;
  AnimationController animationBottomTextFourOpacityController;
  AnimationStatus animationBottomTextFourOpacityStatus;
  double animationBottomTextFourOpacityValue;

  Animation<double> animationTopElementsOpacity;
  AnimationController animationTopElementsOpacityController;
  AnimationStatus animationTopElementsOpacityStatus;
  double animationTopElementsOpacityValue;

  Animation<double> animationDownArrowOpacity;
  AnimationController animationDownArrowOpacityController;
  AnimationStatus animationDownArrowOpacityStatus;
  double animationDownArrowOpacityValue;


  Animation<double> animationDownArrowJump;
  AnimationController animationDownArrowJumpController;
  AnimationStatus animationDownArrowJumpStatus;
  double animationDownArrowJumpValue;



  @override
  void dispose() {
    animationIphoneMoveController.dispose();
    animationHeaderMoveController.dispose();
    animationTextMoveController.dispose();
    animationButtonMoveController.dispose();
    animationIphoneOpacityController.dispose();
    animationBackgroundOpacityController.dispose();
    animationHeaderOpacityController.dispose();
    animationTextOpacityController.dispose();
    animationButtonOpacityController.dispose();
    animationBottomFourMoveController.dispose();
    animationBottomThreeMoveController.dispose();
    animationBottomTwoMoveController.dispose();
    animationBottomOneMoveController.dispose();
    animationBottomTextOneMoveController.dispose();
    animationBottomTextTwoMoveController.dispose();
    animationBottomTextThreeMoveController.dispose();
    animationBottomTextFourMoveController.dispose();
    animationBottomOneOpacityController.dispose();
    animationBottomTwoOpacityController.dispose();
    animationBottomThreeOpacityController.dispose();
    animationBottomFourOpacityController.dispose();
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
  void initState() {
    super.initState();

    submitEnabled = new ValueNotifier<bool>(true);

    errorOpacity = new ValueNotifier(0);
    errorOpacity.addListener(() {setState(() {
    });});
    textField = CustomTextField(utilities);

/*Animations*/
    //iphone Move Animation
    animationIphoneMoveController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationIphoneMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(
        new CurvedAnimation(
            parent: animationIphoneMoveController, curve: universialCurve));
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

    //header Move Animation
    animationHeaderMoveController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationHeaderMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(
        new CurvedAnimation(
            parent: animationHeaderMoveController, curve: universialCurve));
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

    //Text Move Animation
    animationTextMoveController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationTextMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(
        new CurvedAnimation(
            parent: animationTextMoveController, curve: universialCurve));
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

    //Button Move Animation
    animationButtonMoveController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationButtonMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(
        new CurvedAnimation(
            parent: animationButtonMoveController, curve: universialCurve));
    animationButtonMove.addListener(() {
      setState(() {
        animationButtonMoveValue = animationButtonMove.value;
      });
    });
    animationButtonMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationButtonMoveStatus = animationButtonMove.status;
      });
    });

    //BottomAssetOne Move Animation
    animationBottomOneMoveController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationBottomOneMove =
        Tween<double>(begin: 0, end: widgetMoveDelta).animate(
            new CurvedAnimation(parent: animationBottomOneMoveController,
                curve: universialCurve));
    animationBottomOneMove.addListener(() {
      setState(() {
        animationBottomOneMoveValue = animationBottomOneMove.value;
      });
    });
    animationBottomOneMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBottomOneMoveStatus = animationBottomOneMove.status;
      });
    });

    //BottomAssetTwo Move Animation
    animationBottomTwoMoveController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationBottomTwoMove =
        Tween<double>(begin: 0, end: widgetMoveDelta).animate(
            new CurvedAnimation(parent: animationBottomTwoMoveController,
                curve: universialCurve));
    animationBottomTwoMove.addListener(() {
      setState(() {
        animationBottomTwoMoveValue = animationBottomTwoMove.value;
      });
    });
    animationBottomTwoMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBottomTwoMoveStatus = animationBottomTwoMove.status;
      });
    });

    //BottomAssetThree Move Animation
    animationBottomThreeMoveController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationBottomThreeMove =
        Tween<double>(begin: 0, end: widgetMoveDelta).animate(
            new CurvedAnimation(parent: animationBottomThreeMoveController,
                curve: universialCurve));
    animationBottomThreeMove.addListener(() {
      setState(() {
        animationBottomThreeMoveValue = animationBottomThreeMove.value;
      });
    });
    animationBottomThreeMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBottomThreeMoveStatus = animationBottomThreeMove.status;
      });
    });

    //BottomAssetFour Move Animation
    animationBottomFourMoveController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationBottomFourMove =
        Tween<double>(begin: 0, end: widgetMoveDelta).animate(
            new CurvedAnimation(parent: animationBottomFourMoveController,
                curve: universialCurve));
    animationBottomFourMove.addListener(() {
      setState(() {
        animationBottomFourMoveValue = animationBottomFourMove.value;
      });
    });
    animationBottomFourMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBottomFourMoveStatus = animationBottomFourMove.status;
      });
    });

    animationBottomFourMoveController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationBottomFourMove =
        Tween<double>(begin: 0, end: widgetMoveDelta).animate(
            new CurvedAnimation(parent: animationBottomFourMoveController,
                curve: universialCurve));
    animationBottomFourMove.addListener(() {
      setState(() {
        animationBottomFourMoveValue = animationBottomFourMove.value;
      });
    });
    animationBottomFourMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBottomFourMoveStatus = animationBottomFourMove.status;
      });
    });

    //BottomTextOne Move Animation
    animationBottomTextOneMoveController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationBottomTextOneMove = Tween<double>(begin: 0, end: 25).animate(
        new CurvedAnimation(parent: animationBottomTextOneMoveController,
            curve: universialCurve));
    animationBottomTextOneMove.addListener(() {
      setState(() {
        animationBottomTextOneMoveValue = animationBottomTextOneMove.value;
      });
    });
    animationBottomTextOneMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBottomTextOneMoveStatus = animationBottomTextOneMove.status;
      });
    });

    //BottomTextTwo Move Animation
    animationBottomTextTwoMoveController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationBottomTextTwoMove = Tween<double>(begin: 0, end: 25).animate(
        new CurvedAnimation(parent: animationBottomTextTwoMoveController,
            curve: universialCurve));
    animationBottomTextTwoMove.addListener(() {
      setState(() {
        animationBottomTextTwoMoveValue = animationBottomTextTwoMove.value;
      });
    });
    animationBottomTextTwoMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBottomTextTwoMoveStatus = animationBottomTextTwoMove.status;
      });
    });

    //BottomTextThree Move Animation
    animationBottomTextThreeMoveController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationBottomTextThreeMove = Tween<double>(begin: 0, end: 25).animate(
        new CurvedAnimation(parent: animationBottomTextThreeMoveController,
            curve: universialCurve));
    animationBottomTextThreeMove.addListener(() {
      setState(() {
        animationBottomTextThreeMoveValue = animationBottomTextThreeMove.value;
      });
    });
    animationBottomTextThreeMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBottomTextThreeMoveStatus =
            animationBottomTextThreeMove.status;
      });
    });

    //BottomTextFour Move Animation
    animationBottomTextFourMoveController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationBottomTextFourMove = Tween<double>(begin: 0, end: 25).animate(
        new CurvedAnimation(parent: animationBottomTextFourMoveController,
            curve: universialCurve));
    animationBottomTextFourMove.addListener(() {
      setState(() {
        animationBottomTextFourMoveValue = animationBottomTextFourMove.value;
      });
    });
    animationBottomTextFourMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBottomTextFourMoveStatus = animationBottomTextFourMove.status;
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




    //Opacity Animations
    animationBackgroundOpacityController = AnimationController(
        duration: Duration(milliseconds: 2000),
        vsync: this);
    animationBackgroundOpacity =
        Tween<double>(begin: 0, end: widgetOpacityDelta).animate(
            new CurvedAnimation(parent: animationBackgroundOpacityController,
                curve: universialCurve));
    animationBackgroundOpacity.addListener(() {
      setState(() {
        animationBackgroundOpacityValue = animationBackgroundOpacity.value;
      });
    });



    //iphone Opacity Animation
    animationIphoneOpacityController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationIphoneOpacity =
        Tween<double>(begin: 0, end: widgetOpacityDelta).animate(
            new CurvedAnimation(parent: animationIphoneOpacityController,
                curve: universialCurve));
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

    //header Opacity Animation
    animationHeaderOpacityController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationHeaderOpacity =
        Tween<double>(begin: 0, end: widgetOpacityDelta).animate(
            new CurvedAnimation(parent: animationHeaderOpacityController,
                curve: universialCurve));
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

    //Text Opacity Animation
    animationTextOpacityController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationTextOpacity =
        Tween<double>(begin: 0, end: widgetOpacityDelta).animate(
            new CurvedAnimation(parent: animationTextOpacityController,
                curve: universialCurve));
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

    //Button Opacity Animation
    animationButtonOpacityController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationButtonOpacity =
        Tween<double>(begin: 0, end: widgetOpacityDelta).animate(
            new CurvedAnimation(parent: animationButtonOpacityController,
                curve: universialCurve));
    animationButtonOpacity.addListener(() {
      setState(() {
        animationButtonOpacityValue = animationButtonOpacity.value;
      });
    });

    animationButtonOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationButtonOpacityStatus = animationButtonOpacity.status;
      });
    });

    //BottomOneAsset Opacity Animation
    animationBottomOneOpacityController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationBottomOneOpacity =
        Tween<double>(begin: 0, end: widgetOpacityDelta).animate(
            new CurvedAnimation(parent: animationBottomOneOpacityController,
                curve: universialCurve));
    animationBottomOneOpacity.addListener(() {
      setState(() {
        animationBottomOneOpacityValue = animationBottomOneOpacity.value;
      });
    });

    animationBottomOneOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBottomOneOpacityStatus = animationBottomOneOpacity.status;
      });
    });

    //BottomTwoAsset Opacity Animation
    animationBottomTwoOpacityController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationBottomTwoOpacity =
        Tween<double>(begin: 0, end: widgetOpacityDelta).animate(
            new CurvedAnimation(parent: animationBottomTwoOpacityController,
                curve: universialCurve));
    animationBottomTwoOpacity.addListener(() {
      setState(() {
        animationBottomTwoOpacityValue = animationBottomTwoOpacity.value;
      });
    });

    animationBottomTwoOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBottomTwoOpacityStatus = animationBottomTwoOpacity.status;
      });
    });

    //BottomThreeAsset Opacity Animation
    animationBottomThreeOpacityController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationBottomThreeOpacity =
        Tween<double>(begin: 0, end: widgetOpacityDelta).animate(
            new CurvedAnimation(parent: animationBottomThreeOpacityController,
                curve: universialCurve));
    animationBottomThreeOpacity.addListener(() {
      setState(() {
        animationBottomThreeOpacityValue = animationBottomThreeOpacity.value;
      });
    });

    animationBottomThreeOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBottomThreeOpacityStatus = animationBottomThreeOpacity.status;
      });
    });

    //BottomFourAsset Opacity Animation
    animationBottomFourOpacityController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationBottomFourOpacity =
        Tween<double>(begin: 0, end: widgetOpacityDelta).animate(
            new CurvedAnimation(parent: animationBottomFourOpacityController,
                curve: universialCurve));
    animationBottomFourOpacity.addListener(() {
      setState(() {
        animationBottomFourOpacityValue = animationBottomFourOpacity.value;
      });
    });

    animationBottomFourOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBottomFourOpacityStatus = animationBottomFourOpacity.status;
      });
    });

    //BottomOneText Opacity Animation
    animationBottomTextOneOpacityController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationBottomTextOneOpacity =
        Tween<double>(begin: 0, end: widgetOpacityDelta).animate(
            new CurvedAnimation(parent: animationBottomTextOneOpacityController,
                curve: universialCurve));
    animationBottomTextOneOpacity.addListener(() {
      setState(() {
        animationBottomTextOneOpacityValue =
            animationBottomTextOneOpacity.value;
      });
    });

    animationBottomTextOneOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBottomTextOneOpacityStatus =
            animationBottomTextOneOpacity.status;
      });
    });

    //BottomTwoText Opacity Animation
    animationBottomTextTwoOpacityController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationBottomTextTwoOpacity =
        Tween<double>(begin: 0, end: widgetOpacityDelta).animate(
            new CurvedAnimation(parent: animationBottomTextTwoOpacityController,
                curve: universialCurve));
    animationBottomTextTwoOpacity.addListener(() {
      setState(() {
        animationBottomTextTwoOpacityValue =
            animationBottomTextTwoOpacity.value;
      });
    });

    animationBottomTextTwoOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBottomTextTwoOpacityStatus =
            animationBottomTextTwoOpacity.status;
      });
    });

    //BottomThreeText Opacity Animation
    animationBottomTextThreeOpacityController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationBottomTextThreeOpacity =
        Tween<double>(begin: 0, end: widgetOpacityDelta).animate(
            new CurvedAnimation(
                parent: animationBottomTextThreeOpacityController,
                curve: universialCurve));
    animationBottomTextThreeOpacity.addListener(() {
      setState(() {
        animationBottomTextThreeOpacityValue =
            animationBottomTextThreeOpacity.value;
      });
    });

    animationBottomTextThreeOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBottomTextThreeOpacityStatus =
            animationBottomTextThreeOpacity.status;
      });
    });

    //BottomFourText Opacity Animation
    animationBottomTextFourOpacityController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationBottomTextFourOpacity =
        Tween<double>(begin: 0, end: widgetOpacityDelta).animate(
            new CurvedAnimation(
                parent: animationBottomTextFourOpacityController,
                curve: universialCurve));
    animationBottomTextFourOpacity.addListener(() {
      setState(() {
        animationBottomTextFourOpacityValue =
            animationBottomTextFourOpacity.value;
      });
    });


    animationTopElementsOpacityController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationTopElementsOpacity =
        Tween<double>(begin: 0, end: widgetOpacityDelta).animate(
            new CurvedAnimation(
                parent: animationTopElementsOpacityController,
                curve: universialCurve));
    animationTopElementsOpacity.addListener(() {
      setState(() {
        animationTopElementsOpacityValue =
            animationTopElementsOpacity.value;
      });
    });


    animationBottomTextFourOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationBottomTextFourOpacityStatus =
            animationBottomTextFourOpacity.status;
      });
    });



    animationDownArrowOpacityController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationDownArrowOpacity =
        Tween<double>(begin: 0, end: widgetOpacityDelta).animate(
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

    Timer(Duration(milliseconds: 1600), backgroundFadeIn);
    Timer(Duration(milliseconds: 1600), topElementsFadeIn);
    Timer(Duration(milliseconds: 1600), invokeText);//invoke revolt Text
    Timer(Duration(milliseconds: 3000+200), headerFadeIn);
    Timer(Duration(milliseconds: 3000+400), textFadeIn);
    Timer(Duration(milliseconds: 3000+600), buttonFadeIn);
    Timer(Duration(milliseconds: 3000+650), iphoneFadeIn);
    Timer(Duration(milliseconds: 3000+1000), bottomOneFadeIn);
    Timer(Duration(milliseconds: 3000+1000+150), bottomTwoFadeIn);
    Timer(Duration(milliseconds: 3000+1000+150*2), bottomThreeFadeIn);
    Timer(Duration(milliseconds: 3000+1000+150*3), bottomFourFadeIn);
    Timer(Duration(milliseconds: 3000+1150), bottomTextOneFadeIn);
    Timer(Duration(milliseconds: 3000+1150+150), bottomTextTwoFadeIn);
    Timer(Duration(milliseconds: 3000+1150+150*2), bottomTextThreeFadeIn);
    Timer(Duration(milliseconds: 3000+1150+150*3), bottomTextFourFadeIn);
    Timer(Duration(milliseconds: 3000+1150+150*3+500), downArrowFadeIn);
    Timer(Duration(milliseconds: 3000+1150+150*3+500), downArrowJump);
    Timer(Duration(milliseconds: ((3000+1500+300*3+800)*0.7).round()), NotifyingPageViewState.enableScrollDown);

  }



  @override
  Widget build(BuildContext context, ) {
    utilities.update(context);
    utilities.setCurrentPage(PageType.HOME);

    homePageLanded();

    return Listener(
        onPointerDown: (detail) {
          down0= detail.position;
          if(down1!=null&&down0.dy== down1.dy&&down0.dx== down1.dx){
            hidden=!hidden;
          }else{
            hidden =true;
            submitEnabled.value = false;
            print("outside pressed");
          }
        },
      child: Scaffold(
        backgroundColor: Color(0xff78A11B),
        body: Stack(
          alignment: Alignment.topCenter,
          children: <Widget> [

            Opacity(
              opacity: animationBackgroundOpacity.value,
              child: Container(
                height: 740*utilities.height_rate,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ImageLoaderState.backgroundHomeJpgLOAD,
                      fit: utilities.aspectRatio>1.4840 ? BoxFit.fitWidth : BoxFit.fitHeight,
                      alignment: Alignment.topCenter
                  ),
                ),

                alignment: Alignment.center,
              ),
            ),

            Container(
              width: 1600*utilities.width_rate,
              alignment: Alignment.topCenter,
              child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: <Widget>[
                    Positioned(
                        top: 286*utilities.height_rate + widgetMoveDelta - animationHeaderMove.value,
                        left: 690*utilities.width_rate, child:
                    Container(
                      width: 465*utilities.width_rate,
                      height: 112*utilities.width_rate,
                      child:Opacity(opacity: animationHeaderOpacity.value,
                        child: RichText(
                            text:
                            TextSpan(
                                style: TextStyle(
                                    height: 1.17
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: "The power provider\n", style: TextStyle(
                                      fontSize: 46*utilities.width_rate,
                                      fontFamily: 'KarbonSemibold',
                                      fontStyle: FontStyle.normal,
                                      color: Colors.white
                                  ),),
                                  TextSpan(text: "that makes sense", style: TextStyle(
                                      color: Color(0xff78A11B),
                                      fontSize: 46*utilities.width_rate,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'KarbonSemibold'))
                                ]
                            )
                        ),
                      ),
                    )
                    ),
                    Positioned(
                        top: 414*utilities.height_rate + widgetMoveDelta - animationTextMove.value,
                        left: 690*utilities.width_rate, child:
                    Opacity( opacity :0.6 ,child: //fixed Opacity
                    Container(child:Opacity(opacity: animationTextOpacity.value,
                      child: Text('reVolt will decarbonise Australia’s energy grid by 2025.',
                          style: new TextStyle(color: Color(0xffEEEEF0), fontSize: 16*utilities.width_rate,
                              fontFamily: "MontserratRegular",
                              height: 1.88)
                      ),
                    ),
                    )
                    )
                    ),
                    Positioned(
                      top: 867*utilities.height_rate,
                      child:
                      Container(
                          width: 843 * utilities.width_rate,
                          height: 160 * utilities.height_rate,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Opacity(
                                opacity: animationBottomOneOpacity.value,
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  height: 150 * utilities.height_rate,
                                  width: 186 * utilities.width_rate,
                                  child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: <Widget>[
                                      Positioned(
                                        top:0 + widgetMoveDelta - animationBottomOneMove.value,
                                        child: Container(
                                          width: 186*utilities.width_rate,
                                          height: 55*utilities.height_rate,
                                          child: ImageLoaderState.HundPctPngLOAD,
                                        ),
                                      ),
                                      Positioned(
                                        top: 40*utilities.height_rate + 25 - animationBottomTextOneMove.value,
                                        child: Container(
                                          alignment: Alignment.topCenter,
                                          width: 186*utilities.width_rate,
                                          height: 50*utilities.width_rate,
                                          child: Text(
                                            "Green Energy",
                                            style: TextStyle(
                                                height: 1.5,
                                                fontFamily: "MontserratRegular",
                                                fontSize: 16 * utilities.width_rate,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],

                                  ),
                                ),
                              ),
                              Opacity(
                                opacity: animationBottomTwoOpacity.value,
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  height: 150 * utilities.height_rate,
                                  width: 186 * utilities.width_rate,
                                  child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: <Widget>[
                                      Positioned(
                                        top:0 + widgetMoveDelta - animationBottomTwoMove.value,
                                        child: Container(
                                          width: 186*utilities.width_rate,
                                          height: 55*utilities.height_rate,
                                          child: ImageLoaderState.five00PngLOAD,
                                        ),
                                      ),
                                      Positioned(
                                        top: 40*utilities.height_rate+ 25 - animationBottomTextTwoMove.value,
                                        child: Container(
                                          alignment: Alignment.topCenter,
                                          width: 186*utilities.width_rate,
                                          height: 50*utilities.width_rate,
                                          child: Text(
                                            "Plan + Power",
                                            style: TextStyle(
                                                height: 1.5,
                                                fontFamily: "MontserratRegular",
                                                fontSize: 16 * utilities.width_rate,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],

                                  ),
                                ),
                              ),
                              Opacity(
                                opacity: animationBottomThreeOpacity.value,
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  height: 150 * utilities.height_rate,
                                  width: 186 * utilities.width_rate,
                                  child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: <Widget>[
                                      Positioned(
                                        top:0 + widgetMoveDelta - animationBottomThreeMove.value,
                                        child: Container(
                                          width: 186*utilities.width_rate,
                                          height: 55*utilities.height_rate,
                                          child: ImageLoaderState.socketPngLOAD,
                                        ),
                                      ),
                                      Positioned(
                                        top: 40*utilities.height_rate+ 25 - animationBottomTextThreeMove.value,
                                        child: Container(
                                          alignment: Alignment.topCenter,
                                          width: 186*utilities.width_rate,
                                          height: 50*utilities.width_rate,
                                          child: Text(
                                            "Usage by device",
                                            style: TextStyle(
                                                height: 1.5,
                                                fontFamily: "MontserratRegular",
                                                fontSize: 16 * utilities.width_rate,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],

                                  ),
                                ),
                              ),
                              Opacity(
                                opacity: animationBottomFourOpacity.value,
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  height: 150 * utilities.height_rate,
                                  width: 186 * utilities.width_rate,
                                  child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: <Widget>[Positioned(
                                      top:0 + widgetMoveDelta - animationBottomFourMove.value,
                                      child: Container(
                                        width: 186*utilities.width_rate,
                                        height: 55*utilities.height_rate,
                                        child: ImageLoaderState.hundredPngLOAD,
                                      ),
                                    ),

                                      Positioned(
                                        top: 40*utilities.height_rate+ 25 - animationBottomTextFourMove.value,
                                        child: Container(
                                          alignment: Alignment.topCenter,
                                          width: 186*utilities.width_rate,
                                          height: 50*utilities.width_rate,
                                          child: Text(
                                            "Referral Bonus",
                                            style: TextStyle(
                                                height: 1.5,
                                                fontFamily: "MontserratRegular",
                                                fontSize: 16 * utilities.width_rate,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],

                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                    Positioned(
                      top: 966*utilities.height_rate - widgetMoveDelta + animationDownArrowMove.value
                          +animationDownArrowJump.value,
                      child: GestureDetector(
                        onTap: (){
                          widget._pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.easeOutCubic);
                        },
                        child: Opacity(
                          opacity: animationDownArrowOpacity.value,
                          child: Container(
                            width: 14*utilities.width_rate,
                            height: 8*utilities.height_rate,
                            child: Image.asset(pg1DownArrow),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 218.81*utilities.height_rate + widgetMoveDelta - animationIphoneMove.value,
                        left: 323*utilities.width_rate, child:
                    Opacity(
                        opacity: animationIphoneOpacity.value,
                        child:
                        Container(
                          width: 660*utilities.width_rate,
                          height: 1.45*660*utilities.height_rate,
                          child: ImageLoaderState.iphoneXPngLOAD,
                        )
                    )
                    ),
                    Positioned(
                      top: 495*utilities.height_rate + widgetMoveDelta - animationButtonMove.value,
                      left: 690*utilities.width_rate, child:Opacity(opacity: animationButtonOpacity.value, child:
                    Opacity(
                      opacity: 1,
                      child: Container(
                        height: 145*utilities.height_rate,
                        width: 530*utilities.width_rate,
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: <Widget>[
                            Container(
                                height: 85*utilities.height_rate,
                                width: 530*utilities.width_rate,

                                child:
                                GestureDetector(
                                  child: textField,
                                  onPanDown: (detail){
                                    down1 = detail.globalPosition;
                                  },
                                )

                            ),
                            SizedBox(height: 10*utilities.height_rate,),
                            Opacity(
                              opacity: errorOpacity.value,
                              child: Container(
                                margin: EdgeInsets.only(left: 60*utilities.width_rate),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 14.67*utilities.width_rate,
                                      height: 14.67*utilities.height_rate,
                                      child:
                                      ImageLoaderState.exclamationSignLOAD,
                                    ),
                                    SizedBox(width: 8.67*utilities.width_rate),
                                    Text(
                                        "email incorrect, try again",
                                        style: TextStyle(
                                            fontFamily: "MontserratMedium",
                                            color: Color(0xffED7828),
                                            fontSize: 13*utilities.width_rate,
                                            fontWeight: FontWeight.w500,
                                            height: 1.54
                                        )
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
                    )
                  ]
              ),
            ),


            Positioned(
                top:0,
                child:
                Container(
                    width: 1600*utilities.width_rate,
                    height: 96*utilities.height_rate,
                    padding: EdgeInsets.fromLTRB(0, 0, 160*utilities.width_rate, 0),
                    child:
                    Opacity(
                      opacity: topElementsLock ? 1 : animationTextOpacity.value,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                child: Row( //SEARCH ABOUT SHOP
                                  children: <Widget>[
                                    MouseRegion(
                                      onEnter: (e){
                                        setState(() {
                                          facebookIconAsset = ImageLoaderState.pg5FacebookGPngLOAD;
                                        });
                                      },
                                      onExit: (e){
                                        setState(() {
                                          facebookIconAsset = ImageLoaderState.pg5FacebookPngLOAD;
                                        });
                                      },
                                      child: Container(
                                        width: 10.31*utilities.width_rate,
                                        height: 20*utilities.height_rate,
                                        color: Colors.transparent,
                                        child: facebookIconAsset.showCursorOnHover,
                                      ),
                                    ),
                                    SizedBox(width: 24*utilities.width_rate,),
                                    MouseRegion(
                                      onEnter: (e){
                                        setState(() {
                                          twitterIconAsset = ImageLoaderState.pg5TwitterGPngLOAD;
                                        });
                                      },
                                      onExit: (e){
                                        setState(() {
                                          twitterIconAsset = ImageLoaderState.pg5TwitterPngLOAD;
                                        });
                                      },

                                      child: Container(
                                        width: 20*utilities.width_rate,
                                        height: 16.24*utilities.height_rate,
                                        child: twitterIconAsset
                                            .showCursorOnHover,
                                      ),
                                    ),
                                    SizedBox(width: 24*utilities.width_rate,),
                                    MouseRegion(
                                      onEnter: (e){
                                        setState(() {
                                          linkedInIconAsset = ImageLoaderState.pg5LinkedInGPngLOAD;
                                        });
                                      },
                                      onExit: (e){
                                        setState(() {
                                          linkedInIconAsset = ImageLoaderState.pg5LinkedInPngLOAD;
                                        });
                                      },
                                      child: Container(
                                        width: 20*utilities.width_rate,
                                        height: 20*utilities.height_rate,
                                        child: linkedInIconAsset
                                            .showCursorOnHover,
                                      ),
                                    ),
                                    SizedBox(width: 24*utilities.width_rate,),
                                    MouseRegion(
                                      onEnter: (e){
                                        setState(() {
                                          instaIconAsset = ImageLoaderState.pg5InstaGPngLOAD;
                                        });
                                      },
                                      onExit: (e){
                                        setState(() {
                                          instaIconAsset = ImageLoaderState.pg5InstaPngLOAD;
                                        });
                                      },
                                      child: Container(
                                        width: 20*utilities.width_rate,
                                        height: 20*utilities.height_rate,
                                        child: instaIconAsset.showCursorOnHover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(width: 47.69*utilities.width_rate,),

                              Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Container(
                                      width: 104*utilities.width_rate,
                                      child:
                                      ImageLoaderState.signInPngLOAD
                                  ).showCursorOnHover,
                                  Container(
                                      width: 60*utilities.width_rate,
                                      child:
                                      FittedBox(fit:BoxFit.fitWidth,
                                          child: Text("SIGN IN", style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'MontserratSemibold',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16*utilities.width_rate
                                          ))).showCursorOnHover),

                                ],
                              ),
                            ]
                        ),
                      ),
                    )
                )
            ),
          ],
        ),

      )
    );

  }


  void loadWidgets(){
    if (widget._pageController.page == 0) {
      Timer(Duration(milliseconds: 0), backgroundFadeIn);
      Timer(Duration(milliseconds: 0+200), headerFadeIn);
      Timer(Duration(milliseconds: 0+400), textFadeIn);
      Timer(Duration(milliseconds: 0+600), buttonFadeIn);
      Timer(Duration(milliseconds: 0+650), iphoneFadeIn);
      Timer(Duration(milliseconds: 0+1000), bottomOneFadeIn);
      Timer(Duration(milliseconds: 0+1000+150), bottomTwoFadeIn);
      Timer(Duration(milliseconds: 0+1000+150*2), bottomThreeFadeIn);
      Timer(Duration(milliseconds: 0+1000+150*3), bottomFourFadeIn);
      Timer(Duration(milliseconds: 0+1150), bottomTextOneFadeIn);
      Timer(Duration(milliseconds: 0+1150+150), bottomTextTwoFadeIn);
      Timer(Duration(milliseconds: 0+1150+150*2), bottomTextThreeFadeIn);
      Timer(Duration(milliseconds: 0+1150+150*3), bottomTextFourFadeIn);
      Timer(Duration(milliseconds: 0+1150+150*3+500), downArrowFadeIn);
      Timer(Duration(milliseconds: 0+1150+150*3+500), downArrowJump);
      Timer(Duration(milliseconds: ((0+1500+300*3+800)*0.7).round()), NotifyingPageViewState.enableScrollDown);

    }
  }
  //sub controller funcs
  void iphoneFadeIn(){
    animationIphoneMoveController.forward();
    animationIphoneOpacityController.forward();
  }

  void backgroundFadeIn(){
    animationBackgroundOpacityController.forward();
  }
  void headerFadeIn(){
    animationHeaderMoveController.forward();
  animationHeaderOpacityController.forward();
  }
  void textFadeIn(){
    animationTextMoveController.forward();
    animationTextOpacityController.forward();
  }
  void buttonFadeIn(){
    animationButtonMoveController.forward();
    animationButtonOpacityController.forward();
  }

  void bottomOneFadeIn(){
    animationBottomOneMoveController.forward();
    animationBottomOneOpacityController.forward();
  }

  void bottomTwoFadeIn(){
    animationBottomTwoMoveController.forward();
    animationBottomTwoOpacityController.forward();
  }


  void bottomThreeFadeIn(){
    animationBottomThreeMoveController.forward();
    animationBottomThreeOpacityController.forward();
  }


  void bottomFourFadeIn(){
    animationBottomFourMoveController.forward();
    animationBottomFourOpacityController.forward();
  }

  void bottomTextOneFadeIn(){
    animationBottomTextOneMoveController.forward();
    animationBottomTextOneOpacityController.forward();
  }

  void bottomTextTwoFadeIn(){
    animationBottomTextTwoMoveController.forward();
    animationBottomTextTwoOpacityController.forward();
  }


  void bottomTextThreeFadeIn(){

    animationBottomTextThreeMoveController.forward();
    animationBottomTextThreeOpacityController.forward();
  }


  void bottomTextFourFadeIn(){
    animationBottomTextFourMoveController.forward();
    animationBottomTextFourOpacityController.forward();
  }

  void topElementsFadeIn(){
    animationTopElementsOpacityController.forward();
    widget._pageController.removeListener(topElementsFadeIn);
  }


  void downArrowFadeIn(){
    animationDownArrowMoveController.forward();
    animationDownArrowOpacityController.forward();
  }

  void downArrowJump(){
   animationDownArrowJumpController.forward();
   animationDownArrowJumpController.repeat( reverse: true, period: Duration(milliseconds: 1300));
  }

  void invokeText(){
    reVoltTextState.globalOpacity.value = 1;
  }

  void homePageLanded(){
    gtm.pushEvent('homeView-landed');
  }


}


class CustomTextField extends StatefulWidget{
  Utilities utilities;

  @override
  CustomTextField(Utilities utilities) {
    this.utilities = utilities;
  }

  @override
  CustomTextFieldState createState() => CustomTextFieldState(utilities);

}

class CustomTextFieldState extends State<CustomTextField> with TickerProviderStateMixin {
  Utilities utilities;
  AuthService auth = new AuthService();
  FocusNode myFocusNode;
  Offset down0;
  Offset down1;
  bool focused;
  bool hasError;
  bool clicked;
  bool errorFirstTime;
  String labelText;
  TextStyle labelStyle;
  bool withError;
  Color textFieldColor;
  Validators myValidator = new Validators();
  final formKey = GlobalKey<FormState>();
  final formController = TextEditingController();
  bool isRegistered = false;
  String email;



  Animation<double> animationRegisteredTextMove;
  AnimationController animationRegisteredTextMoveController;
  AnimationStatus animationRegisteredTextMoveStatus;
  double animationRegisteredTextMoveValue;

  Animation<double> animationRegisteredTextOpacity;
  AnimationController animationRegisteredTextOpacityController;
  AnimationStatus animationRegisteredTextOpacityStatus;
  double animationRegisteredTextOpacityValue;


  CustomTextFieldState(Utilities utilities){
    this.utilities = utilities;
  }


  void dispose(){

    animationRegisteredTextMoveController.dispose();
    animationRegisteredTextOpacityController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  void callSetState(){
    setState(() {
    });
  }

  @override
  void initState() {

    NotifyingPageViewState.showhomePageGestureDectors = true;
    super.initState();
    HomeViewState.submitEnabled.addListener(callSetState);
    hasError = false;
    errorFirstTime = true;
    clicked = false;
    focused = false;
    labelText = "             Enter your email...";
    labelStyle = TextStyle(
        height: 1.8,
        fontFamily: "MontserratRegular",
        fontSize: 18*utilities.width_rate,
        color:Colors.white
    );

    textFieldColor = Color(0xff9EA2B0).withOpacity(0.2);
    myFocusNode = FocusNode();
    myFocusNode.addListener(onFocusChange);



    animationRegisteredTextMoveController = AnimationController(
        duration: Duration(milliseconds: 2000),
        vsync: this);
    animationRegisteredTextMove = Tween<double>(begin: 0, end: 25).animate(
        new CurvedAnimation(parent: animationRegisteredTextMoveController,
            curve: Curves.easeOutCubic));
    animationRegisteredTextMove.addListener(() {
      setState(() {
        animationRegisteredTextMoveValue = animationRegisteredTextMove.value;
      });
    });
    animationRegisteredTextMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationRegisteredTextMoveStatus = animationRegisteredTextMove.status;
      });
    });


    animationRegisteredTextOpacityController = AnimationController(
        duration: Duration(milliseconds: 2000),
        vsync: this);
    animationRegisteredTextOpacity =
        Tween<double>(begin: 0, end: 1).animate(
            new CurvedAnimation(
                parent: animationRegisteredTextOpacityController,
                curve: Curves.easeOutCubic));
    animationRegisteredTextOpacity.addListener(() {
      setState(() {
        animationRegisteredTextOpacityValue =
            animationRegisteredTextOpacity.value;
      });
    });

  }

  void onFocusChange(){
    setState(() {
      focused = !focused;
      textFieldColor =
      focused ?
        Color(0xff9EA2B0).withOpacity(0.4)
        :
        Color(0xff9EA2B0).withOpacity(0.2);
      if (hasError && !errorFirstTime){
        HomeViewState.errorOpacity.value = 0;
        hasError = false;
      }
      errorFirstTime = false;
    });
  }
  void setLabelText(){
      labelText = myFocusNode.hasFocus ?
      "Email"
           :
      "             Enter your email...";
  }

  void setLabelStyle(){
      labelStyle = myFocusNode.hasFocus ?
      TextStyle(

          height: 1.8,
          fontFamily: "MontserratMedium",
          fontSize: 19*utilities.width_rate,
          color:Color(0xff9EA2B0))
          :
      TextStyle(
          height: 1.8,
          fontFamily: "MontserratRegular",
          fontSize: 18*utilities.width_rate,
          color:Colors.white
      );

  }




  @override
  Widget build(BuildContext context) {
    return
      !isRegistered ?

        Row(
          children: <Widget>[
            SizedBox(
              height: 64*utilities.height_rate,
              width: 307*utilities.width_rate,
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Container(
                      height: 64*utilities.height_rate,
                      width: 307*utilities.width_rate,
                      color: textFieldColor,
                    ),
                  ),
                  Container(
                    width: 290*utilities.width_rate,
                    padding: EdgeInsets.only(left: 26*utilities.width_rate),
                    child: TextField(
                      cursorColor: Color(0xff78A11B),
                      style: TextStyle(
                          color: Color(0xffFFFFFF),
                          height: 1.4,
                          fontWeight: FontWeight.w500,
                          fontSize: 17*utilities.width_rate,
                          fontFamily: "MontserratMedium"
                      ),
                      focusNode: myFocusNode,
                      decoration: new InputDecoration.collapsed(
                        hintText: "Enter your email address",
                        hintStyle: TextStyle(
                          fontFamily: "MontserratMedium",
                          color: Color(0xff9EA2B0),
                          fontSize: 17*utilities.width_rate,
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                        ),
                      ),
                      onChanged: (text){
                        email = text;
                      },
                      onSubmitted: (value){
                        if (HomeViewState.submitEnabled.value){
                          if (myValidator.isValidEmail(email)){
                            auth.signUp(email: email, password: "000000");
                            setState(() {
                              isRegistered = true;
                              Timer(Duration(milliseconds:50), registeredTextFadeIn);
                            });
                          }
                          else {
                            hasError = true;
                            errorFirstTime = true;
                            HomeViewState.errorOpacity.value = 1;
                          }
                        }
                        else {
                          HomeViewState.submitEnabled.removeListener(callSetState);
                          HomeViewState.submitEnabled.value = true;
                          HomeViewState.submitEnabled.addListener(callSetState);
                        }
                      },

                    ),
                  )
                ],
              ),
            ),

            SizedBox(width: 16*utilities.width_rate,),
            Container(
              width: 192*utilities.width_rate,
              height: 64*utilities.height_rate,
              child: FlatButton(

                onPressed: () {
                  if (myValidator.isValidEmail(email)){
                    auth.signUp(email: email, password: "000000");
                    setState(() {
                      isRegistered = true;
                      Timer(Duration(milliseconds:50), registeredTextFadeIn);
                    });
                  }
                  else {
                    hasError = true;
                    errorFirstTime = true;
                    HomeViewState.errorOpacity.value = 1;
                  }
                },
                child: Text(
                  'Join the reVolt',
                  style: TextStyle(
                      fontSize: 17*utilities.width_rate,
                      fontWeight: FontWeight.w600,
                      fontFamily: "MontserratSemibold",
                      height: 2.37,
                      color: Colors.white
                  ),
                ),
                color: Color(0xff78A11B),
                shape: RoundedRectangleBorder(
                  borderRadius:  BorderRadius.circular(31*utilities.width_rate),
                ),
              ),
            ),
          ],
        )
            :
      Opacity(
        opacity: animationRegisteredTextOpacity.value,
        child: Container(
          padding: EdgeInsets.only(top: 0,),
          child: Row(
            children: <Widget>[
              Container(width: 48*utilities.width_rate,
                  height: 48*utilities.height_rate,
              child:ImageLoaderState.tickSignLOAD),
              SizedBox(width: 16*utilities.width_rate,),
              Text(
                "Confirmation email inbound.\nAwait further instructions...",
                style: TextStyle(
                  fontFamily: "MontserratMedium",
                  color: Color(0xff78A11B),
                  height: 1.78,
                  fontSize: 18*utilities.width_rate
                ),
              )

            ],
          )
        ),
      );
  }


  void registeredTextFadeIn(){
    animationRegisteredTextMoveController.forward();
    animationRegisteredTextOpacityController.forward();
  }



}


