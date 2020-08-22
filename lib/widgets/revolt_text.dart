import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../materials/imageLoader.dart';
import '../materials/materials.dart';
import '../materials/utilities.dart';
import '../extensions/hover.dart';

class reVoltText extends StatefulWidget{
  Utilities utilities;
  PageController _pageController;
  reVoltText(Utilities utilities, this._pageController){
    this.utilities = utilities;
  }

  @override
  State<StatefulWidget> createState() => reVoltTextState(utilities);

}

class reVoltTextState extends State<reVoltText> with TickerProviderStateMixin{


  Utilities utilities;
  reVoltTextState(Utilities utilities){
    this.utilities = utilities;
  }


  double twoSidesOpacity = 1.0;
  double midWhiteOpacity = 0;
  double midGreenOpacity = 1;
  double wholeBlackOpacity = 0;

  static ValueNotifier<double> globalOpacity = ValueNotifier<double>(0);


  @override
  void initState() {
    super.initState();

    widget._pageController.addListener(printValue);
    widget._pageController.addListener(textLogoFirstChange);
    widget._pageController.addListener(textLogoSecondChange);
  }


  @override
  Widget build(BuildContext context) {
    utilities.update(context);

    return  ValueListenableBuilder(
      valueListenable: globalOpacity,
      builder: (BuildContext context,double globalOpacity, Widget child) {
        return Container(
          alignment: Alignment.centerLeft,
          width: 1600*utilities.width_rate,
          height: 96*utilities.height_rate,
          padding: EdgeInsets.fromLTRB(160*utilities.width_rate, 0, 0, 0),

          child:
          GestureDetector(
            onTap: (){
              widget._pageController.animateToPage(0, duration: Duration(milliseconds: 1500-((4-widget._pageController.page.round())*250)), curve: Curves.easeOutCubic);
              utilities.lastScrollIsDown = false;
            },
            child: AnimatedOpacity(
              opacity: globalOpacity,
              duration: Duration(milliseconds: 1000),
              curve: Curves.easeOutCubic,
              child: Container(
                child: Stack(
                  children: <Widget>[
                    AnimatedOpacity(
                      child: Container(
                        width: 116.09*utilities.width_rate,
                        child: ImageLoaderState.reVoltTwoSidesPngLOAD,
                      ),
                      opacity: twoSidesOpacity,
                      duration: Duration(milliseconds: 350),
                    ),
                    AnimatedOpacity(
                      child: Container(
                        width: 116.09*utilities.width_rate,
                        child: ImageLoaderState.reVoltMidGreenPngLOAD,
                      ),
                      opacity: midGreenOpacity,
                      duration: Duration(milliseconds: 350),
                    ),
                    AnimatedOpacity(
                      child: Container(
                        width: 116.09*utilities.width_rate,
                        child:  ImageLoaderState.reVoltMidWhitePngLOAD,
                      ),
                      opacity: midWhiteOpacity,
                      duration: Duration(milliseconds: 350),
                    ),
                    AnimatedOpacity(
                      child: Container(
                        width: 116.09*utilities.width_rate,
                        child:  ImageLoaderState.reVoltWholeBlackPngLOAD,
                      ),
                      opacity: wholeBlackOpacity,
                      duration: Duration(milliseconds: 350),
                    )
                  ],
                ),
              ),
            ),
          ).showCursorOnHover,
        );
      },
    );
  }



  void printValue(){
    print("功夫不负有心人: " + widget._pageController.page.toString());
  }

  void textLogoFirstChange(){
    if (widget._pageController.page >= 0.6){
      midGreenFadeOut();
      midWhiteFadeIn();
      widget._pageController.removeListener(textLogoFirstChange);
      widget._pageController.addListener(textLogoSecondChangeBackwards);
    }
  }
  //first-change sub
  void sidesFadeOut(){
    setState(() {
      twoSidesOpacity = 0;
    });
  }
  //first-change sub
  void midGreenFadeOut(){
    setState(() {
      midGreenOpacity = 0;
    });
  }
  //first-change sub
  void midWhiteFadeIn(){
    setState(() {
      midWhiteOpacity = 1;
    });
  }


  void textLogoSecondChange(){
    if (widget._pageController.page >= 1.6){
      midWhiteFadeOut();
      wholeBlackFadeIn();
      widget._pageController.removeListener(textLogoSecondChange);
      widget._pageController.addListener(textLogoFirstChangeBackwards);
    }
  }
  //second-change sub
  void wholeBlackFadeIn(){
    setState(() {
      wholeBlackOpacity = 1;
    });
  }
  //second-change sub
  void midWhiteFadeOut(){
    setState(() {
      midWhiteOpacity = 0;
    });
  }


  void textLogoFirstChangeBackwards(){
    if (widget._pageController.page < 1.6){
      wholeBlackFadeOut();
      midWhiteFadeIn();
      widget._pageController.removeListener(textLogoFirstChangeBackwards);
      widget._pageController.addListener(textLogoSecondChange);
    }
  }
  //first-change backwards sub
  void wholeBlackFadeOut() {
    setState(() {
      wholeBlackOpacity = 0;
    });
  }

  void textLogoSecondChangeBackwards(){
    if (widget._pageController.page == 0){
      midWhiteFadeOut();
      sidesFadeIn();
      midGreenFadeIn();
      widget._pageController.removeListener(textLogoSecondChangeBackwards);
      widget._pageController.addListener(textLogoFirstChange);
    }
  }
  //second-change backwards sub
  void sidesFadeIn(){
    setState(() {
      twoSidesOpacity = 1;
    });
  }
  //second-change backwards sub
  void midGreenFadeIn(){
    setState(() {
      midGreenOpacity = 1;
    });
  }

}
