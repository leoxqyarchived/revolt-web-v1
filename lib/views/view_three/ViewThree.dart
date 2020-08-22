import 'dart:async';
import 'dart:html';
import 'dart:math';
import "package:intl/intl.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import '../../materials/materials.dart';
import '../../widgets/AppNavBar.dart';
import '../../widgets/centered_view/centered_view.dart';
import '../../main.dart';
import '../../materials/materials.dart';
import '../../materials/utilities.dart';
import '../../materials/imageLoader.dart';
import 'package:google_tag_manager/google_tag_manager.dart' as gtm;

class ViewThree extends StatefulWidget {
  Utilities utilities;
  PageController _pageController;

  ViewThree(Utilities utilities, PageController _pageController) {
    this.utilities = utilities;
    this._pageController = _pageController;
  }

  @override
  State<StatefulWidget> createState() => _ViewThreeState(utilities);
}

class _ViewThreeState extends State<ViewThree> with TickerProviderStateMixin {
  Utilities utilities;
  PlanPackage planDetails;
  ValueNotifier<PlanPackage> packageNotifier;

  _ViewThreeState(Utilities utilities) {
    this.utilities = utilities;
    planDetails = new PlanPackage();
    packageNotifier = new ValueNotifier<PlanPackage>(planDetails);
    packageNotifier.addListener(() {packageNotifier.value.calculate();});
  }

  //variables
  static final int universialAnimationDuration = 1000;
  static final double widgetMoveDelta = 15;
  static final double widgetOpacityDelta = 1;
  static final Curve universialCurve = Curves.easeInOutQuart;

  //IMAGES TO USE



  MapState selectedState;
  DistributorState selectedDistributor;


  Animation<double> animationHeaderMove;
  AnimationController animationHeaderMoveController;
  AnimationStatus animationHeaderMoveStatus;
  double animationHeaderMoveValue;


  Animation<double> animationSwitchMove;
  AnimationController animationSwitchMoveController;
  AnimationStatus animationSwitchMoveStatus;
  double animationSwitchMoveValue;

  Animation<double> animationMapMove;
  AnimationController animationMapMoveController;
  AnimationStatus animationMapMoveStatus;
  double animationMapMoveValue;

  Animation<double> animationHeaderTwoMove;
  AnimationController animationHeaderTwoMoveController;
  AnimationStatus animationHeaderTwoMoveStatus;
  double animationHeaderTwoMoveValue;


  //Opacities
  Animation<double> animationHeaderOpacity;
  AnimationController animationHeaderOpacityController;
  AnimationStatus animationHeaderOpacityStatus;
  double animationHeaderOpacityValue;


  Animation<double> animationSwitchOpacity;
  AnimationController animationSwitchOpacityController;
  AnimationStatus animationSwitchOpacityStatus;
  double animationSwitchOpacityValue;

  Animation<double> animationMapOpacity;
  AnimationController animationMapOpacityController;
  AnimationStatus animationMapOpacityStatus;
  double animationMapOpacityValue;

  Animation<double> animationHeaderTwoOpacity;
  AnimationController animationHeaderTwoOpacityController;
  AnimationStatus animationHeaderTwoOpacityStatus;
  double animationHeaderTwoOpacityValue;


  @override
  void initState() {
    super.initState();

    NotifyingPageViewState.showhomePageGestureDectors = false;


    print("startunicode"+planDetails.toString());

    selectedState = MapState.UNSELECTED;
    selectedDistributor = DistributorState.UNSELECTED;


    //Animations
    //Animations
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

    animationHeaderTwoMoveController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationHeaderTwoMove =
        Tween<double>(begin: 0, end: widgetMoveDelta).animate(
            new CurvedAnimation(parent: animationHeaderTwoMoveController,
                curve: universialCurve));
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


    animationMapMoveController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationMapMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(
        new CurvedAnimation(
            parent: animationMapMoveController, curve: universialCurve));
    animationMapMove.addListener(() {
      setState(() {
        animationMapMoveValue = animationMapMove.value;
      });
    });
    animationMapMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationMapMoveStatus = animationMapMove.status;
      });
    });

    animationSwitchMoveController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationSwitchMove = Tween<double>(begin: 0, end: widgetMoveDelta).animate(
        new CurvedAnimation(
            parent: animationSwitchMoveController, curve: universialCurve));
    animationSwitchMove.addListener(() {
      setState(() {
        animationSwitchMoveValue = animationSwitchMove.value;
      });
    });
    animationSwitchMove.addStatusListener((AnimationStatus state) {
      setState(() {
        animationSwitchMoveStatus = animationSwitchMove.status;
      });
    });


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

    animationHeaderTwoOpacityController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationHeaderTwoOpacity =
        Tween<double>(begin: 0, end: widgetOpacityDelta).animate(
            new CurvedAnimation(parent: animationHeaderTwoOpacityController,
                curve: universialCurve));
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


    animationMapOpacityController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationMapOpacity =
        Tween<double>(begin: 0, end: widgetOpacityDelta).animate(
            new CurvedAnimation(
                parent: animationMapOpacityController, curve: universialCurve));
    animationMapOpacity.addListener(() {
      setState(() {
        animationMapOpacityValue = animationMapOpacity.value;
      });
    });
    animationMapOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationMapOpacityStatus = animationMapOpacity.status;
      });
    });

    animationSwitchOpacityController = AnimationController(
        duration: Duration(milliseconds: universialAnimationDuration),
        vsync: this);
    animationSwitchOpacity =
        Tween<double>(begin: 0, end: widgetOpacityDelta).animate(
            new CurvedAnimation(parent: animationSwitchOpacityController,
                curve: universialCurve));
    animationSwitchOpacity.addListener(() {
      setState(() {
        animationSwitchOpacityValue = animationSwitchOpacity.value;
      });
    });
    animationSwitchOpacity.addStatusListener((AnimationStatus state) {
      setState(() {
        animationSwitchOpacityStatus = animationSwitchOpacity.status;
      });
    });

    //Init actions
    widget._pageController.addListener(loadWidgets);
  }


  @override
  void dispose() {
    animationHeaderMoveController.dispose();
    animationHeaderTwoMoveController.dispose();
    animationMapMoveController.dispose();
    animationSwitchMoveController.dispose();

    animationHeaderOpacityController.dispose();
    animationHeaderTwoOpacityController.dispose();
    animationMapOpacityController.dispose();
    animationSwitchOpacityController.dispose();

    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }


  void viewThreeLanded(){
    gtm.pushEvent('viewThree-landed');
  }


  Widget build(BuildContext context) {
    utilities.update(context);
    utilities.setCurrentPage(PageType.THREE);
    viewThreeLanded();

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body:
      Stack(
          children: <Widget>[
            Positioned(
              right: ((utilities.WIDTH - 1600 * utilities.width_rate) / 2) +
                  945 * utilities.width_rate,
              child:
              Container(
                child: ImageLoaderState.bigVPngLOAD,
                  width: 1200 * utilities.width_rate,
                  height: 1130 * utilities.height_rate,
                ),
              ),
            Container(
              alignment: Alignment.topCenter,
              child: Container(
                color: Colors.transparent,
                width: 1600 * utilities.width_rate,
                alignment: Alignment.topCenter,
                child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: <Widget>[
                      //Switch

                      Positioned(
                          top: 265 * utilities.height_rate + widgetMoveDelta -
                              animationSwitchMove.value,
                          left: 160 * utilities.width_rate,
                          child:
                          Opacity(
                            opacity: animationSwitchOpacity.value,
                            child: Container(
                                decoration: new BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.04),
                                      blurRadius: 64,
                                      // has the effect of softening the shadow
                                      spreadRadius: 6,
                                      // has the effect of extending the shadow
                                      offset: Offset(
                                        0, // horizontal, move right 0
                                        32 * utilities
                                            .height_rate, // vertical, move down 32
                                      ),
                                    )
                                  ],
                                ),
                                child:
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: PlanSwitch(utilities, packageNotifier),
                                )
                            ),
                          )

                      ),

                      //Map
                      Positioned(
                        top: 295 * utilities.height_rate + widgetMoveDelta -
                            animationMapMove.value,
                        left: 800 * utilities.width_rate,
                        child:
                        Opacity(
                            opacity: animationMapOpacity.value,
                            child: StateSwitch(utilities,packageNotifier)
                        ),
                      ),


                      //Header

                      Positioned(
                        left: 157 * utilities.width_rate,
                        top: 170 * utilities.height_rate + widgetMoveDelta -
                            animationHeaderMove.value,
                        child:
                        Opacity(
                          opacity: animationHeaderOpacity.value,
                          child: Container(
                            child: RichText(
                              text: new TextSpan(
                                  style: new TextStyle(
                                      fontSize: 42 * utilities.width_rate,
                                      fontFamily: 'KarbonSemibold',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xff282C3B)),
                                  children: <TextSpan>[
                                    new TextSpan(text: "A different sort of "),
                                    new TextSpan(
                                        text: "power provider",
                                        style: new TextStyle(
                                            color: Color(0xff78A11B),
                                            fontSize: 42 * utilities.width_rate,
                                            fontStyle: FontStyle.normal,
                                            fontFamily: 'KarbonSemibold'))
                                  ]),
                            ),
                          ),
                        ),
                      ),

                      //stage one


                    ]
                ),
              ),
            ),
          ]
      ),
    );
  }



  void loadWidgets() {
    if (widget._pageController.page == 2) {
      Timer(Duration(milliseconds: 100), HeaderFadeIn);
      Timer(Duration(milliseconds: 300), SwitchFadeIn);
      Timer(Duration(milliseconds: 250), HeaderTwoFadeIn);
      Timer(Duration(milliseconds: 450), MapFadeIn);
      Timer(Duration(milliseconds: (450+1500*0.7).round()), NotifyingPageViewState.enableScrollDown);
    }
  }

  void HeaderFadeIn() {
    animationHeaderMoveController.forward();
    animationHeaderOpacityController.forward();
  }

  void HeaderTwoFadeIn() {
    animationHeaderTwoMoveController.forward();
    animationHeaderTwoOpacityController.forward();
  }

  void MapFadeIn() {
    animationMapMoveController.forward();
    animationMapOpacityController.forward();
  }

  void SwitchFadeIn() {
    animationSwitchMoveController.forward();
    animationSwitchOpacityController.forward();
  }

}

class PlanSwitch extends StatefulWidget {
  Utilities utilities;
  ValueNotifier<PlanPackage> packageNotifier;

  PlanSwitch(Utilities utilities, ValueNotifier<PlanPackage> packageNotifier) {
    this.utilities = utilities;
    this.packageNotifier = packageNotifier;
  }

  _PlanSwitchState createState() => _PlanSwitchState(utilities, packageNotifier);
}

class _PlanSwitchState extends State<PlanSwitch> {
  Utilities utilities;
  ValueNotifier<PlanPackage> packageNotifier;


  //variables
  Image _variableWeeklyAsset;
  Image _variableOnceoffAsset;


  int _variableWeeklyColor = 0xff78A11B;
  int _variableOnceoffColor = 0xffFFFFFF;
  String numberLarge;
  String numberSmall;
  String numberReference;
  String referenceText;

  _PlanSwitchState(Utilities utilities, ValueNotifier<PlanPackage> packageNotifier) {
    this.utilities = utilities;
    this.packageNotifier = packageNotifier;
    numberLarge = NumberFormat("#,###").format(packageNotifier.value.longTermCostPerYear);
    packageNotifier.addListener((){setState(() {
      numberLarge = NumberFormat("#,###").format(packageNotifier.value.longTermCostPerYear);
    });});
    numberSmall = NumberFormat("#,###").format(packageNotifier.value.longTermMonthlyCost);
    packageNotifier.addListener((){setState(() {
      numberSmall = NumberFormat("#,###").format(packageNotifier.value.longTermMonthlyCost);
    });});
    numberReference = packageNotifier.value.referencePrice.toString();
    packageNotifier.addListener(() {setState(() {
      numberReference = packageNotifier.value.referencePrice.toString();
    });});
    referenceText = packageNotifier.value.referenceText;
    packageNotifier.addListener(() {setState(() {
      referenceText = packageNotifier.value.referenceText;
    });});
  }

