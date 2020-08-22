import 'dart:js';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'materials/utilities.dart';
import 'views/home/home_view.dart';
import 'views/view_five/view_five.dart';
import 'views/view_four/view_four.dart';
import 'views/view_three/ViewThree.dart';
import 'views/view_two/view_two.dart';
import 'widgets/AppNavBar.dart';
import 'widgets/revolt_text.dart';
import 'package:firebase/firebase.dart' as fb;
import 'widgets/homePageGestureDetectors.dart';
import 'materials/imageLoader.dart';
import 'package:google_tag_manager/google_tag_manager.dart' as gtm;

void main() {

  //UNCOMMEND THIS BEFORE DEPLOY

  assert(() {
    if (fb.apps.isEmpty) {
      fb.initializeApp(
        apiKey: "AIzaSyBcWAnr2vvKk8ZGTaC48dFXL2rN9-XtrrY",
        authDomain: "revolt-landing.firebaseapp.com",
        databaseURL: "https://revolt-landing.firebaseio.com",
        projectId: "revolt-landing",
        storageBucket: "revolt-landing.appspot.com",
        messagingSenderId: "413061187619",
      );
    }
    return true;
  }());
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    ValueNotifier<double> _notifier;
    Utilities utilities = Utilities();
    return MaterialApp(
      title: 'reVolt',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Montserrat'
        )
      ),
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            ImageLoader(),
            NotifyingPageView(utilities, _notifier),

          ],
        )

        ),
    );
  }
}




class NotifyingPageView extends StatefulWidget {
  Utilities utilities;

  final ValueNotifier<double> notifier;

  NotifyingPageView(Utilities utilities, this.notifier){
    this.utilities = utilities;
  }

  @override
  NotifyingPageViewState createState() => NotifyingPageViewState(utilities);

}

class NotifyingPageViewState extends State<NotifyingPageView> with TickerProviderStateMixin{
  Utilities utilities;
  PageController _pageController;
  static bool scrollDownEnabled;
  static bool showhomePageGestureDectors = true;
  ScrollPhysics physics = NeverScrollableScrollPhysics();


  int animationNavBarTime = 300;



  //buttons opacity varible
    Animation<double> animationNavBarOpacity;
    AnimationController animationNavBarOpacityController;
    AnimationStatus animationNavBarOpacityStatus;
    double animationNavBarOpacityValue;



  NotifyingPageViewState(Utilities utilities){
    this.utilities = utilities;
  }



  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    scrollDownEnabled = false;

    animationNavBarOpacityController = AnimationController(
        duration: Duration(milliseconds: animationNavBarTime),vsync: this);
    animationNavBarOpacity = Tween<double>(begin: 0, end: 1).animate(
        new CurvedAnimation(
            parent: animationNavBarOpacityController,curve: Curves.easeInOutCubic));
    animationNavBarOpacity.addListener(() {
      setState(() {
        animationNavBarOpacityValue = animationNavBarOpacity.value;
      });
    });



    _pageController.addListener(loadWidgets);
    _pageController.addListener(handleScrollBehavior);
    super.initState();
  }

  @override
  void dispose() {
    animationNavBarOpacityController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    AppNavBar appNavBar = AppNavBar(utilities, _pageController);
    reVoltText revoltText = reVoltText(utilities, _pageController);
    HomePageGestureDectors homePageGestureDectors = HomePageGestureDectors(utilities, _pageController);


    return Listener(
      onPointerSignal: (PointerSignalEvent event){
        if (event is PointerScrollEvent){
          print('x: ${event.position.dx}, y: ${event.position.dy}');
          print('scroll delta: ${event.scrollDelta}');

          if (event.scrollDelta.direction > 0){
            utilities.lastScrollIsDown = true;

/*            if (_pageController.page <= 3){
              _pageController.animateToPage(_pageController.page.round()+1, duration: Duration(milliseconds: 1600), curve: Curves.fastLinearToSlowEaseIn);
            }*/

            if (scrollDownEnabled){
              _pageController.animateToPage(_pageController.page.round()+1, duration: Duration(milliseconds: 1600), curve: Curves.fastLinearToSlowEaseIn);
            }
          }

          else{
            utilities.lastScrollIsDown = false;
            if (_pageController.page >= 1 ){
              _pageController.animateToPage(_pageController.page.round()-1, duration: Duration(milliseconds: 1600), curve: Curves.fastLinearToSlowEaseIn);
            }
          }
        }

      },
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[

            PageView(
                physics: physics,
                pageSnapping: true,
                scrollDirection: Axis.vertical,
                controller: _pageController,
                children: <Widget>[
                    HomeView(utilities, _pageController),
                    ViewTwo(utilities, _pageController),
                    ViewThree(utilities, _pageController),
                    ViewFour(utilities, _pageController),
                    ViewFive(utilities, _pageController),

                ]
              ),

          Container(
              alignment: Alignment.topCenter,
              child:
              Opacity(
                  opacity: animationNavBarOpacity.value,
                  child: appNavBar)
          ),
          Container(
              alignment: Alignment.topCenter,
              child:
              revoltText
          ),

          Container(
            alignment: Alignment.topCenter,
            child:
            showhomePageGestureDectors ?
            homePageGestureDectors
            :
            null,
          ),

        ]
      ),
    );

  }

  void loadWidgets(){
    if(utilities.lastScrollIsDown){
      if (_pageController.page>0.6){
        setState(() {
          animationNavBarTime = 300;
        });
        animationNavBarOpacityController.forward();
      }
    }
    else{
      if (_pageController.page<1){
        setState(() {
          animationNavBarTime = 1;
        });
        animationNavBarOpacityController.reverse();
      }
    }
  }

  void handleScrollBehavior(){
      scrollDownEnabled = false;
  }

  static void enableScrollDown(){
    scrollDownEnabled = true;
    print("CURRENT scrollDownEnable" + scrollDownEnabled.toString());
  }

  static void disableScrollDown(){
    scrollDownEnabled = false;
    print("CURRENT scrollDownEnable" + scrollDownEnabled.toString());
  }


}