  @override
  void initState() {
    // TODO: implement initState

    _variableWeeklyAsset = ImageLoaderState.lightGreenBigPngLOAD;
    _variableOnceoffAsset = ImageLoaderState.greenBigPngLOAD;


    //RESTORE USER'S CHOICE




    if (utilities.userSelected){
      if (utilities.getPlanType() == PlanType.ONCE_OFF){
        selectOnceoff();
        deselectWeekly();
      }
      else{
        selectWeekly();
        deselectOnceoff();
      }
      packageNotifier.value.peopleNumber = utilities.getPeopleNumber();
      packageNotifier.value.planType = utilities.getPlanType();
      packageNotifier.value.distributorState = utilities.getDistributorState();
      packageNotifier.value.calculate();
        numberLarge = NumberFormat("#,###").format(packageNotifier.value.longTermCostPerYear);
        numberSmall = NumberFormat("#,###").format(packageNotifier.value.longTermMonthlyCost);
        numberReference = packageNotifier.value.referencePrice.toString();
        referenceText = packageNotifier.value.referenceText;
    }

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 655 * utilities.height_rate,
      width: 515 * utilities.width_rate,
      color: Color(0xffFFFFFF),
      child: Stack(
          children: <Widget>[
            Positioned(
              top: 33 * utilities.height_rate,
              left: 32 * utilities.width_rate,
              child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        height: 1.88
                    ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Two simple plans with transparent prices.\nOne of which is ",
                            style: TextStyle(
                                fontFamily: "MontserratRegular",
                                fontSize: 17 * utilities.width_rate,
                                height: 1.88,
                                color: Color(0xff666F80)
                            )
                        ),
                        TextSpan(
                          text: "unbeatable",
                          style: TextStyle(
                              fontFamily: "MontserratSemibold",
                              fontSize: 17 * utilities.width_rate,
                              height: 1.88,
                              color: Color(0xff282C3B)
                          ),
                        ),
                        TextSpan(
                            text: ".",
                            style: TextStyle(
                                fontFamily: "MontserratRegular",
                                fontSize: 17 * utilities.width_rate,
                                height: 1.88,
                                color: Color(0xff666F80)
                            )
                        ),
                      ]
                  )
              ),
            ),

            Positioned(
              top: 128 * utilities.height_rate,
              left: 20 * utilities.width_rate,
              child: Container(
                  height: 177 * utilities.height_rate,
                  width: 264 * utilities.width_rate,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              selectOnceoff();
                              deselectWeekly();
                              utilities.setPlanType(PlanType.ONCE_OFF);
                              packageNotifier.value.planType= PlanType.ONCE_OFF;
                              packageNotifier.notifyListeners();
                              build(context);
                            },
                            child: Container(
                                alignment: Alignment.center,
                                width: 264 * utilities.width_rate,
                                height: 74 * utilities.width_rate,
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 264 * utilities.width_rate,
                                        height: 64 * utilities.height_rate,
                                        child:
                                        _variableOnceoffAsset,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 264 * utilities.width_rate,
                                        height: 70 * utilities.width_rate,
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    height: 2
                                                ),
                                                children: <TextSpan>[
                                                  TextSpan(text: "   \$ ",
                                                    style: TextStyle(
                                                        fontSize: 18 * utilities
                                                            .width_rate,
                                                        fontFamily: 'MontserratRegular',
                                                        fontStyle: FontStyle
                                                            .normal,
                                                        color: Color(
                                                            _variableOnceoffColor)),
                                                  ),

                                                  TextSpan(text: "500",
                                                    style: TextStyle(
                                                        fontSize: 32 * utilities
                                                            .width_rate,
                                                        fontWeight: FontWeight
                                                            .w600,
                                                        fontFamily: 'MontserratSemibold',
                                                        fontStyle: FontStyle
                                                            .normal,
                                                        color: Color(
                                                            _variableOnceoffColor)),
                                                  ),

                                                  TextSpan(text: " once-off",
                                                    style: TextStyle(
                                                        fontSize: 13 * utilities
                                                            .width_rate,
                                                        fontFamily: 'MontserratRegular',
                                                        fontStyle: FontStyle
                                                            .normal,
                                                        color: Color(
                                                            _variableOnceoffColor)),
                                                  ),
                                                ]
                                            )
                                        ),
                                      )
                                    ]
                                )
                            )
                        ),
                        Text("Or subscribe for", style:
                        TextStyle(
                            fontFamily: "MontserratRegular",
                            fontSize: 13 * utilities.width_rate,
                            color: Color(0xff666F80)
                        ),
                          textAlign: TextAlign.center,
                        ),
                        GestureDetector(
                            onTap: () {
                              deselectOnceoff();
                              selectWeekly();
                              utilities.setPlanType(PlanType.WEEKLY);
                              packageNotifier.value.planType= PlanType.WEEKLY;
                              packageNotifier.notifyListeners();
                              build(context);
                            },
                            child: Container(
                                alignment: Alignment.center,
                                width: 264 * utilities.width_rate,
                                height: 74 * utilities.height_rate,
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 264 * utilities.width_rate,
                                        height: 64 * utilities.height_rate,
                                        child:
                                        _variableWeeklyAsset,
                                      ),

                                      Container(
                                        alignment: Alignment.center,
                                        width: 264 * utilities.width_rate,
                                        height: 70 * utilities.width_rate,
                                        child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(height: 2),
                                                children: <TextSpan>[
                                                  TextSpan(text: "   \$ ",
                                                    style: TextStyle(
                                                        fontSize: 18 * utilities
                                                            .width_rate,
                                                        fontFamily: 'MontserratRegular',
                                                        fontStyle: FontStyle
                                                            .normal,
                                                        color: Color(
                                                            _variableWeeklyColor)),
                                                  ),

                                                  TextSpan(text: "3.50",
                                                    style: TextStyle(
                                                        fontSize: 32 * utilities
                                                            .width_rate,
                                                        fontWeight: FontWeight
                                                            .w600,
                                                        fontFamily: 'MontserratSemibold',
                                                        fontStyle: FontStyle
                                                            .normal,
                                                        color: Color(
                                                            _variableWeeklyColor)),
                                                  ),

                                                  TextSpan(text: "/week",
                                                    style: TextStyle(
                                                        fontSize: 13 * utilities
                                                            .width_rate,
                                                        fontFamily: 'MontserratRegular',
                                                        fontStyle: FontStyle
                                                            .normal,
                                                        color: Color(
                                                            _variableWeeklyColor)),
                                                  ),
                                                ]
                                            )
                                        ),
                                      )
                                    ]
                                )
                            )
                        ),
                      ]
                  )
              ),
            ),

            Positioned(
              top: 128 * utilities.height_rate,
              right: 25 * utilities.width_rate,
              child: Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 176 * utilities.height_rate,
                        width: 170 * utilities.width_rate,
                        child: Image.asset(usagePng),
                      ),
                      Positioned(
                        left: 43 * utilities.width_rate,
                        top: 98 * utilities.height_rate,
                        child: Text(
                          "Usage &\nsupply cost",
                          style: TextStyle(
                            fontFamily: "MontserratMedium",
                            color: Color(0xff666F80),
                            fontWeight: FontWeight.w500,
                            height: 1.25,
                            fontSize: 16 * utilities.width_rate,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  )
              ),
            ),

            Positioned(
              right: 28 * utilities.width_rate,
              top: 346 * utilities.height_rate,
              child: NumberSwitch(utilities,packageNotifier),
            ),

            Positioned(
              left: 32 * utilities.width_rate,
              top: 346 * utilities.height_rate,
              child: Container(
                width: 102 * utilities.width_rate,
                height: 56 * utilities.height_rate,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(child:
                    Image.asset(usersIconPng),
                    ),
                    Text(
                      "People",
                      style: TextStyle(
                          fontFamily: "MontserratRegular",
                          fontSize: 17 * utilities.width_rate,
                          color: Color(0xff666F80)
                      ),
                    )
                  ],
                ),
              ),
            ),

            Positioned(
              left: 32*utilities.width_rate,
              top: 424*utilities.height_rate,
              child: Container(
                width: 450*utilities.width_rate,
                child: Image.asset(longDashLinePng),
              ),
            ),

            Positioned(
              left: 32*utilities.width_rate,
              top: 452*utilities.height_rate,
              child: Container(
                  child:
                  Text("Price Estimate",
                    style: TextStyle(
                        fontSize: 20*utilities.width_rate,
                        fontFamily: 'MontserratSemibold',
                        color: Color(0xff666F80),
                        fontWeight: FontWeight.w600,
                        height: 1.8
                    ),
                  )
              ),
            ),

            Positioned(
              left: 32*utilities.width_rate,
              top: 488*utilities.height_rate,
              child: Container(
                  child:
                  Text("(Inc.GST)",
                    style: TextStyle(
                        fontSize: 17*utilities.width_rate,
                        fontFamily: 'MontserratRegular',
                        color: Color(0xff666F80),
                        fontWeight: FontWeight.w600,
                        height: 1.88
                    ),
                  )
              ),
            ),

            Positioned(
              right: 32*utilities.width_rate,
              top: 415*utilities.height_rate,
              child: Container(
                child: RichText(
                  text: TextSpan(
              style: TextStyle(
              height: 2
              ),
                children: <TextSpan>[
                  TextSpan(text: "   \$ ",
                    style: TextStyle(
                        fontSize: 30 * utilities
                            .width_rate,
                        fontFamily: 'KarbonRegular',
                        fontStyle: FontStyle
                            .normal,
                        color: Color(0xff78A11B)),
                  ),

                  TextSpan(text: numberLarge,
                    style: TextStyle(
                        fontSize: 68 * utilities
                            .width_rate,
                        fontWeight: FontWeight
                            .w600,
                        fontFamily: 'KarbonSemibold',
                        fontStyle: FontStyle
                            .normal,
                        color: Color(0xff78A11B)),
                  ),

                  TextSpan(text: "/year",
                    style: TextStyle(
                        fontSize: 23 * utilities
                            .width_rate,
                        fontFamily: 'KarbonRegular',
                        fontStyle: FontStyle
                            .normal,
                        color: Color(0xff78A11B)),
                  ),
                ]
            )
            ),
              ),
            ),

            Positioned(
              right: 32*utilities.width_rate,
              top: 503*utilities.height_rate,
              child: Container(
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            height: 2
                        ),
                        children: <TextSpan>[
                          TextSpan(text: "   \$ ",
                            style: TextStyle(
                                fontSize: 30 * utilities
                                    .width_rate,
                                fontFamily: 'KarbonRegular',
                                fontStyle: FontStyle
                                    .normal,
                                color: Color(0xff78A11B)),
                          ),

                          TextSpan(text: numberSmall,
                            style: TextStyle(
                                fontSize: 38 * utilities
                                    .width_rate,
                                fontWeight: FontWeight
                                    .w600,
                                fontFamily: 'KarbonSemibold',
                                fontStyle: FontStyle
                                    .normal,
                                color: Color(0xff78A11B)),
                          ),

                          TextSpan(text: "/month",
                            style: TextStyle(
                                fontSize: 23 * utilities
                                    .width_rate,
                                fontFamily: 'KarbonRegular',
                                fontStyle: FontStyle
                                    .normal,
                                color: Color(0xff78A11B)),
                          ),
                        ]
                    )
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              child: Container(
                width: 515 * utilities.width_rate,
                height: 64 * utilities.height_rate,
                color: Color(0xffFAFAFB),
              )
            ),

            Positioned(
              right: 32*utilities.width_rate,
              bottom: 16*utilities.height_rate,
              child: Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 22*utilities.width_rate,
                      height: 22*utilities.width_rate,
                      child: Image.asset(exclamationIconPng),
                    ),
                    SizedBox(
                      width: 9*utilities.width_rate,
                    ),

                    RichText(
                      text:
                      TextSpan(
                        children:

                        [
                          TextSpan(
                              text: numberReference+"% lower ",
                              style: TextStyle(
                                  fontFamily: "MontserratMedium",
                                  fontSize: 13*utilities.width_rate,
                                  color: Color(0xff666F80),
                                  height: 2.46*utilities.width_rate,
                                  fontWeight: FontWeight.w500
                              )
                          ),

                          TextSpan(
                              text: "than "+referenceText,
                              style: TextStyle(
                                  fontFamily: "MontserratRegular",
                                  fontSize: 13*utilities.width_rate,
                                  color: Color(0xff9EA2B0),
                                  height: 2.46*utilities.width_rate,
                                  fontWeight: FontWeight.w500
                              )
                          )
                        ]
                      ),
                    )
                  ],
                ),
              ),
            )

          ]
      ),
    );
  }


  void selectWeekly() {
    setState(() {
      _variableWeeklyAsset = ImageLoaderState.greenBigPngLOAD;
      _variableWeeklyColor = 0xffFFFFFF;
      utilities.setPlanType(PlanType.WEEKLY);
    });
  }

  void selectOnceoff() {
    setState(() {
      _variableOnceoffAsset = ImageLoaderState.greenBigPngLOAD;
      _variableOnceoffColor = 0xffFFFFFF;
      utilities.setPlanType(PlanType.ONCE_OFF);
    });
  }

  void deselectWeekly() {
    setState(() {
      _variableWeeklyAsset = ImageLoaderState.lightGreenBigPngLOAD;
      _variableWeeklyColor = 0xff78A11B;
    });
  }

  void deselectOnceoff() {
    setState(() {
      _variableOnceoffAsset = ImageLoaderState.lightGreenBigPngLOAD;
      _variableOnceoffColor = 0xff78A11B;
    });
  }
}

class NumberSwitch extends StatefulWidget {
  Utilities utilities;
  ValueNotifier<PlanPackage> packageNotifier;

  NumberSwitch(Utilities utilities, ValueNotifier<PlanPackage> packageNotifier) {
    this.utilities = utilities;
    this.packageNotifier = packageNotifier;
  }

  _NumberSwitch createState() => _NumberSwitch(utilities, packageNotifier);
}

class _NumberSwitch extends State<NumberSwitch> {
  Utilities utilities;
  ValueNotifier<PlanPackage> packageNotifier;

  _NumberSwitch(Utilities utilities,
      ValueNotifier<PlanPackage> packageNotifier) {
    this.utilities = utilities;
    this.packageNotifier = packageNotifier;
  }


  //variables

  Image asset = ImageLoaderState.numberSwitch2PngLOAD;

  @override
  initState() {
    super.initState();

    if (utilities.userSelected) {
      if (utilities.getActualPeopleNumber() == 1) {
        selectOne();
      }
      else if (utilities.getActualPeopleNumber() == 2) {
        selectTwo();
      }
      else if (utilities.getActualPeopleNumber() == 3) {
        selectThree();
      }
      else if (utilities.getActualPeopleNumber() == 4) {
        selectFour();
      }
      else {
        selectFive();
      }

      packageNotifier.value.peopleNumber = utilities.getPeopleNumber();
      packageNotifier.value.planType = utilities.getPlanType();
      packageNotifier.value.distributorState = utilities.getDistributorState();
      packageNotifier.value.calculate();
    }
  }

  Widget build(BuildContext context) {
    return Container(
        width: 56 * 5.772 * utilities.width_rate,
        height: 56 * utilities.height_rate,
        child: Stack(children: <Widget>[
          Container(
              width: 56 * 5.772 * utilities.width_rate,
              height: 56 * utilities.height_rate,
              child: asset
          ),
          Positioned(
            left: 0,
            child: GestureDetector(
              onTap: (){
                selectOne();
                packageNotifier.value.peopleNumber= PeopleNumber.ONE;
                packageNotifier.notifyListeners();
              },
              behavior: HitTestBehavior.translucent,
              child: Container(
                width: 64.6*utilities.width_rate,
                height: 56*utilities.height_rate,
              ),
            ),
          ),
          Positioned(
            left: 64.6*utilities.width_rate,
            child: GestureDetector(
              onTap: (){
                selectTwo();
                packageNotifier.value.peopleNumber= PeopleNumber.TWO;
                packageNotifier.notifyListeners();
              },
              behavior: HitTestBehavior.translucent,
              child: Container(
                width: 64.6*utilities.width_rate,
                height: 56*utilities.height_rate,
              ),
            ),
          ),
          Positioned(
            left: 64.6*2*utilities.width_rate,
            child: GestureDetector(
              onTap: (){
                selectThree();
                packageNotifier.value.peopleNumber= PeopleNumber.THREE;
                packageNotifier.notifyListeners();
              },
              behavior: HitTestBehavior.translucent,
              child: Container(
                width: 64.6*utilities.width_rate,
                height: 56*utilities.height_rate,
              ),
            ),
          ),
          Positioned(
            left: 64.6*3*utilities.width_rate,
            child: GestureDetector(
              onTap: (){
                selectFour();
                packageNotifier.value.peopleNumber= PeopleNumber.FOUR;
                packageNotifier.notifyListeners();
              },
              behavior: HitTestBehavior.translucent,
              child: Container(
                width: 64.6*utilities.width_rate,
                height: 56*utilities.height_rate,
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: (){
                selectFive();
                packageNotifier.value.peopleNumber= PeopleNumber.FIVE_MORE;
                packageNotifier.notifyListeners();
              },
              behavior: HitTestBehavior.translucent,
              child: Container(
                width: 64.6*utilities.width_rate,
                height: 56*utilities.height_rate,
              ),
            ),
          ),

        ]));
  }

  void selectOne() {
    setState(() {
      asset = ImageLoaderState.numberSwitch1PngLOAD;
      utilities.setActualPeopleNumber(1);
      utilities.setPeopleNumber(PeopleNumber.ONE);
    });
  }

  void selectTwo() {
    setState(() {
      asset = ImageLoaderState.numberSwitch2PngLOAD;
      utilities.setActualPeopleNumber(2);
      utilities.setPeopleNumber(PeopleNumber.TWO);
    });
  }

  void selectThree() {
    setState(() {
      asset = ImageLoaderState.numberSwitch3PngLOAD;
      utilities.setActualPeopleNumber(3);
      utilities.setPeopleNumber(PeopleNumber.THREE);
    });
  }

  void selectFour() {
    setState(() {
      asset = ImageLoaderState.numberSwitch4PngLOAD;
      utilities.setActualPeopleNumber(4);
      utilities.setPeopleNumber(PeopleNumber.FOUR);
    });
  }

  void selectFive() {
    setState(() {
      asset = ImageLoaderState.numberSwitch5PngLOAD;
      utilities.setActualPeopleNumber(5);
      utilities.setPeopleNumber(PeopleNumber.FIVE_MORE);
    });
  }
}

class StateSwitch extends StatefulWidget {
  Utilities utilities;
  ValueNotifier<PlanPackage> packageNotifier;

  StateSwitch(Utilities utilities, ValueNotifier<PlanPackage> packageNotifier) {
    this.utilities = utilities;
    this.packageNotifier = packageNotifier;
  }

  _StateSwitchState createState() => _StateSwitchState(utilities, packageNotifier);
}

class _StateSwitchState extends State<StateSwitch> {
  Utilities utilities;
  ValueNotifier<PlanPackage> packageNotifier;

  //variables
  //NORMAL
  Image NT ;
  Image NSW ;
  Image VIC ;
  Image SA;
  Image QLD;
  Image WA;
  Image TAS ;


  //hover
  Image NTHover ;
  Image NSWHover; 
  Image VICHover;
  Image SAHover ;
  Image QLDHover ;
  Image WAHover ;
  Image TASHover ;

  //Default
  Image QLDDefault ;

  //Variables toUse
  Image NTInUse;
  Image NSWInUse ;
  Image VICInUse ;
  Image SAInUse;
  Image QLDInUse ;
  Image WAInUse ;
  Image TASInUse ;

  Image WAHorizonAsset;
  Image WASynergyAsset;
  Image VICAuznetAsset ;
  Image VICPowercorAsset ;
  Image VICJemenaAsset;
  Image VICCitipowerAsset ;
  Image VICUnitedEnergyAsset ;


  Image VICAuznetLAsset ;
  Image VICJenemaLAsset;
  Image VICCitypowerLAsset ;
  Image VICPowercorLAsset ;
  Image VICUnitedLAsset;

  Image QLDEnergexAsset;
  Image QLDErgonAsset ;

  Image NSWAugridAsset ;
  Image NSWEssentialAsset; 
  Image NSWEndeavourAsset;
  Image NSWEvoAsset ;

  bool VICEnlarged = false;

  PlanType planType;
  PeopleNumber peopleNumber;
  MapState mapState;
  DistributorState distributorState;

  Container mapArea;
  Container barOne;
  Container barTwo;
  Container barThree;

  String currentPlanMonthlyCostString;
  String otherPlanMonthlyCostString;
  String firstYearMonthlyCostString;
  String bestCompetitorMonthlyCostString;


  _StateSwitchState(Utilities utilities, ValueNotifier<PlanPackage> planPackage) {
    this.utilities = utilities;
    this.packageNotifier = planPackage;

    packageNotifier.addListener((){
      setState((){
        int currentPlanMonthlyCost;
        int otherPlanMonthlyCost;
        int firstYearMonthlyCost;
        int bestCompetitorMonthlyCost;
        PlanPackage otherPlan = new PlanPackage();
        otherPlan.peopleNumber = packageNotifier.value.peopleNumber;
        otherPlan.distributorState = packageNotifier.value.distributorState;
        currentPlanMonthlyCost = packageNotifier.value.longTermMonthlyCost;
        bestCompetitorMonthlyCost = packageNotifier.value.bestCompetitorMonthlyCost;

        if (packageNotifier.value.planType == PlanType.ONCE_OFF){//contains 2 values
          firstYearMonthlyCost = packageNotifier.value.firstYearMonthlyCost;
          otherPlan.planType = PlanType.WEEKLY;
          otherPlan.calculate();
          otherPlanMonthlyCost = otherPlan.longTermMonthlyCost;
          bestCompetitorMonthlyCost = otherPlan.bestCompetitorMonthlyCost;
        }
        else {
          otherPlan.planType = PlanType.ONCE_OFF;
          otherPlan.calculate();
          otherPlanMonthlyCost = otherPlan.longTermMonthlyCost;
          firstYearMonthlyCost = otherPlan.firstYearMonthlyCost;
          bestCompetitorMonthlyCost = otherPlan.bestCompetitorMonthlyCost;
        }

        currentPlanMonthlyCostString = NumberFormat("#,###").format(currentPlanMonthlyCost);
        otherPlanMonthlyCostString = NumberFormat("#,###").format(otherPlanMonthlyCost);
        firstYearMonthlyCostString = NumberFormat("#,###").format(firstYearMonthlyCost);
        bestCompetitorMonthlyCostString = NumberFormat("#,###").format(bestCompetitorMonthlyCost);
      });
    });
  }





  void initState() {


     NT = ImageLoaderState.NTPngLOAD;
     NSW = ImageLoaderState.NSWPngLOAD;
     VIC = ImageLoaderState.VICPngLOAD;
     SA = ImageLoaderState.SAPngLOAD;
     QLD = ImageLoaderState.QLDPngLOAD;
     WA = ImageLoaderState.WAPngLOAD;
     TAS = ImageLoaderState.TASPngLOAD;


    //hover
     NTHover = ImageLoaderState.NTHoverPngLOAD;
     NSWHover = ImageLoaderState.NSWHoverPngLOAD;
     VICHover = ImageLoaderState.VICHoverPngLOAD;
     SAHover = ImageLoaderState.SAHoverPngLOAD;
     QLDHover = ImageLoaderState.QLDHoverPngLOAD;
     WAHover = ImageLoaderState.WAHoverPngLOAD;
     TASHover = ImageLoaderState.TASHoverPngLOAD;

    //Default
     QLDDefault = ImageLoaderState.QLDDefaultPngLOAD;

    //Variables toUse
     NTInUse = ImageLoaderState.NTPngLOAD;
     NSWInUse = ImageLoaderState.NSWPngLOAD;
     VICInUse = ImageLoaderState.VICPngLOAD;
     SAInUse = ImageLoaderState.SAPngLOAD;
     QLDInUse = ImageLoaderState.QLDDefaultPngLOAD;
     WAInUse = ImageLoaderState.WAPngLOAD;
     TASInUse = ImageLoaderState.TASPngLOAD;

     WAHorizonAsset = ImageLoaderState.WAHorizonPngLOAD;
     WASynergyAsset = ImageLoaderState.WASynergyPngLOAD;
     VICAuznetAsset = ImageLoaderState.VICnormalWhiteAuzNetPngLOAD;
     VICPowercorAsset = ImageLoaderState.VICnormalWhitePowercorPngLOAD;
     VICJemenaAsset = ImageLoaderState.VICnormalWhiteJenemaPngLOAD;
     VICCitipowerAsset = ImageLoaderState.VICnormalWhiteCityPowerPngLOAD;
     VICUnitedEnergyAsset = ImageLoaderState.VICnormalWhiteUnitedEnergyLOAD;

     VICAuznetLAsset = ImageLoaderState.VICenlargedWhiteAuzNetPngLOAD;
     VICJenemaLAsset = ImageLoaderState.VICenlargedWhiteJenemaPngLOAD;
     VICCitypowerLAsset = ImageLoaderState.VICenlargedWhiteCityPowerPngLOAD;
     VICPowercorLAsset = ImageLoaderState.VICenlargedWhitePowercorPngLOAD;
     VICUnitedLAsset = ImageLoaderState.VICenlargedWhiteUnitedEnergyLOAD;

     QLDEnergexAsset = ImageLoaderState.QLDEnergexPngLOAD;
     QLDErgonAsset = ImageLoaderState.QLDErgonPngLOAD;

     NSWAugridAsset = ImageLoaderState.NSWAusgridPngLOAD;
     NSWEssentialAsset = ImageLoaderState.NSWEssentialPngLOAD;
     NSWEndeavourAsset = ImageLoaderState.NSWEndeavourPngLOAD;
     NSWEvoAsset = ImageLoaderState.NSWEvoPngLOAD;




       mapState = MapState.UNSELECTED;
       distributorState = DistributorState.UNSELECTED;

       barOne = Container(
         width: 195.27*utilities.width_rate,
         height: 50*utilities.height_rate,
         child: Stack(
           alignment: Alignment.topLeft,
           children: <Widget>[
             RichText(
                 text: TextSpan(
                     children: [
                       TextSpan(
                         text: "Select a state",
                         style: TextStyle(
                             color: Color(0xff666F80),
                             height: 2.37,
                             fontFamily: "MontserratSemibold",
                             fontSize: 17*utilities.width_rate
                         ),
                       )
                     ]
                 )
             ),

             Positioned(
               top: 40*utilities.height_rate,
               child: Container(
                 width: 195.72*utilities.width_rate,
                 child: Image.asset(stageBarBlackPng),
               ),
             )
           ],
         ),
       );
       barTwo = Container(
         width: 195.27*utilities.width_rate,
         height: 50*utilities.height_rate,
         child: Stack(
           alignment: Alignment.topLeft,
           children: <Widget>[
             RichText(
                 text: TextSpan(
                     children: [
                       TextSpan(
                         text: "",
                         style: TextStyle(
                           color: Color(0xff666F80),
                           height: 2.37,
                           fontFamily: "MontserratMedium",
                         ),
                       )
                     ]
                 )
             ),

             Positioned(
               top: 40*utilities.height_rate,
               child: Container(
                 width: 195.72*utilities.width_rate,
                 child: Image.asset(stageBarGreyPng),
               ),
             )
           ],
         ),
       );
       barThree = Container(
         width: 195.27*utilities.width_rate,
         height: 50*utilities.height_rate,
         child: Stack(
           alignment: Alignment.topLeft,
           children: <Widget>[
             RichText(
                 text: TextSpan(
                     children: [
                       TextSpan(
                         text: "",
                         style: TextStyle(
                           color: Color(0xff666F80),
                           height: 2.37,
                           fontFamily: "MontserratMedium",
                         ),
                       )
                     ]
                 )
             ),

             Positioned(
               top: 40*utilities.height_rate,
               child: Container(
                 width: 195.72*utilities.width_rate,
                 child: Image.asset(stageBarGreyPng),
               ),
             )
           ],
         ),
       );


       int currentPlanMonthlyCost;
       int otherPlanMonthlyCost;
       int firstYearMonthlyCost;
       int bestCompetitorMonthlyCost;
       PlanPackage otherPlan = new PlanPackage();
       otherPlan.peopleNumber = packageNotifier.value.peopleNumber;
       otherPlan.distributorState = packageNotifier.value.distributorState;
       currentPlanMonthlyCost = packageNotifier.value.longTermMonthlyCost;

       if (packageNotifier.value.planType == PlanType.ONCE_OFF){//contains 2 values
         firstYearMonthlyCost = packageNotifier.value.firstYearMonthlyCost;
         otherPlan.planType = PlanType.WEEKLY;
         otherPlan.calculate();
         otherPlanMonthlyCost = otherPlan.longTermMonthlyCost;
         bestCompetitorMonthlyCost = otherPlan.bestCompetitorMonthlyCost;
       }
       else {
         otherPlan.planType = PlanType.ONCE_OFF;
         otherPlan.calculate();
         otherPlanMonthlyCost = otherPlan.longTermMonthlyCost;
         firstYearMonthlyCost = otherPlan.firstYearMonthlyCost;
         bestCompetitorMonthlyCost = otherPlan.bestCompetitorMonthlyCost;
       }
       currentPlanMonthlyCostString = NumberFormat("#,###").format(currentPlanMonthlyCost);
       otherPlanMonthlyCostString = NumberFormat("#,###").format(otherPlanMonthlyCost);
       firstYearMonthlyCostString = NumberFormat("#,###").format(firstYearMonthlyCost);
       bestCompetitorMonthlyCostString = NumberFormat("#,###").format(bestCompetitorMonthlyCost);



      //RESTORE USER'S CHOICE


     if (utilities.userSelected){
         mapState = utilities.getMapState();
         planType = utilities.getPlanType();
         peopleNumber = utilities.getPeopleNumber();
         distributorState = utilities.getDistributorState();

         packageNotifier.value.planType = planType;
         packageNotifier.value.peopleNumber = peopleNumber;
         packageNotifier.value.distributorState = distributorState;
         packageNotifier.value.calculate();

         int currentPlanMonthlyCost;
         int otherPlanMonthlyCost;
         int firstYearMonthlyCost;
         int bestCompetitorMonthlyCost;
         PlanPackage otherPlan = new PlanPackage();
         otherPlan.peopleNumber = packageNotifier.value.peopleNumber;
         otherPlan.distributorState = packageNotifier.value.distributorState;
         currentPlanMonthlyCost = packageNotifier.value.longTermMonthlyCost;

         if (packageNotifier.value.planType == PlanType.ONCE_OFF){//contains 2 values
           firstYearMonthlyCost = packageNotifier.value.firstYearMonthlyCost;
           otherPlan.planType = PlanType.WEEKLY;
           otherPlan.calculate();
           otherPlanMonthlyCost = otherPlan.longTermMonthlyCost;
           bestCompetitorMonthlyCost = otherPlan.bestCompetitorMonthlyCost;
         }
         else {
           otherPlan.planType = PlanType.ONCE_OFF;
           otherPlan.calculate();
           otherPlanMonthlyCost = otherPlan.longTermMonthlyCost;
           firstYearMonthlyCost = otherPlan.firstYearMonthlyCost;
           bestCompetitorMonthlyCost = otherPlan.bestCompetitorMonthlyCost;
         }
         currentPlanMonthlyCostString = NumberFormat("#,###").format(currentPlanMonthlyCost);
         otherPlanMonthlyCostString = NumberFormat("#,###").format(otherPlanMonthlyCost);
         firstYearMonthlyCostString = NumberFormat("#,###").format(firstYearMonthlyCost);
         bestCompetitorMonthlyCostString = NumberFormat("#,###").format(bestCompetitorMonthlyCost);

         switch(mapState){
           case (MapState.REGULATED):
              if (distributorState == DistributorState.SYNERGY){

                barOne = Container(
                  width: 195.27*utilities.width_rate,
                  height: 50*utilities.height_rate,
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: <Widget>[
                      RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "State",
                                  style: TextStyle(
                                      color: Color(0xff78A11B),
                                      height: 2.37,
                                      fontFamily: "MontserratMedium",
                                      fontSize: 17*utilities.width_rate
                                  ),
                                ),
                                TextSpan(
                                    text: " (West Australia)",
                                    style: TextStyle(
                                        color: Color(0xff78A11B),
                                        fontSize: 16 * utilities.width_rate,
                                        fontFamily: "MontserratRegular"
                                    )
                                )
                              ]
                          )
                      ),

                      Positioned(
                        top: 40*utilities.height_rate,
                        child: Container(
                          width: 195.72*utilities.width_rate,
                          child: Image.asset(stageBarGreenPng),
                        ),
                      )
                    ],
                  ),
                );
                barTwo = Container(
                  width: 195.27*utilities.width_rate,
                  height: 50*utilities.height_rate,
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: <Widget>[
                      RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "",
                                  style: TextStyle(
                                      color: Color(0xff666F80),
                                      height: 2.37,
                                      fontFamily: "MontserratMedium",
                                      fontSize: 17*utilities.width_rate
                                  ),
                                )
                              ]
                          )
                      ),

                      Positioned(
                        top: 40*utilities.height_rate,
                        child: Container(
                          width: 195.72*utilities.width_rate,
                          child: Image.asset(stageBarBlackPng),
                        ),
                      )
                    ],
                  ),
                );
              }
              else{
                barOne = Container(
                  width: 195.27*utilities.width_rate,
                  height: 50*utilities.height_rate,
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: <Widget>[
                      RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "State",
                                  style: TextStyle(
                                      color: Color(0xff78A11B),
                                      height: 2.37,
                                      fontFamily: "MontserratMedium",
                                      fontSize: 17*utilities.width_rate
                                  ),
                                ),
                                TextSpan(
                                    text: " (North Territory)",
                                    style: TextStyle(
                                        color: Color(0xff78A11B),
                                        fontSize: 16 * utilities.width_rate,
                                        fontFamily: "MontserratRegular"
                                    )
                                )
                              ]
                          )
                      ),

                      Positioned(
                        top: 40*utilities.height_rate,
                        child: Container(
                          width: 195.72*utilities.width_rate,
                          child: Image.asset(stageBarGreenPng),
                        ),
                      )
                    ],
                  ),
                );
                barTwo = Container(
                  width: 195.27*utilities.width_rate,
                  height: 50*utilities.height_rate,
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: <Widget>[
                      RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "",
                                  style: TextStyle(
                                      color: Color(0xff666F80),
                                      height: 2.37,
                                      fontFamily: "MontserratMedium",
                                      fontSize: 17*utilities.width_rate
                                  ),
                                )
                              ]
                          )
                      ),

                      Positioned(
                        top: 40*utilities.height_rate,
                        child: Container(
                          width: 195.72*utilities.width_rate,
                          child: Image.asset(stageBarBlackPng),
                        ),
                      )
                    ],
                  ),
                );
              }
              break;
           case (MapState.UNDER_REVIEW):
             barOne = Container(
               width: 195.27*utilities.width_rate,
               height: 50*utilities.height_rate,
               child: Stack(
                 alignment: Alignment.topLeft,
                 children: <Widget>[
                   RichText(
                       text: TextSpan(
                           children: [
                             TextSpan(
                               text: "State",
                               style: TextStyle(
                                   color: Color(0xff78A11B),
                                   height: 2.37,
                                   fontFamily: "MontserratMedium",
                                   fontSize: 17*utilities.width_rate
                               ),
                             ),
                             TextSpan(
                                 text: " (West Australia)",
                                 style: TextStyle(
                                     color: Color(0xff78A11B),
                                     fontSize: 16 * utilities.width_rate,
                                     fontFamily: "MontserratRegular"
                                 )
                             )
                           ]
                       )
                   ),

                   Positioned(
                     top: 40*utilities.height_rate,
                     child: Container(
                       width: 195.72*utilities.width_rate,
                       child: Image.asset(stageBarGreenPng),
                     ),
                   )
                 ],
               ),
             );
             barTwo = Container(
               width: 195.27*utilities.width_rate,
               height: 50*utilities.height_rate,
               child: Stack(
                 alignment: Alignment.topLeft,
                 children: <Widget>[
                   RichText(
                       text: TextSpan(
                           children: [
                             TextSpan(
                               text: "",
                               style: TextStyle(
                                   color: Color(0xff666F80),
                                   height: 2.37,
                                   fontFamily: "MontserratMedium",
                                   fontSize: 17*utilities.width_rate
                               ),
                             )
                           ]
                       )
                   ),

                   Positioned(
                     top: 40*utilities.height_rate,
                     child: Container(
                       width: 195.72*utilities.width_rate,
                       child: Image.asset(stageBarBlackPng),
                     ),
                   )
                 ],
               ),
             );
             break;
           case (MapState.SELECTED):
             String barOneTextPartTwo = null;
             String barOneTextPartOne = 'State';
             switch (distributorState){
               case (DistributorState.JEMANA):
                 enterJemenaVIC();
                 barOneTextPartTwo = "(Victoria)";
                 break;
               case (DistributorState.POWERCOR):
                 enterPowercorVIC();
                 barOneTextPartTwo = "(Victoria)";
                 break;
               case (DistributorState.CITIPOWER):
                 enterCitipowerVIC();
                 barOneTextPartTwo = "(Victoria)";
                 break;
               case (DistributorState.UNITEDENERGY):
                 enterUnitedenergyVIC();
                 barOneTextPartTwo = "(Victoria)";
                 break;
               case (DistributorState.ENDEVOUR):
                 enterEndeavourNSW();
                 barOneTextPartTwo = "(New South Wales)";
                 break;
               case (DistributorState.ESSENTIALENERGY):
                 enterEssentialNSW();
                 barOneTextPartTwo = "(New South Wales)";
                 break;
               case (DistributorState.AUSGRID):
                 enterAusgridNSW();
                 barOneTextPartTwo = "(New South Wales)";
                 break;
               case (DistributorState.ENERGEX):
                 enterEnergyxQLD();
                 barOneTextPartTwo = "(Queensland)";
                 break;
               case (DistributorState.ERGON):
                 enterErgonQLD();
                 barOneTextPartTwo = "(Queensland)";
                 break;
               case (DistributorState.SAPOWER):
                 enterSAPowerSA();
                 barOneTextPartTwo = "(South Australia)";
                 break;
               case (DistributorState.TASNETWORK):
                 enterTASNetworkTAS();
                 barOneTextPartTwo = "(Tasmania)";
                 break;
               case (DistributorState.EVOENERGY):
                 enterEvoEnergyNSW();
                 barOneTextPartOne = "ACT";
                 barOneTextPartTwo = "";
                 break;
             }

             barOne = Container(
               width: 195.27*utilities.width_rate,
               height: 50*utilities.height_rate,
               child: Stack(
                 alignment: Alignment.topLeft,
                 children: <Widget>[
                   RichText(
                       text: TextSpan(
                           children: [
                             TextSpan(
                               text: barOneTextPartOne,
                               style: TextStyle(
                                   color: Color(0xff78A11B),
                                   height: 2.37,
                                   fontFamily: "MontserratMedium",
                                   fontSize: 17*utilities.width_rate
                               ),
                             ),
                             TextSpan(
                                 text: barOneTextPartTwo,
                                 style: TextStyle(
                                     color: Color(0xff78A11B),
                                     fontSize: 16 * utilities.width_rate,
                                     fontFamily: "MontserratRegular"
                                 )
                             )
                           ]
                       )
                   ),

                   Positioned(
                     top: 40*utilities.height_rate,
                     child: Container(
                       width: 195.72*utilities.width_rate,
                       child: Image.asset(stageBarGreenPng),
                     ),
                   )
                 ],
               ),
             );
         }


     }



    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    utilities.update(context);


    print(this.mapState);


    switch (mapState) {
      case MapState.UNSELECTED:
        mapArea = Container(
            margin: EdgeInsets.only(left: 70*utilities.width_rate),
            width: 500 * utilities.width_rate,
            height: 386 * utilities.height_rate,
            child: Stack(
                children: <Widget>[
                  Container(
                    child:
                    QLDInUse,
                  ),
                  Positioned(
                    left: 425 * utilities.width_rate * 0.63,
                    top: 386 * utilities.height_rate * 0.0,
                    child:
                    MouseRegion(
                      child:
                      Container(
                        width: 425 * utilities.width_rate * 0.51,
                        height: 386 * utilities.height_rate * 0.45,
                      ),
                      onEnter: (e) => setQLDHover(),
                      onExit: (e) => cancleQLDHover(),
                    ),
                  ),

                  Container(
                    child:
                    NTInUse,
                  ),
                  Positioned(
                    left: 425 * utilities.width_rate * 0.39,
                    top: 386 * utilities.height_rate * 0,
                    child:
                    MouseRegion(
                      child:
                      SizedBox(
                        width: 425 * utilities.width_rate * 0.23,
                        height: 386 * utilities.height_rate * 0.43,
                      ),
                      onEnter: (e) => setNTHover(),
                      onExit: (e) => cancleNTHover(),
                    ),
                  ),

                  Container(
                    child:
                    SAInUse,
                  ),
                  Positioned(
                    left: 425 * utilities.width_rate * 0.39,
                    top: 386 * utilities.height_rate * 0.44,
                    child:
                    MouseRegion(
                      child:
                      SizedBox(
                        width: 425 * utilities.width_rate * 0.30,
                        height: 386 * utilities.height_rate * 0.36,
                      ),
                      onEnter: (e) => setSAHover(),
                      onExit: (e) => cancleSAHover(),
                    ),
                  ),


                  Container(
                    child:
                    VICInUse,
                  ),
                  Positioned(
                    left: 425 * utilities.width_rate * 0.69,
                    top: 386 * utilities.height_rate * 0.7,
                    child:
                    MouseRegion(
                      child:
                      SizedBox(
                        width: 425 * utilities.width_rate * 0.20,
                        height: 386 * utilities.height_rate * 0.15,
                      ),
                      onEnter: (e) => setVICHover(),
                      onExit: (e) => cancleVICHover(),
                    ),
                  ),



                  Container(
                    child:
                    TASInUse,
                  ),
                  Positioned(
                    left: 425 * utilities.width_rate * 0.74,
                    top: 386 * utilities.height_rate * 0.90,
                    child:
                    MouseRegion(
                      child:
                      SizedBox(
                        width: 425 * utilities.width_rate * 0.16,
                        height: 386 * utilities.height_rate * 0.12,
                      ),
                      onEnter: (e) => setTASHover(),
                      onExit: (e) => cancleTASHover(),
                    ),
                  ),




                  Container(
                    child:
                    WAInUse,
                  ),
                  Positioned(
                    left: 425 * utilities.width_rate * 0.02,
                    top: 386 * utilities.height_rate * 0.18,
                    child: MouseRegion(
                      child: SizedBox(
                        width: 425 * utilities.width_rate * 0.36,
                        height: 386 * utilities.height_rate * 0.48,
                      ),
                      onEnter: (e) => setWAHover(),
                      onExit: (e) => cancleWAHover(),
                    ),
                  ),


                  Container(
                    child:
                    NSWInUse,
                  ),
                  Positioned(
                    left: 425 * utilities.width_rate * 0.73,
                    top: 386 * utilities.height_rate * 0.52,
                    child:
                    MouseRegion(
                      child:
                      SizedBox(
                        width: 425 * utilities.width_rate * 0.27,
                        height: 386 * utilities.height_rate * 0.21,
                      ),
                      onEnter: (e) => setNSWHover(),
                      onExit: (e) => cancleNSWHover(),
                    ),
                  ),

                  //TAGS

                  Positioned(
                      left: 425 * utilities.width_rate * 0.73,
                      top: 386 * utilities.height_rate * 0.197,
                      child:
                      (QLDInUse == QLDHover || QLDInUse == QLDDefault) ?
                      Container(
                        decoration: new BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.12),
                                blurRadius: 64, // has the effect of softening the shadow
                                spreadRadius: 5, // has the effect of extending the shadow
                                offset: Offset(0, // horizontal, move right 0
                                  12, // vertical, move down 32
                                ),
                              )
                            ]
                        ),
                          child:
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child:
                            Container(
                              alignment: Alignment.center,
                              width: 131*utilities.width_rate,
                              height: 32*utilities.height_rate,
                              color: Colors.white,
                              child: Text(
                                'Queensland',
                                style: TextStyle(
                                  fontSize: 16*utilities.width_rate,
                                  color: Color(0xff666F80),
                                  fontFamily: "MontserratSemibold",
                                    fontWeight: FontWeight.w600,
                                    height: 1.44
                                )
                              ),
                            ),
                          )
                        )
                          :
                      Container(
                      )
                  ),
                  Positioned(
                      left: 425 * utilities.width_rate * 0.513,
                      top: 386 * utilities.height_rate * 0.128,
                      child:
                      (NTInUse == NTHover) ?
                      Container(
                          decoration: new BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.12),
                                  blurRadius: 64, // has the effect of softening the shadow
                                  spreadRadius: 5, // has the effect of extending the shadow
                                  offset: Offset(0, // horizontal, move right 0
                                    12, // vertical, move down 32
                                  ),
                                )
                              ]
                          ),
                          child:
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child:
                            Container(
                              alignment: Alignment.center,
                              width: 145*utilities.width_rate,
                              height: 32*utilities.height_rate,
                              color: Colors.white,
                              child: Text(
                                  'North Territory',
                                  style: TextStyle(
                                      fontSize: 16*utilities.width_rate,
                                      color: Color(0xff666F80),
                                      fontFamily: "MontserratSemibold",
                                      fontWeight: FontWeight.w600,
                                      height: 1.44
                                  )
                              ),
                            ),
                          )
                      )
                          :
                      Container(
                      )
                  ),
                  Positioned(
                      left: 425 * utilities.width_rate * 0.250,
                      top: 386 * utilities.height_rate * 0.5,
                      child:
                      (SAInUse == SAHover) ?
                      Container(
                          decoration: new BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.12),
                                  blurRadius: 64, // has the effect of softening the shadow
                                  spreadRadius: 5, // has the effect of extending the shadow
                                  offset: Offset(0, // horizontal, move right 0
                                    12, // vertical, move down 32
                                  ),
                                )
                              ]
                          ),
                          child:
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child:
                            Container(
                              alignment: Alignment.center,
                              width: 150*utilities.width_rate,
                              height: 32*utilities.height_rate,
                              color: Colors.white,
                              child: Text(
                                  'South Australia',
                                  style: TextStyle(
                                      fontSize: 16*utilities.width_rate,
                                      color: Color(0xff666F80),
                                      fontFamily: "MontserratSemibold",
                                      fontWeight: FontWeight.w600,
                                      height: 1.44
                                  )
                              ),
                            ),
                          )
                      )
                          :
                      Container(
                      )
                  ),
                  Positioned(
                      left: 425 * utilities.width_rate * 0.45,
                      top: 386 * utilities.height_rate * 0.78,
                      child:
                      (VICInUse == VICHover) ?
                      Container(
                          decoration: new BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.05),
                                  blurRadius: 44, // has the effect of softening the shadow
                                  spreadRadius: 5, // has the effect of extending the shadow
                                  offset: Offset(0, // horizontal, move right 0
                                    0, // vertical, move down 32
                                  ),
                                )
                              ]
                          ),
                          child:
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child:
                            Container(
                              alignment: Alignment.center,
                              width: 131*utilities.width_rate,
                              height: 32*utilities.height_rate,
                              color: Colors.white,
                              child: Text(
                                  'Victoria',
                                  style: TextStyle(
                                      fontSize: 16*utilities.width_rate,
                                      color: Color(0xff666F80),
                                      fontFamily: "MontserratSemibold",
                                      fontWeight: FontWeight.w600,
                                      height: 1.44
                                  )
                              ),
                            ),
                          )
                      )
                          :
                      Container(
                      )
                  ),
                  Positioned(
                      left: 425 * utilities.width_rate * 0.637,
                      top: 386 * utilities.height_rate * 0.820,
                      child:
                      (TASInUse == TASHover) ?
                      Container(
                          decoration: new BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.06),
                                  blurRadius: 34, // has the effect of softening the shadow
                                  spreadRadius: 5, // has the effect of extending the shadow
                                  offset: Offset(0, // horizontal, move right 0
                                    0, // vertical, move down 32
                                  ),
                                )
                              ]
                          ),
                          child:
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child:
                            Container(
                              alignment: Alignment.center,
                              width: 131*utilities.width_rate,
                              height: 32*utilities.height_rate,
                              color: Colors.white,
                              child: Text(
                                  'Tasmania',
                                  style: TextStyle(
                                      fontSize: 16*utilities.width_rate,
                                      color: Color(0xff666F80),
                                      fontFamily: "MontserratSemibold",
                                      fontWeight: FontWeight.w600,
                                      height: 1.44
                                  )
                              ),
                            ),
                          )
                      )
                          :
                      Container(
                      )
                  ),
                  Positioned(
                      left: 425 * utilities.width_rate * 0.058,
                      top: 386 * utilities.height_rate * 0.183,
                      child:
                      (WAInUse == WAHover) ?
                      Container(
                          decoration: new BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.04),
                                  blurRadius: 24, // has the effect of softening the shadow
                                  spreadRadius: 2, // has the effect of extending the shadow
                                  offset: Offset(0, // horizontal, move right 0
                                    0, // vertical, move down 32
                                  ),
                                )
                              ]
                          ),
                          child:
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child:
                            Container(
                              alignment: Alignment.center,
                              width: 145*utilities.width_rate,
                              height: 32*utilities.height_rate,
                              color: Colors.white,
                              child: Text(
                                  'West Australia',
                                  style: TextStyle(
                                      fontSize: 16*utilities.width_rate,
                                      color: Color(0xff666F80),
                                      fontFamily: "MontserratSemibold",
                                      fontWeight: FontWeight.w600,
                                      height: 1.44
                                  )
                              ),
                            ),
                          )
                      )
                          :
                      Container(
                      )
                  ),
                  Positioned(
                      left: 425 * utilities.width_rate * 0.780,
                      top: 386 * utilities.height_rate * 0.5,
                      child:
                      (NSWInUse == NSWHover) ?
                      Container(
                          decoration: new BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.05),
                                  blurRadius: 24, // has the effect of softening the shadow
                                  spreadRadius: 3, // has the effect of extending the shadow
                                  offset: Offset(0, // horizontal, move right 0
                                    12, // vertical, move down 32
                                  ),
                                )
                              ]
                          ),
                          child:
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child:
                            Container(
                              alignment: Alignment.center,
                              width: 151*utilities.width_rate,
                              height: 32*utilities.height_rate,
                              color: Colors.white,
                              child: Text(
                                  'New South Wales',
                                  style: TextStyle(
                                      fontSize: 16*utilities.width_rate,
                                      color: Color(0xff666F80),
                                      fontFamily: "MontserratSemibold",
                                      fontWeight: FontWeight.w600,
                                      height: 1.44
                                  )
                              ),
                            ),
                          )
                      )
                          :
                      Container(
                      )
                  ),

                  /*Gesture detectors REMEMBER MUST PUT AT THE END*/
                  Positioned(
                    left: 425 * utilities.width_rate * 0.02,
                    top: 386 * utilities.height_rate * 0.18,
                    child: GestureDetector(
                      onTap: () {
                        utilities.setStateType(StateType.WA);
                        enterWA();
                      },
                      child: Container(
                        color: Colors.transparent,
                        width: 425 * utilities.width_rate * 0.36,
                        height: 386 * utilities.height_rate * 0.48,
                      ),
                    ),
                  ),
                  Positioned(//NT
                    left: 425 * utilities.width_rate * 0.39,
                    top: 386 * utilities.height_rate * 0,
                    child:
                    GestureDetector(
                      child:
                      Container(
                        color: Colors.transparent,
                        width: 425 * utilities.width_rate * 0.23,
                        height: 386 * utilities.height_rate * 0.43,
                      ),
                      onTap: (){
                        enterNT();
                        utilities.userSelected = true;
                        utilities.setDistributorState(DistributorState.NT);
                        utilities.setStateType(StateType.NT);
                        utilities.setMapState(MapState.REGULATED);
                        setState(() {
                          mapState = MapState.REGULATED;
                        });
                      },
                    ),
                  ),
                  Positioned(
                      left: 425 * utilities.width_rate * 0.69,
                      top: 386 * utilities.height_rate * 0.7,
                      child:
                      GestureDetector(
                        onTap: () {
                          utilities.setStateType(StateType.VIC);
                          enterVIC();
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: 425 * utilities.width_rate * 0.20,
                          height: 386 * utilities.height_rate * 0.15,),
                      )
                  ),
                  Positioned(
                      left: 425 * utilities.width_rate * 0.7,
                      top: 386 * utilities.height_rate * 0.52,
                      child:
                      GestureDetector(
                        onTap: () {
                          utilities.setStateType(StateType.NSW);
                          enterNSW();
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: 425 * utilities.width_rate * 0.27,
                          height: 386 * utilities.height_rate * 0.21,),
                      )
                  ),
                  Positioned(
                      left: 425 * utilities.width_rate * 0.63,
                      top: 386 * utilities.height_rate * 0.0,
                      child:
                      GestureDetector(
                        onTap: () {
                          utilities.setStateType(StateType.QLD);
                          enterQLD();
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: 425 * utilities.width_rate * 0.51,
                          height: 386 * utilities.height_rate * 0.45,),
                      )
                  ),
                  Positioned(
                    left: 425 * utilities.width_rate * 0.74,
                    top: 386 * utilities.height_rate * 0.88,
                    child:
                    GestureDetector(
                      onTap: () {
                        utilities.userSelected = true;
                        utilities.setStateType(StateType.TAS);
                        utilities.setMapState(MapState.SELECTED);
                        utilities.setDistributorState(DistributorState.TASNETWORK);
                        enterTASNetworkTAS();
                        packageNotifier.value.distributorState= DistributorState.TASNETWORK;
                        packageNotifier.notifyListeners();
                      },
                      child:
                      Container(
                        color: Colors.transparent,
                        width: 425 * utilities.width_rate * 0.16,
                        height: 386 * utilities.height_rate * 0.12,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 425 * utilities.width_rate * 0.39,
                    top: 386 * utilities.height_rate * 0.44,
                    child:
                    GestureDetector(
                      onTap: () {
                        utilities.userSelected = true;
                        utilities.setStateType(StateType.SA);
                        utilities.setMapState(MapState.SELECTED);
                        utilities.setDistributorState(DistributorState.SAPOWER);
                        enterSAPowerSA();
                        packageNotifier.value.distributorState= DistributorState.SAPOWER;
                        packageNotifier.notifyListeners();
                      },
                      child:
                      Container(
                        color: Colors.transparent,
                        width: 425 * utilities.width_rate * 0.30,
                        height: 386 * utilities.height_rate * 0.36,
                      ),
                    ),
                  ),


                ]
            )
        );
        break;
      case MapState.WA:
        mapArea = Container(
            margin: EdgeInsets.only(left: 95 * utilities.width_rate),
            height: 350 * utilities.height_rate,
            width: 350 * utilities.width_rate,
            child: Stack(
                children: <Widget>[
                  Container(
                    height: 350 * utilities.height_rate,
                    width: 350 * utilities.width_rate,
                    child:
                    WAHorizonAsset,
                  ),
                  Positioned(
                    left: 350 * utilities.width_rate * 0.232,
                    top: 350 * utilities.height_rate * 0.096,
                    child:
                    MouseRegion(
                        child: Container(
                          width: 350 * utilities.width_rate * 0.614,
                          height: 350 * utilities.height_rate * 0.630,
                        ),
                        onEnter: (e) {
                          setState(() {
                            WAHorizonAsset = ImageLoaderState.WAHorizonSelectedPngLOAD;
                          });
                        },
                        onExit: (e) {
                          setState(() {
                            WAHorizonAsset = ImageLoaderState.WAHorizonPngLOAD;
                          });
                        }
                    ),
                  ),

                  // Synergy = SWIS
                  Container(
                    height: 350 * utilities.height_rate,
                    width: 350 * utilities.width_rate,
                    child:
                    WASynergyAsset,
                  ),
                  Positioned(
                    left: 350 * utilities.width_rate * 0.233,
                    top: 350 * utilities.height_rate * 0.732,
                    child:
                    MouseRegion(
                        child: Container(
                          width: 350 * utilities.width_rate * 0.228,
                          height: 350 * utilities.height_rate * 0.252,
                        ),
                        onEnter: (e) {
                          setState(() {
                            WASynergyAsset = ImageLoaderState.WASynergySelectedPngLOAD;
                          });
                        },
                        onExit: (e) {
                          setState(() {
                            WASynergyAsset =ImageLoaderState. WASynergyPngLOAD;
                          });
                        }
                    ),
                  ),

                  Positioned(
                    left: 350 * utilities.width_rate * 0.232,
                    top: 350 * utilities.height_rate * 0.096,
                    child:
                    GestureDetector(
                        child: Container(
                          color: Colors.transparent,
                          width: 350 * utilities.width_rate * 0.614,
                          height: 350 * utilities.height_rate * 0.630,
                        ),
                        onTap: (){
                          utilities.userSelected = true;
                          utilities.setDistributorState(DistributorState.SYNERGY);
                          utilities.setMapState(MapState.REGULATED);
                          setState(() {
                            barTwo = Container(
                              width: 195.27*utilities.width_rate,
                              height: 50*utilities.height_rate,
                              child: Stack(
                                alignment: Alignment.topLeft,
                                children: <Widget>[
                                  RichText(
                                      text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "",
                                              style: TextStyle(
                                                  color: Color(0xff666F80),
                                                  height: 2.37,
                                                  fontFamily: "MontserratMedium",
                                                  fontSize: 17*utilities.width_rate
                                              ),
                                            )
                                          ]
                                      )
                                  ),

                                  Positioned(
                                    top: 40*utilities.height_rate,
                                    child: Container(
                                      width: 195.72*utilities.width_rate,
                                      child: Image.asset(stageBarBlackPng),
                                    ),
                                  )
                                ],
                              ),
                            );
                            mapState = MapState.REGULATED;
                          });
                        },
                    ),
                  ),

                  Positioned(
                    left: 350 * utilities.width_rate * 0.233,
                    top: 350 * utilities.height_rate * 0.732,
                    child:
                    GestureDetector(
                        child: Container(
                          color: Colors.transparent,
                          width: 350 * utilities.width_rate * 0.228,
                          height: 350 * utilities.height_rate * 0.252,
                        ),
                      onTap: (){
                        utilities.userSelected = true;
                        utilities.setDistributorState(DistributorState.HORIZON);
                        utilities.setMapState(MapState.UNDER_REVIEW);
                        setState(() {
                          barTwo = Container(
                            width: 195.27*utilities.width_rate,
                            height: 50*utilities.height_rate,
                            child: Stack(
                              alignment: Alignment.topLeft,
                              children: <Widget>[
                                RichText(
                                    text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "",
                                            style: TextStyle(
                                                color: Color(0xff666F80),
                                                height: 2.37,
                                                fontFamily: "MontserratMedium",
                                                fontSize: 17*utilities.width_rate
                                            ),
                                          )
                                        ]
                                    )
                                ),

                                Positioned(
                                  top: 40*utilities.height_rate,
                                  child: Container(
                                    width: 195.72*utilities.width_rate,
                                    child: Image.asset(stageBarBlackPng),
                                  ),
                                )
                              ],
                            ),
                          );
                           mapState = MapState.UNDER_REVIEW;
                        });
                      },
                    ),
                  ),

                ]
            )
        );
        break;
      case MapState.QLD:
        mapArea = Container(
            margin: EdgeInsets.only(left: 95 * utilities.width_rate),
            height: 350 * utilities.height_rate,
            width: 350 * utilities.width_rate,
            child:
            Stack(
              children: <Widget>[
                Container(
                  height: 350 * utilities.height_rate,
                  width: 350 * utilities.width_rate,
                  child:
                  QLDEnergexAsset,
                ),
                Container(
                  height: 350 * utilities.height_rate,
                  width: 350 * utilities.width_rate,
                  child:
                  QLDErgonAsset,
                ),

                Positioned(
                  left: 350 * utilities.width_rate * 0.190,
                  top: 350 * utilities.height_rate * 0.036,
                  child:
                  MouseRegion(
                      child: Container(
                        width: 350 * utilities.width_rate * 0.218,
                        height: 350 * utilities.height_rate * 0.725,
                      ),
                      onEnter: (e) {
                        setState(() {
                          QLDEnergexAsset = ImageLoaderState.QLDEnergexGreenPngLOAD;
                        });
                      },
                      onExit: (e) {
                        setState(() {
                          QLDEnergexAsset = ImageLoaderState.QLDEnergexPngLOAD;
                        });
                      }
                  ),
                ),
                Positioned(
                  left: 350 * utilities.width_rate * 0.420,
                  top: 350 * utilities.height_rate * 0.346,
                  child:
                  MouseRegion(
                      child: Container(
                        width: 350 * utilities.width_rate * 0.394,
                        height: 350 * utilities.height_rate * 0.564,
                      ),
                      onEnter: (e) {
                        setState(() {
                          QLDErgonAsset = ImageLoaderState.QLDErgonGreenPngLOAD;
                        });
                      },
                      onExit: (e) {
                        setState(() {
                          QLDErgonAsset = ImageLoaderState.QLDErgonPngLOAD;
                        });
                      }
                  ),
                ),

                //Gesture dectors
                Positioned(//auznet
                  left: 350 * utilities.width_rate * 0.190,
                  top: 350 * utilities.height_rate * 0.036,
                  child:
                  GestureDetector(
                    child: Container(
                      color: Colors.transparent,
                      width: 350 * utilities.width_rate * 0.218,
                      height: 350 * utilities.height_rate * 0.725,
                    ),
                    onTap: () {
                      utilities.userSelected = true;
                      utilities.setDistributorState(DistributorState.ENERGEX);
                      utilities.setMapState(MapState.SELECTED);
                      enterEnergyxQLD();
                      packageNotifier.value.distributorState= DistributorState.ENERGEX;
                      packageNotifier.notifyListeners();
                    },
                  ),
                ),
                Positioned(
                  left: 350 * utilities.width_rate * 0.420,
                  top: 350 * utilities.height_rate * 0.346,
                  child:
                  GestureDetector(
                    child: Container(
                      color: Colors.transparent,
                      width: 350 * utilities.width_rate * 0.394,
                      height: 350 * utilities.height_rate * 0.564,
                    ),
                    onTap: () {
                      utilities.userSelected = true;
                      utilities.setDistributorState(DistributorState.ERGON);
                      utilities.setMapState(MapState.SELECTED);
                      enterErgonQLD();
                      packageNotifier.value.distributorState= DistributorState.ERGON;
                      packageNotifier.notifyListeners();
                    },
                  ),
                ),
            ]
            )
        );
        break;
      case MapState.SA:
        mapArea = Container();
        break;
      case MapState.TAS:
        mapArea = Container();
        break;
      case MapState.VIC:
        mapArea = Container(
            margin: EdgeInsets.only(left: 95 * utilities.width_rate),
            height: 350 * utilities.height_rate,
            width: 350 * utilities.width_rate,
            child: VICEnlarged ?
            Stack(
              children: <Widget>[
                Container(
                  height: 350 * utilities.height_rate,
                  width: 350 * utilities.width_rate,
                  child:
                  VICAuznetLAsset,
                ),
                Container(
                  height: 350 * utilities.height_rate,
                  width: 350 * utilities.width_rate,
                  child:
                  VICCitypowerLAsset,
                ),
                Container(
                  height: 350 * utilities.height_rate,
                  width: 350 * utilities.width_rate,
                  child:
                  VICJenemaLAsset,
                ),
                Container(
                  height: 350 * utilities.height_rate,
                  width: 350 * utilities.width_rate,
                  child:
                  VICPowercorLAsset,
                ),
                Container(
                  height: 350 * utilities.height_rate,
                  width: 350 * utilities.width_rate,
                  child:
                  VICUnitedLAsset,
                ),

                Positioned(
                  left: 350 * utilities.width_rate * 0.622,
                  top: 350 * utilities.height_rate * 0.118,
                  child:
                  MouseRegion(
                      child: Container(
                        width: 350 * utilities.width_rate * 0.358,
                        height: 350 * utilities.height_rate * 0.746,
                      ),
                      onEnter: (e) {
                        setState(() {
                          VICAuznetLAsset = ImageLoaderState.VICenlargedGreenAuzNetPngLOAD;
                        });
                      },
                      onExit: (e) {
                        setState(() {
                          VICAuznetLAsset = ImageLoaderState.VICenlargedWhiteAuzNetPngLOAD;
                        });
                      }
                  ),
                ),
                Positioned(
                  left: 350 * utilities.width_rate * 0.480,
                  top: 350 * utilities.height_rate * 0.487,
                  child:
                  MouseRegion(
                      child: Container(
                        width: 350 * utilities.width_rate * 0.1,
                        height: 350 * utilities.height_rate * 0.091,
                      ),
                      onEnter: (e) {
                        setState(() {
                          VICCitypowerLAsset = ImageLoaderState.VICenlargedGreenCityPowerPngLOAD;
                        });
                      },
                      onExit: (e) {
                        setState(() {
                          VICCitypowerLAsset = ImageLoaderState.VICenlargedWhiteCityPowerPngLOAD;
                        });
                      }
                  ),
                ),
                Positioned(
                  left: 350 * utilities.width_rate * 0.352,
                  top: 350 * utilities.height_rate * 0.368,
                  child:
                  MouseRegion(
                      child: Container(
                        width: 350 * utilities.width_rate * 0.176,
                        height: 350 * utilities.height_rate * 0.120,
                      ),
                      onEnter: (e) {
                        setState(() {
                          VICJenemaLAsset = ImageLoaderState.VICenlargedGreenJenemaPngLOAD;
                        });
                      },
                      onExit: (e) {
                        setState(() {
                          VICJenemaLAsset = ImageLoaderState.VICenlargedWhiteJenemaPngLOAD;
                        });
                      }
                  ),
                ),
                Positioned(
                  left: 350 * utilities.width_rate * 0.028,
                  top: 350 * utilities.height_rate * 0.118,
                  child:
                  MouseRegion(
                      child: Container(
                        width: 350 * utilities.width_rate * 0.322,
                        height: 350 * utilities.height_rate * 0.738,
                      ),
                      onEnter: (e) {
                        setState(() {
                          VICPowercorLAsset = ImageLoaderState.VICenlargedGreenPowercorPngLOAD;
                        });
                      },
                      onExit: (e) {
                        setState(() {
                          VICPowercorLAsset = ImageLoaderState.VICenlargedWhitePowercorPngLOAD;
                        });
                      }
                  ),
                ),
                Positioned(
                  left: 350 * utilities.width_rate * 0.408,
                  top: 350 * utilities.height_rate * 0.584,
                  child:
                  MouseRegion(
                      child: Container(
                        width: 350 * utilities.width_rate * 0.214,
                        height: 350 * utilities.height_rate * 0.280,
                      ),
                      onEnter: (e) {
                        setState(() {
                            VICUnitedLAsset = ImageLoaderState.VICenlargedGreenUnitedEnergyLOAD;
                        });
                      },
                      onExit: (e) {
                        setState(() {
                          VICUnitedLAsset = ImageLoaderState.VICenlargedWhiteUnitedEnergyLOAD;
                        });
                      }
                  ),
                ),


                //Gesture dectors
                Positioned(//auznet
                  left: 350 * utilities.width_rate * 0.622,
                  top: 350 * utilities.height_rate * 0.118,
                  child:
                  GestureDetector(
                      child: Container(
                        color: Colors.transparent,
                        width: 350 * utilities.width_rate * 0.358,
                        height: 350 * utilities.height_rate * 0.746,
                      ),
                      onTap: () {
                        utilities.userSelected = true;
                        utilities.setDistributorState(DistributorState.AUSNET);
                        utilities.setMapState(MapState.SELECTED);
                        enterAusnetVIC();
                        packageNotifier.value.distributorState= DistributorState.AUSNET;
                        packageNotifier.notifyListeners();
                      },
                  ),
                ),
                Positioned(
                  left: 350 * utilities.width_rate * 0.480,
                  top: 350 * utilities.height_rate * 0.487,
                  child:
                  GestureDetector(
                      child: Container(
                        color: Colors.transparent,
                        width: 350 * utilities.width_rate * 0.1,
                        height: 350 * utilities.height_rate * 0.091,
                      ),
                    onTap: () {
                      utilities.userSelected = true;
                      utilities.setDistributorState(DistributorState.CITIPOWER);
                      utilities.setMapState(MapState.SELECTED);
                      enterCitipowerVIC();
                      packageNotifier.value.distributorState= DistributorState.CITIPOWER;
                      packageNotifier.notifyListeners();
                    },
                  ),
                ),
                Positioned(
                  left: 350 * utilities.width_rate * 0.352,
                  top: 350 * utilities.height_rate * 0.368,
                  child:
                  GestureDetector(
                      child: Container(
                        color: Colors.transparent,
                        width: 350 * utilities.width_rate * 0.176,
                        height: 350 * utilities.height_rate * 0.120,
                      ),
                    onTap: () {
                      utilities.userSelected = true;
                      utilities.setDistributorState(DistributorState.JEMANA);
                      utilities.setMapState(MapState.SELECTED);
                      enterJemenaVIC();
                      packageNotifier.value.distributorState= DistributorState.JEMANA;
                      packageNotifier.notifyListeners();
                    }
                  ),
                ),
                Positioned(
                  left: 350 * utilities.width_rate * 0.028,
                  top: 350 * utilities.height_rate * 0.118,
                  child:
                  GestureDetector(
                      child: Container(
                        color: Colors.transparent,
                        width: 350 * utilities.width_rate * 0.322,
                        height: 350 * utilities.height_rate * 0.738,
                      ),
                    onTap: () {
                      utilities.userSelected = true;
                      utilities.setDistributorState(DistributorState.POWERCOR);
                      utilities.setMapState(MapState.SELECTED);
                      enterPowercorVIC();
                      packageNotifier.value.distributorState= DistributorState.POWERCOR;
                      packageNotifier.notifyListeners();
                    },
                  ),
                ),
                Positioned(
                  left: 350 * utilities.width_rate * 0.408,
                  top: 350 * utilities.height_rate * 0.584,
                  child:
                  GestureDetector(
                      child: Container(
                        color: Colors.transparent,
                        width: 350 * utilities.width_rate * 0.214,
                        height: 350 * utilities.height_rate * 0.280,
                      ),
                    onTap: () {
                      utilities.userSelected = true;
                      utilities.setDistributorState(DistributorState.UNITEDENERGY);
                      utilities.setMapState(MapState.SELECTED);
                      enterUnitedenergyVIC();
                      packageNotifier.value.distributorState= DistributorState.UNITEDENERGY;
                      packageNotifier.notifyListeners();
                    },
                  ),
                ),
              ],
            )
                :
            Stack(
                children: <Widget>[
                  Container(
                    height: 350 * utilities.height_rate,
                    width: 350 * utilities.width_rate,
                    child:
                    VICAuznetAsset,
                  ),
                  Container(
                    height: 350 * utilities.height_rate,
                    width: 350 * utilities.width_rate,
                    child:
                    VICPowercorAsset,
                  ),
                  Container(
                    height: 350 * utilities.height_rate,
                    width: 350 * utilities.width_rate,
                    child:
                    VICJemenaAsset,
                  ),
                  Container(
                    height: 350 * utilities.height_rate,
                    width: 350 * utilities.width_rate,
                    child:
                    VICUnitedEnergyAsset,
                  ),
                  Container(
                    height: 350 * utilities.height_rate,
                    width: 350 * utilities.width_rate,
                    child:
                    VICCitipowerAsset,
                  ),
                  Positioned(
                    left: 350 * utilities.width_rate * 0.023,
                    top: 350 * utilities.height_rate * 0.163,
                    child:
                    MouseRegion(
                        child: Container(
                          width: 350 * utilities.width_rate * 0.384,
                          height: 350 * utilities.height_rate * 0.554,
                        ),
                        onEnter: (e) {
                          setState(() {
                            VICPowercorAsset = ImageLoaderState.VICnormalGreenPowercorPngLOAD;
                          });
                        },
                        onExit: (e) {
                          setState(() {
                            VICPowercorAsset = ImageLoaderState.VICnormalWhitePowercorPngLOAD;
                          });
                        }
                    ),
                  ),
                  Positioned(
                    left: 350 * utilities.width_rate * 0.502,
                    top: 350 * utilities.height_rate * 0.419,
                    child:
                    MouseRegion(
                        child: Container(
                          width: 350 * utilities.width_rate * 0.441,
                          height: 350 * utilities.height_rate * 0.366,
                        ),
                        onEnter: (e) {
                          setState(() {
                            VICAuznetAsset = ImageLoaderState.VICnormalGreenAuzNetPngLOAD;
                          });
                        },
                        onExit: (e) {
                          setState(() {
                            VICAuznetAsset = ImageLoaderState.VICnormalWhiteAuzNetPngLOAD;
                          });
                        }
                    ),
                  ),
                  Positioned(
                    left: 350 * utilities.width_rate * 0.410,
                    top: 350 * utilities.height_rate * 0.516,
                    child:
                    MouseRegion(
                      child: Container(
                        width: 350 * utilities.width_rate * 0.088,
                        height: 350 * utilities.height_rate * 0.234,
                      ),
                      onEnter: (e) {
                        setState(() {
                          VICJemenaAsset = ImageLoaderState.VICnormalGreenJenemaPngLOAD;
                          VICCitipowerAsset = ImageLoaderState.VICnormalGreenCityPowerPngLOAD;
                          VICUnitedEnergyAsset = ImageLoaderState.VICnormalGreenUnitedEnergyLOAD;
                        });
                      },
                      onExit: (e) {
                        setState(() {
                          VICJemenaAsset = ImageLoaderState.VICnormalWhiteJenemaPngLOAD;
                          VICCitipowerAsset = ImageLoaderState.VICnormalWhiteCityPowerPngLOAD;
                          VICUnitedEnergyAsset = ImageLoaderState.VICnormalWhiteUnitedEnergyLOAD;
                        });
                      },
                    ),
                  ),

                  //Three Gesture detectors
                  Positioned(
                    left: 350 * utilities.width_rate * 0.023,
                    top: 350 * utilities.height_rate * 0.163,
                    child:
                    GestureDetector(
                      child: Container(
                        color: Colors.transparent,
                        width: 350 * utilities.width_rate * 0.384,
                        height: 350 * utilities.height_rate * 0.554,
                      ),
                      onTap: (){
                        utilities.userSelected = true;
                        utilities.setDistributorState(DistributorState.POWERCOR);
                        utilities.setMapState(MapState.SELECTED);
                        enterPowercorVIC();
                        packageNotifier.value.distributorState= DistributorState.POWERCOR;
                        packageNotifier.notifyListeners();
                        }),
                  ),
                  Positioned(
                    left: 350 * utilities.width_rate * 0.410,
                    top: 350 * utilities.height_rate * 0.516,
                    child:
                    GestureDetector(
                      child: Container(
                        color: Colors.transparent,
                        width: 350 * utilities.width_rate * 0.088,
                        height: 350 * utilities.height_rate * 0.234,
                      ),
                      onTap: () {
                          VICEnlarged = true;
                      },
                    ),
                  ),
                  Positioned(
                    left: 350 * utilities.width_rate * 0.502,
                    top: 350 * utilities.height_rate * 0.419,
                    child:
                    GestureDetector(
                        child: Container(
                          color: Colors.transparent,
                          width: 350 * utilities.width_rate * 0.441,
                          height: 350 * utilities.height_rate * 0.366,
                        ),
                        onTap: (){
                          utilities.userSelected = true;
                          utilities.setDistributorState(DistributorState.AUSNET);
                          utilities.setMapState(MapState.SELECTED);
                          enterAusnetVIC();
                          packageNotifier.value.distributorState= DistributorState.AUSNET;
                          packageNotifier.notifyListeners();
                        },
                    ),
                  ),
                ]
            )
        );
        break;
      case MapState.NSW:
        mapArea = Container(
            margin: EdgeInsets.only(left: 95 * utilities.width_rate),
            height: 350 * utilities.height_rate,
            width: 350 * utilities.width_rate,
            child:
            Stack(
                children: <Widget>[
                  Container(
                    height: 350 * utilities.height_rate,
                    width: 350 * utilities.width_rate,
                    child:
                    NSWAugridAsset,
                  ),
                  Container(
                    height: 350 * utilities.height_rate,
                    width: 350 * utilities.width_rate,
                    child:
                    NSWEndeavourAsset,
                  ),
                  Container(
                    height: 350 * utilities.height_rate,
                    width: 350 * utilities.width_rate,
                    child:
                    NSWEssentialAsset,
                  ),
                  Container(
                    height: 350 * utilities.height_rate,
                    width: 350 * utilities.width_rate,
                    child:
                    NSWEvoAsset,
                  ),


                  Positioned(
                    left: 350 * utilities.width_rate * 0.699,
                    top: 350 * utilities.height_rate * 0.368,
                    child:
                    MouseRegion(
                        child: Container(
                          width: 350 * utilities.width_rate * 0.178,
                          height: 350 * utilities.height_rate * 0.146,
                        ),
                        onEnter: (e) {
                          setState(() {
                            NSWAugridAsset = ImageLoaderState.NSWAusgridGreenPngLOAD;
                          });
                        },
                        onExit: (e) {
                          setState(() {
                            NSWAugridAsset = ImageLoaderState.NSWAusgridPngLOAD;
                          });
                        }
                    ),
                  ),
                  Positioned(
                    left: 350 * utilities.width_rate * 0.040,
                    top: 350 * utilities.height_rate * 0.152,
                    child:
                    MouseRegion(
                        child: Container(
                          width: 350 * utilities.width_rate * 0.644,
                          height: 350 * utilities.height_rate * 0.536,
                        ),
                        onEnter: (e) {
                          setState(() {
                            NSWEssentialAsset = ImageLoaderState.NSWEssentialGreenPngLOAD;
                          });
                        },
                        onExit: (e) {
                          setState(() {
                            NSWEssentialAsset =  ImageLoaderState.NSWEssentialPngLOAD;
                          });
                        }
                    ),
                  ),
                  Positioned(
                    left: 350 * utilities.width_rate * 0.693,
                    top: 350 * utilities.height_rate * 0.507,
                    child:
                    MouseRegion(
                        child: Container(
                          width: 350 * utilities.width_rate * 0.102,
                          height: 350 * utilities.height_rate * 0.244,
                        ),
                        onEnter: (e) {
                          setState(() {
                            NSWEndeavourAsset =ImageLoaderState.NSWEndeavourGreenPngLOAD ;
                          });
                        },
                        onExit: (e) {
                          setState(() {
                            NSWEndeavourAsset =  ImageLoaderState.NSWEndeavourPngLOAD;
                          });
                        }
                    ),
                  ),
                  Positioned(
                    left: 350 * utilities.width_rate * 0.586,
                    top: 350 * utilities.height_rate * 0.688,
                    child:
                    MouseRegion(
                        child: Container(
                          width: 350 * utilities.width_rate * 0.104,
                          height: 350 * utilities.height_rate * 0.112,
                        ),
                        onEnter: (e) {
                          setState(() {
                            NSWEvoAsset =ImageLoaderState.NSWEvoGreenPngLOAD ;
                          });
                        },
                        onExit: (e) {
                          setState(() {
                            NSWEvoAsset =  ImageLoaderState.NSWEvoPngLOAD;
                          });
                        }
                    ),
                  ),

                  //Gesture dectors
                  Positioned(//auznet
                    left: 350 * utilities.width_rate * 0.699,
                    top: 350 * utilities.height_rate * 0.368,
                    child:
                    GestureDetector(
                      child: Container(
                        color: Colors.transparent,
                        width: 350 * utilities.width_rate * 0.178,
                        height: 350 * utilities.height_rate * 0.146,
                      ),
                      onTap: () {
                        utilities.userSelected = true;
                        utilities.setDistributorState(DistributorState.AUSGRID);
                        utilities.setMapState(MapState.SELECTED);
                        enterAusgridNSW();
                        packageNotifier.value.distributorState= DistributorState.AUSGRID;
                        packageNotifier.notifyListeners();
                      },
                    ),
                  ),
                  Positioned(
                    left: 350 * utilities.width_rate * 0.040,
                    top: 350 * utilities.height_rate * 0.152,
                    child:
                    GestureDetector(
                      child: Container(
                        color: Colors.transparent,
                        width: 350 * utilities.width_rate * 0.644,
                        height: 350 * utilities.height_rate * 0.536,
                      ),
                      onTap: () {
                        utilities.userSelected = true;
                        utilities.setDistributorState(DistributorState.ESSENTIALENERGY);
                        utilities.setMapState(MapState.SELECTED);
                        enterEssentialNSW();
                        packageNotifier.value.distributorState= DistributorState.ESSENTIALENERGY;
                        packageNotifier.notifyListeners();
                      },
                    ),
                  ),
                  Positioned(
                    left: 350 * utilities.width_rate * 0.693,
                    top: 350 * utilities.height_rate * 0.507,
                    child:
                    GestureDetector(
                      child: Container(
                        color: Colors.transparent,
                        width: 350 * utilities.width_rate * 0.102,
                        height: 350 * utilities.height_rate * 0.244,
                      ),
                      onTap: () {
                        utilities.userSelected = true;
                        utilities.setDistributorState(DistributorState.ENDEVOUR);
                        utilities.setMapState(MapState.SELECTED);
                        enterEndeavourNSW();
                        packageNotifier.value.distributorState= DistributorState.ENDEVOUR;
                        packageNotifier.notifyListeners();
                      },
                    ),
                  ),
                  Positioned(
                    left: 350 * utilities.width_rate * 0.586,
                    top: 350 * utilities.height_rate * 0.688,
                    child:
                    GestureDetector(
                      child: Container(
                        color: Colors.transparent,
                        width: 350 * utilities.width_rate * 0.104,
                        height: 350 * utilities.height_rate * 0.112,
                      ),
                      onTap: () {
                        utilities.userSelected = true;
                        utilities.setDistributorState(DistributorState.EVOENERGY);
                        utilities.setMapState(MapState.SELECTED);
                        enterEvoEnergyNSW();
                        packageNotifier.value.distributorState= DistributorState.EVOENERGY;
                        packageNotifier.notifyListeners();
                      },
                    ),
                  ),

                ]
            )
        );
        break;
      case MapState.NT:
        mapArea = Container();
        break;
      case MapState.SELECTED:
        mapArea = Container(
            height: 650 * utilities.height_rate,
            width: 650 * utilities.width_rate,
            child:  packageNotifier.value.planType == PlanType.ONCE_OFF ?
                //onceoff
            Stack(
              children: <Widget>[
                Positioned(
                  top: 23*utilities.height_rate,
                  left: 111*utilities.width_rate,
                  child: Container(
                    width: 400 * utilities.width_rate,
                    height: 400*0.743 * utilities.height_rate,
                    child: ImageLoaderState.onceoffChartPngLOAD,
                  ),
                ),

                Positioned(
                  left: 7*utilities.width_rate,
                  top: 13*utilities.width_rate,
                  child: Container(
                    width: 96*utilities.width_rate,
                    height: 32*utilities.height_rate,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          child: Image.asset(greenBubbleChartPng),
                        ),
                        Positioned(
                          child: Text(
                            "Once-off",
                            style: (
                              TextStyle(
                                fontFamily: "MontserratSemibold",
                                fontSize: 14*utilities.width_rate,
                                height: 2.29,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              )
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Positioned(
                  left: 13*utilities.width_rate,
                  top: 67*utilities.width_rate,
                  child: Container(
                          child: Text(
                            "Best competitor",
                            style: (
                                TextStyle(
                                  fontFamily: "MontserratSemibold",
                                  fontSize: 14*utilities.width_rate,
                                  height: 2.29,
                                  color: Color(0xffED7828),
                                  fontWeight: FontWeight.w600,
                                )
                            ),
                          )
                  ),
                ),

                Positioned(
                  left: 510*utilities.width_rate,
                  top: 67*utilities.width_rate,
                  child: Container(
                    child: Text(
                      "\$"+bestCompetitorMonthlyCostString,
                      style: (
                          TextStyle(
                            fontFamily: "MontserratSemibold",
                            fontSize: 15*utilities.width_rate,
                            height: 2.13,
                            color: Color(0xffED7828),
                            fontWeight: FontWeight.w600,
                          )
                      ),
                    )
                ),
                ),

                Positioned(
                  left: 227*utilities.width_rate,
                  top: 10*utilities.width_rate,
                  child: Text(
                    "\$"+firstYearMonthlyCostString,
                    style: (
                        TextStyle(
                          fontFamily: "MontserratSemibold",
                          fontSize: 15*utilities.width_rate,
                          height: 2.13,
                          color: Color(0xff78A11B),
                          fontWeight: FontWeight.w600,
                        )
                    ),
                  ),
                ),

                Positioned(
                  left: 510*utilities.width_rate,
                  top: 113*utilities.width_rate,
                  child: Container(
                      child: Text(
                        "\$"+otherPlanMonthlyCostString,
                        style: (
                            TextStyle(
                              fontFamily: "MontserratSemibold",
                              fontSize: 15*utilities.width_rate,
                              height: 2.13,
                              color: Color(0xffC9D9A4),
                              fontWeight: FontWeight.w600,
                            )
                        ),
                      )
                  ),
                ),

                Positioned(
                  left: 7*utilities.width_rate,
                  top: 113*utilities.width_rate,
                  child: Container(
                    width: 86*utilities.width_rate,
                    height: 32*utilities.height_rate,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          child: Image.asset(holoBubbleChartPng),
                        ),
                        Positioned(
                          child: Text(
                            "Weekly",
                            style: (
                                TextStyle(
                                  fontFamily: "MontserratSemibold",
                                  fontSize: 14*utilities.width_rate,
                                  height: 2.29,
                                  color: Color(0xffC9D9A4),
                                  fontWeight: FontWeight.w600,
                                )
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Positioned(
                  left: 510*utilities.width_rate,
                  top: 207*utilities.width_rate,
                  child: Container(
                      child: Text(
                        "\$"+currentPlanMonthlyCostString,
                        style: (
                            TextStyle(
                              fontFamily: "MontserratSemibold",
                              fontSize: 15*utilities.width_rate,
                              height: 2.13,
                              color: Color(0xff78A11B),
                              fontWeight: FontWeight.w600,
                            )
                        ),
                      )
                  ),
                ),

                //Year123
                Positioned(
                  left: 230*utilities.width_rate,
                  top: 245*utilities.width_rate,
                  child: Container(
                      child: Text(
                        "year 1",
                        style: (
                            TextStyle(
                              fontFamily: "MontserratRegular",
                              fontSize: 15*utilities.width_rate,
                              height: 2.13,
                              color: Color(0xff666F80),
                            )
                        ),
                      )
                  ),
                ),
                Positioned(
                  left: 380*utilities.width_rate,
                  top: 245*utilities.width_rate,
                  child: Container(
                      child: Text(
                        "year 2",
                        style: (
                            TextStyle(
                              fontFamily: "MontserratRegular",
                              fontSize: 15*utilities.width_rate,
                              height: 2.13,
                              color: Color(0xff666F80),
                            )
                        ),
                      )
                  ),
                ),
                Positioned(
                  left: 500*utilities.width_rate,
                  top: 245*utilities.width_rate,
                  child: Container(
                      child: Text(
                        "year 3",
                        style: (
                            TextStyle(
                              fontFamily: "MontserratRegular",
                              fontSize: 15*utilities.width_rate,
                              height: 2.13,
                              color: Color(0xff666F80),
                            )
                        ),
                      )
                  ),
                ),
                //100% green energy
                Positioned(
                  left: 135*utilities.width_rate,
                  top: 290*utilities.width_rate,
                  child: Container(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(height: 1.88),
                          children: [
                            TextSpan(text:"100% green energy ",
                            style: TextStyle(
                              fontFamily: "MontserratSemibold",
                              fontSize: 15*utilities.width_rate,
                              color: Color(0xff78A11B),
                            )),
                            TextSpan(text:"and prices that make sense",
                            style: TextStyle(
                              fontFamily: "MontserratRegular",
                              fontSize: 15*utilities.width_rate,
                              color: Color(0xff666F80),
                            )),
                          ]
                        )

                      )
                  ),
                ),
                //Monthly Estimate
                Positioned(
                  left: 515*utilities.width_rate,
                  top: 150*utilities.width_rate,
                  child: Transform.rotate(
                    angle: pi/2,
                    child: Container(
                        child: Text(
                          "Monthly Estimate",
                          style: (
                              TextStyle(
                                fontFamily: "MontserratRegular",
                                fontSize: 18*utilities.width_rate,
                                height: 1.88,
                                color: Color(0xff666F80),
                              )
                          ),
                        )
                    ),
                  ),
                ),
              ],
            )
                :
            Stack(
              children: <Widget>[
                Positioned(
                  top: 23*utilities.height_rate,
                  left: 111*utilities.width_rate,
                  child: Container(
                    width: 400 * utilities.width_rate,
                    height: 400*0.743 * utilities.height_rate,
                    child: ImageLoaderState.weeklyChartPngLOAD,
                  ),
                ),

                Positioned(
                  left: 7*utilities.width_rate,
                  top: 13*utilities.width_rate,
                  child: Container(
                    width: 96*utilities.width_rate,
                    height: 32*utilities.height_rate,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          child: Image.asset(greenBubbleChartWEEKLYPng),
                        ),
                        Positioned(
                          child: Text(
                            "Once-off",
                            style: (
                                TextStyle(
                                  fontFamily: "MontserratSemibold",
                                  fontSize: 14*utilities.width_rate,
                                  height: 2.29,
                                  color: Color(0xffC9D9A4),
                                  fontWeight: FontWeight.w600,
                                )
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Positioned(
                  left: 13*utilities.width_rate,
                  top: 67*utilities.width_rate,
                  child: Container(
                      child: Text(
                        "Best competitor",
                        style: (
                            TextStyle(
                              fontFamily: "MontserratSemibold",
                              fontSize: 14*utilities.width_rate,
                              height: 2.29,
                              color: Color(0xffED7828),
                              fontWeight: FontWeight.w600,
                            )
                        ),
                      )
                  ),
                ),

                Positioned(
                  left: 510*utilities.width_rate,
                  top: 67*utilities.width_rate,
                  child: Container(
                      child: Text(
                        "\$"+bestCompetitorMonthlyCostString,
                        style: (
                            TextStyle(
                              fontFamily: "MontserratSemibold",
                              fontSize: 15*utilities.width_rate,
                              height: 2.13,
                              color: Color(0xffED7828),
                              fontWeight: FontWeight.w600,
                            )
                        ),
                      )
                  ),
                ),

                Positioned(
                  left: 227*utilities.width_rate,
                  top: 10*utilities.width_rate,
                  child: Text(
                    "\$"+firstYearMonthlyCostString,
                    style: (
                        TextStyle(
                          fontFamily: "MontserratSemibold",
                          fontSize: 15*utilities.width_rate,
                          height: 2.13,
                          color: Color(0xffC9D9A4),
                          fontWeight: FontWeight.w600,
                        )
                    ),
                  ),
                ),

                Positioned(
                  left: 510*utilities.width_rate,
                  top: 113*utilities.width_rate,
                  child: Container(
                      child: Text(
                        "\$"+currentPlanMonthlyCostString,
                        style: (
                            TextStyle(
                              fontFamily: "MontserratSemibold",
                              fontSize: 15*utilities.width_rate,
                              height: 2.13,
                              color: Color(0xff78A11B),
                              fontWeight: FontWeight.w600,
                            )
                        ),
                      )
                  ),
                ),

                Positioned(
                  left: 7*utilities.width_rate,
                  top: 113*utilities.width_rate,
                  child: Container(
                    width: 86*utilities.width_rate,
                    height: 32*utilities.height_rate,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          child: Image.asset(holoBubbleChartWEEKLYPng),
                        ),
                        Positioned(
                          child: Text(
                            "Weekly",
                            style: (
                                TextStyle(
                                  fontFamily: "MontserratSemibold",
                                  fontSize: 14*utilities.width_rate,
                                  height: 2.29,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                )
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Positioned(
                  left: 510*utilities.width_rate,
                  top: 207*utilities.width_rate,
                  child: Container(
                      child: Text(
                        "\$"+otherPlanMonthlyCostString,
                        style: (
                            TextStyle(
                              fontFamily: "MontserratSemibold",
                              fontSize: 15*utilities.width_rate,
                              height: 2.13,
                              color: Color(0xffC9D9A4),
                              fontWeight: FontWeight.w600,
                            )
                        ),
                      )
                  ),
                ),


                //Year123
                Positioned(
                  left: 230*utilities.width_rate,
                  top: 245*utilities.width_rate,
                  child: Container(
                      child: Text(
                        "year 1",
                        style: (
                            TextStyle(
                              fontFamily: "MontserratRegular",
                              fontSize: 15*utilities.width_rate,
                              height: 2.13,
                              color: Color(0xff666F80),
                            )
                        ),
                      )
                  ),
                ),
                Positioned(
                  left: 380*utilities.width_rate,
                  top: 245*utilities.width_rate,
                  child: Container(
                      child: Text(
                        "year 2",
                        style: (
                            TextStyle(
                              fontFamily: "MontserratRegular",
                              fontSize: 15*utilities.width_rate,
                              height: 2.13,
                              color: Color(0xff666F80),
                            )
                        ),
                      )
                  ),
                ),
                Positioned(
                  left: 500*utilities.width_rate,
                  top: 245*utilities.width_rate,
                  child: Container(
                      child: Text(
                        "year 3",
                        style: (
                            TextStyle(
                              fontFamily: "MontserratRegular",
                              fontSize: 15*utilities.width_rate,
                              height: 2.13,
                              color: Color(0xff666F80),
                            )
                        ),
                      )
                  ),
                ),
                //100% green energy
                Positioned(
                  left: 135*utilities.width_rate,
                  top: 290*utilities.width_rate,
                  child: Container(
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(height: 1.88),
                              children: [
                                TextSpan(text:"100% green energy ",
                                    style: TextStyle(
                                      fontFamily: "MontserratSemibold",
                                      fontSize: 15*utilities.width_rate,
                                      color: Color(0xff78A11B),
                                    )),
                                TextSpan(text:"and prices that make sense",
                                    style: TextStyle(
                                      fontFamily: "MontserratRegular",
                                      fontSize: 15*utilities.width_rate,
                                      color: Color(0xff666F80),
                                    )),
                              ]
                          )

                      )
                  ),
                ),
                //Monthly Estimate
                Positioned(
                  left: 515*utilities.width_rate,
                  top: 150*utilities.width_rate,
                  child: Transform.rotate(
                    angle: pi/2,
                    child: Container(
                        child: Text(
                          "Monthly Estimate",
                          style: (
                              TextStyle(
                                fontFamily: "MontserratRegular",
                                fontSize: 18*utilities.width_rate,
                                height: 1.88,
                                color: Color(0xff666F80),
                              )
                          ),
                        )
                    ),
                  ),
                ),
              ],
            )
        );
        break;
      case MapState.REGULATED:
        mapArea = Container(
          padding: EdgeInsets.only(top: 70*utilities.width_rate),
          alignment: Alignment.topCenter,
          height: 650 * utilities.height_rate,
          width: 650 * utilities.width_rate,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                height: 1.7
              ),
              children: [
                TextSpan(
                    text: "We wish we could help, but your location only\nallows ",
                    style: TextStyle(
                        fontFamily: "MontserratRegular",
                        color: Color(0xff666F80),
                        fontSize: 20*utilities.width_rate

                    )
                ),
                TextSpan(
                  text: "state owned ",
                    style: TextStyle(
                        fontFamily: "MontserratSemibold",
                        color: Color(0xff666F80),
                        fontSize: 20*utilities.width_rate
                    )
                ),
                TextSpan(
                  text: "retail. Join our mailing list though,\n",
                    style: TextStyle(
                        fontFamily: "MontserratRegular",
                      color: Color(0xff666F80),
                        fontSize: 20*utilities.width_rate
                    )
                ),
                TextSpan(
                  text: "we have future plans!",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                        fontFamily: "MontserratSemibold",
                      color: Color(0xff78A11B),
                        fontSize: 20*utilities.width_rate
                    )
                )
              ]
            ),
          )
        );
        break;
      case MapState.UNDER_REVIEW:
        mapArea = Container(
            padding: EdgeInsets.only(top: 70*utilities.width_rate),
            alignment: Alignment.topCenter,
            height: 650 * utilities.height_rate,
            width: 650 * utilities.width_rate,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: TextStyle(
                      height: 1.7
                  ),
                  children: [
                    TextSpan(
                        text: "Pricing ",
                        style: TextStyle(
                            fontFamily: "MontserratRegular",
                            color: Color(0xff666F80),
                            fontSize: 20*utilities.width_rate

                        )
                    ),
                    TextSpan(
                        text: "under review",
                        style: TextStyle(
                            fontFamily: "MontserratSemibold",
                            color: Color(0xff666F80),
                            fontSize: 20*utilities.width_rate
                        )
                    ),
                    TextSpan(
                        text: ".\n",
                        style: TextStyle(
                            fontFamily: "MontserratRegular",
                            color: Color(0xff666F80),
                            fontSize: 20*utilities.width_rate
                        )
                    ),
                    TextSpan(
                        text: "Join our mailing list for updates!",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: "MontserratSemibold",
                            color: Color(0xff78A11B),
                            fontSize: 20*utilities.width_rate
                        )
                    )
                  ]
              ),
            )
        );
        break;
    }

    return Container(
      width: 700 * utilities.width_rate,
      height: 570 * utilities.height_rate,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            top: 122 * utilities.height_rate,
            left: 0 * utilities.width_rate,
            child: mapArea,
          ),
          Positioned(
            left: 0 * utilities.width_rate,
            top: 0 * utilities.height_rate,
            child: barOne,
          ),
          Positioned(
            left: 212.27 * utilities.width_rate,
            top: 0 * utilities.height_rate,
            child: barTwo,
          ),
          Positioned(
            left: 424.54 * utilities.width_rate,
            top: 0 * utilities.height_rate,
            child: barThree,
          ),
          Positioned(
            right: 83*utilities.width_rate,
            top: 53*utilities.height_rate,
            child: GestureDetector(
              child: Container(
                child: Text(
                  "reset",
                    style: TextStyle(
                        fontFamily: "MontserratRegular",
                        fontSize: 15 * utilities.width_rate,
                        height: 2.29,
                        color: Color(0xff9EA2B0)
                    )
                ),
              ),
              onTap: (){
                setState(() {
                  utilities.userSelected = false;
                  VICEnlarged = false;
                  mapState = MapState.UNSELECTED;
                  distributorState = DistributorState.UNSELECTED;
                  utilities.setStateType(StateType.UNSELECTED);
                  utilities.setDistributorState(DistributorState.UNSELECTED);
                  packageNotifier.value.distributorState= DistributorState.UNSELECTED;
                  packageNotifier.value.calculate();
                  packageNotifier.notifyListeners();
                  barOne = Container(
                    width: 195.27*utilities.width_rate,
                    height: 50*utilities.height_rate,
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: <Widget>[
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Select a state",
                                    style: TextStyle(
                                        color: Color(0xff666F80),
                                        height: 2.37,
                                        fontFamily: "MontserratSemibold",
                                        fontSize: 17*utilities.width_rate
                                    ),
                                  )
                                ]
                            )
                        ),

                        Positioned(
                          top: 40*utilities.height_rate,
                          child: Container(
                            width: 195.72*utilities.width_rate,
                            child: Image.asset(stageBarBlackPng),
                          ),
                        )
                      ],
                    ),
                  );
                  barTwo = Container(
                    width: 195.27*utilities.width_rate,
                    height: 50*utilities.height_rate,
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: <Widget>[
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "",
                                    style: TextStyle(
                                        color: Color(0xff666F80),
                                        height: 2.37,
                                        fontFamily: "MontserratSemibold",
                                        fontSize: 17*utilities.width_rate
                                    ),
                                  )
                                ]
                            )
                        ),

                        Positioned(
                          top: 40*utilities.height_rate,
                          child: Container(
                            width: 195.72*utilities.width_rate,
                            child: Image.asset(stageBarGreyPng),
                          ),
                        )
                      ],
                    ),
                  );
                  barThree = Container(
                    width: 195.27*utilities.width_rate,
                    height: 50*utilities.height_rate,
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: <Widget>[
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "",
                                    style: TextStyle(
                                        color: Color(0xff666F80),
                                        height: 2.37,
                                        fontFamily: "MontserratSemibold",
                                        fontSize: 17*utilities.width_rate
                                    ),
                                  )
                                ]
                            )
                        ),

                        Positioned(
                          top: 40*utilities.height_rate,
                          child: Container(
                            width: 195.72*utilities.width_rate,
                            child: Image.asset(stageBarGreyPng),
                          ),
                        )
                      ],
                    ),
                  );

                  initState();
                });
              },
            ),
          )

        ],
      ),
    );
  }


  void setAllNormal() {
    setState(() {
      NTInUse = ImageLoaderState.NTPngLOAD;
      NSWInUse = ImageLoaderState.NSWPngLOAD;
      VICInUse = ImageLoaderState.VICPngLOAD;
      SAInUse = ImageLoaderState.SAPngLOAD;
      QLDInUse = ImageLoaderState.QLDPngLOAD;
      WAInUse = ImageLoaderState.WAPngLOAD;
      TASInUse = ImageLoaderState.TASPngLOAD;
    });
  }

  void setVICHover() {
    setState(() {
      setAllNormal();
      VICInUse = VICHover;
      QLDInUse = QLD;
    });
  }

  void cancleVICHover() {
    setState(() {
      VICInUse = VIC;
      QLDInUse = QLDDefault;
    });
  }


  void setSAHover() {
    setState(() {
      setAllNormal();
      SAInUse = SAHover;
    });
  }

  void cancleSAHover() {
    setState(() {
      SAInUse = SA;
      QLDInUse = QLDDefault;
    });
  }


  void setNTHover() {
    setState(() {
      setAllNormal();
      NTInUse = NTHover;
    });
  }

  void cancleNTHover() {
    setState(() {
      NTInUse = NT;
      QLDInUse = QLDDefault;
    });
  }


  void setTASHover() {
    setState(() {
      setAllNormal();
      TASInUse = TASHover;
    });
  }

  void cancleTASHover() {
    setState(() {
      TASInUse = TAS;
      QLDInUse = QLDDefault;
    });
  }


  void setWAHover() {
    setState(() {
      setAllNormal();
      WAInUse = WAHover;
    });
  }

  void cancleWAHover() {
    setState(() {
      WAInUse = WA;
      QLDInUse = QLDDefault;
    });
  }


  void setQLDHover() {
    setState(() {
      setAllNormal();
      QLDInUse = QLDHover;
    });
  }

  void cancleQLDHover() {
    setState(() {
      QLDInUse = QLDDefault;
    });
  }


  void setNSWHover() {
    setState(() {
      setAllNormal();
      NSWInUse = NSWHover;
    });
  }

  void cancleNSWHover() {
    setState(() {
      NSWInUse = NSW;
      QLDInUse = QLDDefault;
    });
  }


  void enterWA() {
    setState(() {
      mapState = MapState.WA;
      utilities.setStateType(StateType.WA);
      barOne = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "State",
                        style: TextStyle(
                            color: Color(0xff78A11B),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                      TextSpan(
                          text: " (West Australia)",
                          style: TextStyle(
                              color: Color(0xff78A11B),
                              fontSize: 16 * utilities.width_rate,
                              fontFamily: "MontserratRegular"
                          )
                      )
                    ]
                )
            ),

            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarGreenPng),
              ),
            )
          ],
        ),
      );
      barTwo = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Select a region",
                        style: TextStyle(
                            color: Color(0xff666F80),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      )
                    ]
                )
            ),

            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarBlackPng),
              ),
            )
          ],
        ),
      );
    });
  }

  void enterQLD() {
    setState(() {
      mapState = MapState.QLD;
      utilities.setStateType(StateType.QLD);
      barOne = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "State",
                        style: TextStyle(
                            color: Color(0xff78A11B),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                      TextSpan(
                          text: " (Queensland)",
                          style: TextStyle(
                              color: Color(0xff78A11B),
                              fontSize: 16 * utilities.width_rate,
                              fontFamily: "MontserratRegular"
                          )
                      )
                    ]
                )
            ),

            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarGreenPng),
              ),
            )
          ],
        ),
      );
      barTwo = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Select a region",
                        style: TextStyle(
                            color: Color(0xff666F80),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      )
                    ]
                )
            ),

            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarBlackPng),
              ),
            )
          ],
        ),
      );
    }
    );
  }

  void enterNT(){
    setState(() {
      mapState = MapState.NT;
      utilities.setStateType(StateType.NT);
      barOne = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "State",
                        style: TextStyle(
                            color: Color(0xff78A11B),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                      TextSpan(
                          text: " (North Territory)",
                          style: TextStyle(
                              color: Color(0xff78A11B),
                              fontSize: 16 * utilities.width_rate,
                              fontFamily: "MontserratRegular"
                          )
                      )
                    ]
                )
            ),

            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarGreenPng),
              ),
            )
          ],
        ),
      );
      barTwo = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "",
                        style: TextStyle(
                            color: Color(0xff666F80),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      )
                    ]
                )
            ),

            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarBlackPng),
              ),
            )
          ],
        ),
      );
    });
  }

  void enterNSW() {
    setState(() {
      mapState = MapState.NSW;
      utilities.setStateType(StateType.NSW);
      barOne = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "State",
                        style: TextStyle(
                            color: Color(0xff78A11B),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                      TextSpan(
                          text: " (New South Wales)",
                          style: TextStyle(
                              color: Color(0xff78A11B),
                              fontSize: 16 * utilities.width_rate,
                              fontFamily: "MontserratRegular"
                          )
                      )
                    ]
                )
            ),

            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarGreenPng),
              ),
            )
          ],
        ),
      );
      barTwo = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Select a region",
                        style: TextStyle(
                            color: Color(0xff666F80),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      )
                    ]
                )
            ),

            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarBlackPng),
              ),
            )
          ],
        ),
      );
    }
    );
  }

  void enterVIC() {
    setState(() {
      mapState = MapState.VIC;
      utilities.setStateType(StateType.VIC);
      barOne = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                    TextSpan(
                      text: "State",
                      style: TextStyle(
                        color: Color(0xff78A11B),
                        height: 2.37,
                        fontFamily: "MontserratMedium",
                          fontSize: 17*utilities.width_rate
                      ),
                    ),
                      TextSpan(
                          text: " (Victoria)",
                          style: TextStyle(
                              color: Color(0xff78A11B),
                              fontSize: 16 * utilities.width_rate,
                              fontFamily: "MontserratRegular"
                          )
                      )
                    ]
                )
            ),

            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarGreenPng),
              ),
            )
          ],
        ),
      );
      barTwo = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Select a region",
                        style: TextStyle(
                            color: Color(0xff666F80),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      )
                    ]
                )
            ),

            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarBlackPng),
              ),
            )
          ],
        ),
      );
    }
    );
  }
  //VIC SUB
  void enterPowercorVIC(){
    setState(() {
      utilities.setDistributorState((DistributorState.POWERCOR));
      distributorState = DistributorState.POWERCOR;
      barTwo = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Distributor",
                        style: TextStyle(
                            color: Color(0xff78A11B),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                      TextSpan(
                          text: " (Powercor)",
                          style: TextStyle(
                              color: Color(0xff78A11B),
                              fontSize: 16 * utilities.width_rate,
                              fontFamily: "MontserratRegular"
                          )
                      )
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarGreenPng),
              ),
            )
          ],
        ),
      );
      barThree = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "reVolt Offer",
                        style: TextStyle(
                            color: Color(0xff666F80),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarBlackPng),
              ),
            )
          ],
        ),
      );
      mapState = MapState.SELECTED;
    });
  }

  void enterJemenaVIC(){
    setState(() {
      utilities.setDistributorState((DistributorState.JEMANA));
      distributorState = DistributorState.JEMANA;
      barTwo = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Distributor",
                        style: TextStyle(
                            color: Color(0xff78A11B),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                      TextSpan(
                          text: " (Jenema)",
                          style: TextStyle(
                              color: Color(0xff78A11B),
                              fontSize: 16 * utilities.width_rate,
                              fontFamily: "MontserratRegular"
                          )
                      )
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarGreenPng),
              ),
            )
          ],
        ),
      );
      barThree = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "reVolt Offer",
                        style: TextStyle(
                            color: Color(0xff666F80),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarBlackPng),
              ),
            )
          ],
        ),
      );
      mapState = MapState.SELECTED;
      Timer(Duration(milliseconds: 4000),AppNavBarState.animationJoinButtonOpacityController.forward);
    });
  }

  void enterAusnetVIC(){
    setState(() {
      utilities.setDistributorState((DistributorState.AUSNET));
      distributorState = DistributorState.AUSNET;
      barTwo = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Distributor",
                        style: TextStyle(
                            color: Color(0xff78A11B),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                      TextSpan(
                          text: " (AusNet)",
                          style: TextStyle(
                              color: Color(0xff78A11B),
                              fontSize: 16 * utilities.width_rate,
                              fontFamily: "MontserratRegular"
                          )
                      )
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarGreenPng),
              ),
            )
          ],
        ),
      );
      barThree = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "reVolt Offer",
                        style: TextStyle(
                            color: Color(0xff666F80),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarBlackPng),
              ),
            )
          ],
        ),
      );
      mapState = MapState.SELECTED;
      Timer(Duration(milliseconds: 4000),AppNavBarState.animationJoinButtonOpacityController.forward);
    });
  }

  void enterCitipowerVIC(){
    setState(() {
      utilities.setDistributorState((DistributorState.CITIPOWER));
      distributorState = DistributorState.CITIPOWER;
      barTwo = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Distributor",
                        style: TextStyle(
                            color: Color(0xff78A11B),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                      TextSpan(
                          text: " (CitiPower)",
                          style: TextStyle(
                              color: Color(0xff78A11B),
                              fontSize: 16 * utilities.width_rate,
                              fontFamily: "MontserratRegular"
                          )
                      )
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarGreenPng),
              ),
            )
          ],
        ),
      );
      barThree = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "reVolt Offer",
                        style: TextStyle(
                            color: Color(0xff666F80),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarBlackPng),
              ),
            )
          ],
        ),
      );
      mapState = MapState.SELECTED;
      Timer(Duration(milliseconds: 4000),AppNavBarState.animationJoinButtonOpacityController.forward);
    });
  }

  void enterUnitedenergyVIC(){
    setState(() {
      utilities.setDistributorState((DistributorState.UNITEDENERGY));
      distributorState = DistributorState.UNITEDENERGY;
      barTwo = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Distributor",
                        style: TextStyle(
                            color: Color(0xff78A11B),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                      TextSpan(
                          text: " (United Energy)",
                          style: TextStyle(
                              color: Color(0xff78A11B),
                              fontSize: 12 * utilities.width_rate,
                              fontFamily: "MontserratRegular"
                          )
                      )
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarGreenPng),
              ),
            )
          ],
        ),
      );
      barThree = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "reVolt Offer",
                        style: TextStyle(
                            color: Color(0xff666F80),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarBlackPng),
              ),
            )
          ],
        ),
      );
      mapState = MapState.SELECTED;
      Timer(Duration(milliseconds: 4000),AppNavBarState.animationJoinButtonOpacityController.forward);
    });
  }

  void enterEnergyxQLD(){
    setState(() {
      utilities.setDistributorState((DistributorState.ENERGEX));
      distributorState = DistributorState.ENERGEX;
      barTwo = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Distributor",
                        style: TextStyle(
                            color: Color(0xff78A11B),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                      TextSpan(
                          text: " (Energex)",
                          style: TextStyle(
                              color: Color(0xff78A11B),
                              fontSize: 12 * utilities.width_rate,
                              fontFamily: "MontserratRegular"
                          )
                      )
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarGreenPng),
              ),
            )
          ],
        ),
      );
      barThree = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "reVolt Offer",
                        style: TextStyle(
                            color: Color(0xff666F80),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarBlackPng),
              ),
            )
          ],
        ),
      );
      mapState = MapState.SELECTED;
      Timer(Duration(milliseconds: 4000),AppNavBarState.animationJoinButtonOpacityController.forward);
    });
  }

  void enterErgonQLD(){
    setState(() {
      utilities.setDistributorState((DistributorState.ERGON));
      distributorState = DistributorState.ERGON;
      barTwo = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Distributor",
                        style: TextStyle(
                            color: Color(0xff78A11B),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                      TextSpan(
                          text: " (Ergon)",
                          style: TextStyle(
                              color: Color(0xff78A11B),
                              fontSize: 12 * utilities.width_rate,
                              fontFamily: "MontserratRegular"
                          )
                      )
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarGreenPng),
              ),
            )
          ],
        ),
      );
      barThree = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "reVolt Offer",
                        style: TextStyle(
                            color: Color(0xff666F80),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child:ImageLoaderState.stageBarBlackPngLOAD,
              ),
            )
          ],
        ),
      );
      mapState = MapState.SELECTED;
      Timer(Duration(milliseconds: 4000),AppNavBarState.animationJoinButtonOpacityController.forward);
    });
  }

  void enterAusgridNSW(){
    setState(() {
      utilities.setDistributorState((DistributorState.AUSGRID));
      distributorState = DistributorState.AUSGRID;
      barTwo = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Distributor",
                        style: TextStyle(
                            color: Color(0xff78A11B),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                      TextSpan(
                          text: " (Ausgrid)",
                          style: TextStyle(
                              color: Color(0xff78A11B),
                              fontSize: 12 * utilities.width_rate,
                              fontFamily: "MontserratRegular"
                          )
                      )
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: ImageLoaderState.stageBarGreenPngLOAD,
              ),
            )
          ],
        ),
      );
      barThree = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "reVolt Offer",
                        style: TextStyle(
                            color: Color(0xff666F80),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: ImageLoaderState.stageBarBlackPngLOAD,
              ),
            )
          ],
        ),
      );
      mapState = MapState.SELECTED;
      Timer(Duration(milliseconds: 4000),AppNavBarState.animationJoinButtonOpacityController.forward);
    });
  }

  void enterEssentialNSW(){
    setState(() {
      utilities.setDistributorState((DistributorState.ESSENTIALENERGY));
      distributorState = DistributorState.ESSENTIALENERGY;
      barTwo = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Distributor",
                        style: TextStyle(
                            color: Color(0xff78A11B),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                      TextSpan(
                          text: " (Essential Energy)",
                          style: TextStyle(
                              color: Color(0xff78A11B),
                              fontSize: 11 * utilities.width_rate,
                              fontFamily: "MontserratRegular"
                          )
                      )
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: ImageLoaderState.stageBarGreenPngLOAD,
              ),
            )
          ],
        ),
      );
      barThree = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "reVolt Offer",
                        style: TextStyle(
                            color: Color(0xff666F80),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: ImageLoaderState.stageBarBlackPngLOAD,
              ),
            )
          ],
        ),
      );
      mapState = MapState.SELECTED;
      Timer(Duration(milliseconds: 4000),AppNavBarState.animationJoinButtonOpacityController.forward);
    });
  }

  void enterEndeavourNSW(){
    setState(() {
      utilities.setDistributorState((DistributorState.ENDEVOUR));
      distributorState = DistributorState.ENDEVOUR;
      barTwo = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Distributor",
                        style: TextStyle(
                            color: Color(0xff78A11B),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                      TextSpan(
                          text: " (Endeavour)",
                          style: TextStyle(
                              color: Color(0xff78A11B),
                              fontSize: 12 * utilities.width_rate,
                              fontFamily: "MontserratRegular"
                          )
                      )
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: ImageLoaderState.stageBarGreenPngLOAD,
              ),
            )
          ],
        ),
      );
      barThree = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "reVolt Offer",
                        style: TextStyle(
                            color: Color(0xff666F80),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: ImageLoaderState.stageBarBlackPngLOAD,
              ),
            )
          ],
        ),
      );
      mapState = MapState.SELECTED;
      Timer(Duration(milliseconds: 4000),AppNavBarState.animationJoinButtonOpacityController.forward);
    });
  }

  void enterEvoEnergyNSW(){
    setState(() {
      utilities.setDistributorState((DistributorState.EVOENERGY));
      distributorState = DistributorState.EVOENERGY;

      barOne = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "ACT",
                        style: TextStyle(
                            color: Color(0xff78A11B),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                      TextSpan(
                          text: "",
                          style: TextStyle(
                              color: Color(0xff78A11B),
                              fontSize: 16 * utilities.width_rate,
                              fontFamily: "MontserratRegular"
                          )
                      )
                    ]
                )
            ),

            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarGreenPng),
              ),
            )
          ],
        ),
      );
      barTwo = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Distributor",
                        style: TextStyle(
                            color: Color(0xff78A11B),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                      TextSpan(
                          text: " (Evo Energy)",
                          style: TextStyle(
                              color: Color(0xff78A11B),
                              fontSize: 12 * utilities.width_rate,
                              fontFamily: "MontserratRegular"
                          )
                      )
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child:ImageLoaderState.stageBarGreenPngLOAD,
              ),
            )
          ],
        ),
      );
      barThree = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "reVolt Offer",
                        style: TextStyle(
                            color: Color(0xff666F80),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: ImageLoaderState.stageBarBlackPngLOAD,
              ),
            )
          ],
        ),
      );
      mapState = MapState.SELECTED;
      Timer(Duration(milliseconds: 4000),AppNavBarState.animationJoinButtonOpacityController.forward);
    });
  }

  void enterSAPowerSA(){
    setState(() {
      utilities.setDistributorState((DistributorState.SAPOWER));
      distributorState = DistributorState.SAPOWER;

      barOne = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "State",
                        style: TextStyle(
                            color: Color(0xff78A11B),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                      TextSpan(
                          text: " (South Australia)",
                          style: TextStyle(
                              color: Color(0xff78A11B),
                              fontSize: 16 * utilities.width_rate,
                              fontFamily: "MontserratRegular"
                          )
                      )
                    ]
                )
            ),

            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarGreenPng),
              ),
            )
          ],
        ),
      );
      barTwo = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Distributor",
                        style: TextStyle(
                            color: Color(0xff78A11B),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                      TextSpan(
                          text: " (SA Power Network)",
                          style: TextStyle(
                              color: Color(0xff78A11B),
                              fontSize: 10 * utilities.width_rate,
                              fontFamily: "MontserratRegular"
                          )
                      )
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: ImageLoaderState.stageBarGreenPngLOAD,
              ),
            )
          ],
        ),
      );
      barThree = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "reVolt Offer",
                        style: TextStyle(
                            color: Color(0xff666F80),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: ImageLoaderState.stageBarBlackPngLOAD,
              ),
            )
          ],
        ),
      );
      mapState = MapState.SELECTED;
      Timer(Duration(milliseconds: 4000),AppNavBarState.animationJoinButtonOpacityController.forward);
    });
  }

  void enterTASNetworkTAS(){
    setState(() {
      utilities.setDistributorState((DistributorState.TASNETWORK));
      distributorState = DistributorState.TASNETWORK;

      barOne = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "State",
                        style: TextStyle(
                            color: Color(0xff78A11B),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                      TextSpan(
                          text: " (Tasmania)",
                          style: TextStyle(
                              color: Color(0xff78A11B),
                              fontSize: 16 * utilities.width_rate,
                              fontFamily: "MontserratRegular"
                          )
                      )
                    ]
                )
            ),

            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: Image.asset(stageBarGreenPng),
              ),
            )
          ],
        ),
      );
      barTwo = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Distributor",
                        style: TextStyle(
                            color: Color(0xff78A11B),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                      TextSpan(
                          text: " (TAS Network)",
                          style: TextStyle(
                              color: Color(0xff78A11B),
                              fontSize: 12 * utilities.width_rate,
                              fontFamily: "MontserratRegular"
                          )
                      )
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: ImageLoaderState.stageBarGreenPngLOAD,
              ),
            )
          ],
        ),
      );
      barThree = Container(
        width: 195.27*utilities.width_rate,
        height: 50*utilities.height_rate,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text: "reVolt Offer",
                        style: TextStyle(
                            color: Color(0xff666F80),
                            height: 2.37,
                            fontFamily: "MontserratMedium",
                            fontSize: 17*utilities.width_rate
                        ),
                      ),
                    ]
                )
            ),
            Positioned(
              top: 40*utilities.height_rate,
              child: Container(
                width: 195.72*utilities.width_rate,
                child: ImageLoaderState.stageBarBlackPngLOAD,
              ),
            )
          ],
        ),
      );
      mapState = MapState.SELECTED;
      Timer(Duration(milliseconds: 4000),AppNavBarState.animationJoinButtonOpacityController.forward);

    });
  }

}


