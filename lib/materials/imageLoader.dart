import 'package:flutter/cupertino.dart';
import 'materials.dart';

class ImageLoader extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ImageLoaderState();
}

class ImageLoaderState extends State<ImageLoader> {

  //TEST
  static Image reVoltTwoSidesPngLOAD;
  static Image reVoltMidGreenPngLOAD;
  static Image reVoltMidWhitePngLOAD;
  static Image reVoltWholeBlackPngLOAD;


  //PAGE1
  static AssetImage backgroundHomeJpgLOAD;
  static Image pg5FacebookGPngLOAD;
  static Image pg5FacebookPngLOAD;
  static Image pg5LinkedInGPngLOAD;
  static Image pg5LinkedInPngLOAD;
  static Image pg5InstaGPngLOAD;
  static Image pg5InstaPngLOAD;
  static Image pg5TwitterGPngLOAD;
  static Image pg5TwitterPngLOAD;
  static Image signInPngLOAD;

  static Image iphoneXPngLOAD;
  static Image HundPctPngLOAD;
  static Image five00PngLOAD;
  static Image socketPngLOAD;
  static Image hundredPngLOAD;

  static Image tickSignLOAD;
  static Image exclamationSignLOAD;

  //sign in
  static Image pgSignInFadedVLOAD;
  static Image pgSignInRevoltTextLOAD;
  static Image pgSignInGooglePlayLOAD;
  static Image pgSignInAppStoreLOAD;
  static Image pgSignInCrossButtonLOAD;
  static Image pgSignInSignInArrowLOAD;
  static Image resetPasswordResetBubbleLOAD;
  static Image resetPasswordGoBackBubbleLOAD;

  //NavBar
  static Image joinTheRevoltButtonPngLOAD;
  static Image joinTheRevoltButtonTwoPngLOAD;

  //PAGE3
  static Image bigVPngLOAD;
  static Image lightGreenBigPngLOAD;
  static Image greenBigPngLOAD;
  static Image transparentSmallPngLOAD;
  static Image greenSmallPngLOAD;
  static Image numberSwitch1PngLOAD;
  static Image numberSwitch2PngLOAD;
  static Image numberSwitch3PngLOAD;
  static Image numberSwitch4PngLOAD;
  static Image numberSwitch5PngLOAD;
  static Image usagePngLOAD;
  static Image usersIconPngLOAD;
  static Image longDashLinePngLOAD;
  static Image exclamationIconPngLOAD;
  static Image greyWidePngLOAD;
  static Image stageBarBlackPngLOAD;
  static Image stageBarGreyPngLOAD;
  static Image WAHorizonSelectedPngLOAD;
  static Image WAHorizonPngLOAD;
  static Image WASynergySelectedPngLOAD;
  static Image WASynergyPngLOAD;
  static Image QLDEnergexGreenPngLOAD;
  static Image QLDEnergexPngLOAD;
  static Image QLDErgonGreenPngLOAD;
  static Image QLDErgonPngLOAD;
  static Image VICenlargedGreenCityPowerPngLOAD;
  static Image VICenlargedWhiteCityPowerPngLOAD;
  static Image VICenlargedGreenJenemaPngLOAD;
  static Image VICenlargedWhiteJenemaPngLOAD;
  static Image VICenlargedGreenPowercorPngLOAD;
  static Image VICenlargedWhitePowercorPngLOAD;
  static Image VICenlargedGreenUnitedEnergyLOAD;
  static Image VICenlargedWhiteUnitedEnergyLOAD;
  static Image VICnormalGreenPowercorPngLOAD;
  static Image VICnormalWhitePowercorPngLOAD;
  static Image VICnormalGreenAuzNetPngLOAD;
  static Image VICnormalWhiteAuzNetPngLOAD;
  static Image VICnormalGreenJenemaPngLOAD;
  static Image VICnormalGreenCityPowerPngLOAD;
  static Image VICnormalGreenUnitedEnergyLOAD;
  static Image VICnormalWhiteJenemaPngLOAD;
  static Image VICnormalWhiteCityPowerPngLOAD;
  static Image VICnormalWhiteUnitedEnergyLOAD;
  static Image NSWAusgridGreenPngLOAD;
  static Image NSWAusgridPngLOAD;
  static Image NSWEssentialGreenPngLOAD;
  static Image NSWEssentialPngLOAD;
  static Image NSWEndeavourGreenPngLOAD;
  static Image NSWEndeavourPngLOAD;
  static Image NSWEvoGreenPngLOAD;
  static Image NSWEvoPngLOAD;
  static Image onceoffChartPngLOAD;
  static Image greenBubbleChartPngLOAD;
  static Image holoBubbleChartPngLOAD;
  static Image weeklyChartPngLOAD;
  static Image greenBubbleChartWEEKLYPngLOAD;
  static Image holoBubbleChartWEEKLYPngLOAD;
  static Image stageBarGreenPngLOAD;
  static Image ausMapPngLOAD;
  static Image NSWPngLOAD;
  static Image NTPngLOAD;
  static Image QLDPngLOAD;
  static Image SAPngLOAD;
  static Image TASPngLOAD;
  static Image VICPngLOAD;
  static Image WAPngLOAD;
  static Image NSWHoverPngLOAD;
  static Image NTHoverPngLOAD;
  static Image QLDHoverPngLOAD;
  static Image SAHoverPngLOAD;
  static Image TASHoverPngLOAD;
  static Image VICHoverPngLOAD;
  static Image WAHoverPngLOAD;
  static Image QLDDefaultPngLOAD;
  static Image VICenlargedWhiteAuzNetPngLOAD;
  static Image VICenlargedGreenAuzNetPngLOAD;

  //Page 4
  static Image shadowPngLOAD;
  static Image c1PngLOAD;
  static Image c2PngLOAD;
  static Image c3PngLOAD;
  static Image c4PngLOAD;
  static Image c5PngLOAD;
  static Image c51PngLOAD;
  static Image c52PngLOAD;
  static Image c53PngLOAD;
  static Image c54PngLOAD;
  static Image c55PngLOAD;
  static Image alwaysPngLOAD;
  static Image homePngLOAD;
  static Image kitchenPngLOAD;
  static Image otherPngLOAD;
  static Image heatPngLOAD;
  static Image w2000PngLOAD;
  static Image redPngLOAD;

  //page5
  static Image iPhonePg5PngLOAD;

  @override
  void initState() {
    super.initState();

    //reVolt Text
      reVoltTwoSidesPngLOAD= Image.asset(reVoltTwoSidesPng);
      reVoltMidGreenPngLOAD= Image.asset(reVoltMidGreenPng);
      reVoltMidWhitePngLOAD= Image.asset(reVoltMidWhitePng);
      reVoltWholeBlackPngLOAD= Image.asset(reVoltWholeBlackPng);


    //PAGE1
    backgroundHomeJpgLOAD = AssetImage(backgroundHomeJpg);
      pg5FacebookGPngLOAD = Image.asset(pg5FacebookGPng);
      pg5FacebookPngLOAD = Image.asset(pg5FacebookPng);
      pg5LinkedInGPngLOAD = Image.asset(pg5LinkedInGPng);
      pg5LinkedInPngLOAD = Image.asset(pg5LinkedInPng);
      pg5InstaGPngLOAD = Image.asset(pg5InstaGPng);
      pg5InstaPngLOAD = Image.asset(pg5InstaPng);
      pg5TwitterGPngLOAD = Image.asset(pg5TwitterGPng);
    pg5TwitterPngLOAD = Image.asset(pg5TwitterPng);
    signInPngLOAD = Image.asset(signInPng);
    iphoneXPngLOAD = Image.asset(iphoneXPng);
      HundPctPngLOAD= Image.asset(HundPctPng);
      five00PngLOAD= Image.asset(five00Png);
      socketPngLOAD= Image.asset(socketPng);
      hundredPngLOAD= Image.asset(hundredPng);
    tickSignLOAD = Image.asset(pg1TickSign);
    exclamationSignLOAD = Image.asset(pg1ExclamationSignPng);


    //signIN page
    pgSignInFadedVLOAD = Image.asset(pgSignInFadedV);
    pgSignInRevoltTextLOAD = Image.asset(pgSignInRevoltText);
      pgSignInGooglePlayLOAD = Image.asset(pgSignInGooglePlay);
      pgSignInAppStoreLOAD = Image.asset(pgSignInAppStore);
      pgSignInCrossButtonLOAD = Image.asset(pgSignInCrossButton);
      pgSignInSignInArrowLOAD = Image.asset(pgSignInSignInArrow);
     resetPasswordResetBubbleLOAD = Image.asset(resetResetBubble);
      resetPasswordGoBackBubbleLOAD = Image.asset(resetGoBackBubble,  fit: BoxFit.fill,);



    //NavBar
      joinTheRevoltButtonPngLOAD= Image.asset(joinTheRevoltButtonPng);
      joinTheRevoltButtonTwoPngLOAD= Image.asset(joinTheRevoltButtonTwoPng);




    //PAGE3
    bigVPngLOAD = Image.asset(bigVPng);
    lightGreenBigPngLOAD = Image.asset(lightGreenBigPng);
    greenBigPngLOAD = Image.asset(greenBigPng);
    transparentSmallPngLOAD = Image.asset(transparentSmallPng, fit: BoxFit.fill,);
    greenSmallPngLOAD = Image.asset(greenSmallPng, fit: BoxFit.fill,);
    usagePngLOAD = Image.asset(usagePng);
    usersIconPngLOAD = Image.asset(usersIconPng);
    longDashLinePngLOAD= Image.asset(longDashLinePng);
    exclamationIconPngLOAD= Image.asset(exclamationIconPng);
    greyWidePngLOAD= Image.asset(greyWidePng);
    stageBarBlackPngLOAD= Image.asset(stageBarBlackPng);
    stageBarGreyPngLOAD= Image.asset(stageBarGreyPng);
    WAHorizonSelectedPngLOAD= Image.asset(WAHorizonSelectedPng);
    WAHorizonPngLOAD= Image.asset(WAHorizonPng);
    WASynergySelectedPngLOAD= Image.asset(WASynergySelectedPng);
    WASynergyPngLOAD= Image.asset(WASynergyPng);
    QLDEnergexGreenPngLOAD= Image.asset(QLDEnergexGreenPng);
    QLDEnergexPngLOAD= Image.asset(QLDEnergexPng);
    QLDErgonGreenPngLOAD= Image.asset(QLDErgonGreenPng);
    QLDErgonPngLOAD= Image.asset(QLDErgonPng);
    VICenlargedGreenCityPowerPngLOAD= Image.asset(VICenlargedGreenCityPowerPng);
    VICenlargedWhiteCityPowerPngLOAD= Image.asset(VICenlargedWhiteCityPowerPng);
    VICenlargedGreenJenemaPngLOAD= Image.asset(VICenlargedGreenJenemaPng);
    VICenlargedWhiteJenemaPngLOAD= Image.asset(VICenlargedWhiteJenemaPng);
    VICenlargedGreenPowercorPngLOAD= Image.asset(VICenlargedGreenPowercorPng);
    VICenlargedWhitePowercorPngLOAD= Image.asset(VICenlargedWhitePowercorPng);
    VICenlargedGreenUnitedEnergyLOAD= Image.asset(VICenlargedGreenUnitedEnergy);
    VICenlargedWhiteUnitedEnergyLOAD= Image.asset(VICenlargedWhiteUnitedEnergy);
    VICnormalGreenPowercorPngLOAD= Image.asset(VICnormalGreenPowercorPng);
    VICnormalWhitePowercorPngLOAD= Image.asset(VICnormalWhitePowercorPng);
    VICnormalGreenAuzNetPngLOAD= Image.asset(VICnormalGreenAuzNetPng);
    VICnormalWhiteAuzNetPngLOAD= Image.asset(VICnormalWhiteAuzNetPng);
    VICnormalGreenJenemaPngLOAD= Image.asset(VICnormalGreenJenemaPng);
    VICnormalGreenCityPowerPngLOAD= Image.asset(VICnormalGreenCityPowerPng);
    VICnormalGreenUnitedEnergyLOAD= Image.asset(VICnormalGreenUnitedEnergy);
    VICnormalWhiteJenemaPngLOAD= Image.asset(VICnormalWhiteJenemaPng);
    VICnormalWhiteCityPowerPngLOAD= Image.asset(VICnormalWhiteCityPowerPng);
    VICnormalWhiteUnitedEnergyLOAD= Image.asset(VICnormalWhiteUnitedEnergy);
    NSWAusgridGreenPngLOAD= Image.asset(NSWAusgridGreenPng);
    NSWAusgridPngLOAD= Image.asset(NSWAusgridPng);
    NSWEssentialGreenPngLOAD= Image.asset(NSWEssentialGreenPng);
    NSWEssentialPngLOAD= Image.asset(NSWEssentialPng);
    NSWEndeavourGreenPngLOAD= Image.asset(NSWEndeavourGreenPng);
    NSWEndeavourPngLOAD= Image.asset(NSWEndeavourPng);
    NSWEvoGreenPngLOAD= Image.asset(NSWEvoGreenPng);
    NSWEvoPngLOAD= Image.asset(NSWEvoPng);
    onceoffChartPngLOAD= Image.asset(onceoffChartPng);
    greenBubbleChartPngLOAD= Image.asset(greenBubbleChartPng);
    holoBubbleChartPngLOAD= Image.asset(holoBubbleChartPng);
    weeklyChartPngLOAD= Image.asset(weeklyChartPng);
    greenBubbleChartWEEKLYPngLOAD= Image.asset(greenBubbleChartWEEKLYPng);
    holoBubbleChartWEEKLYPngLOAD= Image.asset(holoBubbleChartWEEKLYPng);
    stageBarGreenPngLOAD= Image.asset(stageBarGreenPng);
    ausMapPngLOAD= Image.asset(ausMapPng);
    NSWPngLOAD= Image.asset(NSWPng);
    NTPngLOAD= Image.asset(NTPng);
    QLDPngLOAD= Image.asset(QLDPng);
    SAPngLOAD= Image.asset(SAPng);
    TASPngLOAD= Image.asset(TASPng);
    VICPngLOAD= Image.asset(VICPng);
    WAPngLOAD= Image.asset(WAPng);
    NSWHoverPngLOAD= Image.asset(NSWHoverPng);
    NTHoverPngLOAD= Image.asset(NTHoverPng);
    QLDHoverPngLOAD= Image.asset(QLDHoverPng);
    SAHoverPngLOAD= Image.asset(SAHoverPng);
    TASHoverPngLOAD= Image.asset(TASHoverPng);
    VICHoverPngLOAD= Image.asset(VICHoverPng);
    WAHoverPngLOAD= Image.asset(WAHoverPng);
    QLDDefaultPngLOAD= Image.asset(QLDDefaultPng);
    VICenlargedWhiteAuzNetPngLOAD = Image.asset(VICenlargedWhiteAuzNetPng);
    VICenlargedGreenAuzNetPngLOAD = Image.asset(VICenlargedGreenAuzNetPng);
      numberSwitch1PngLOAD= Image.asset(numberSwitch1Png);
      numberSwitch2PngLOAD= Image.asset(numberSwitch2Png);
      numberSwitch3PngLOAD= Image.asset(numberSwitch3Png);
      numberSwitch4PngLOAD= Image.asset(numberSwitch4Png);
      numberSwitch5PngLOAD= Image.asset(numberSwitch5Png);


    //PAGE4

     shadowPngLOAD= Image.asset(shadowPng);
     c1PngLOAD= Image.asset(c1Png);
     c2PngLOAD= Image.asset(c2Png);
     c3PngLOAD= Image.asset(c3Png);
     c4PngLOAD= Image.asset(c4Png);
     c5PngLOAD= Image.asset(c5Png);
     c51PngLOAD= Image.asset(c51Png);
     c52PngLOAD= Image.asset(c52Png);
     c53PngLOAD= Image.asset(c53Png);
     c54PngLOAD= Image.asset(c54Png);
     c55PngLOAD= Image.asset(c55Png);
     alwaysPngLOAD= Image.asset(alwaysPng);
     homePngLOAD= Image.asset(homePng);
     kitchenPngLOAD= Image.asset(kitchenPng);
     otherPngLOAD= Image.asset(otherPng);
     heatPngLOAD= Image.asset(heatPng);
     w2000PngLOAD= Image.asset(w2000Png);
     redPngLOAD= Image.asset(redPng);

     //PAGE5
    iPhonePg5PngLOAD = Image.asset(iPhonePg5Png);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //REVOLT TEXT
    precacheImage(reVoltTwoSidesPngLOAD.image, context);
    precacheImage(reVoltMidGreenPngLOAD.image, context);
    precacheImage(reVoltMidWhitePngLOAD.image, context);
    precacheImage(reVoltWholeBlackPngLOAD.image, context);

    //PAGE1

    precacheImage(backgroundHomeJpgLOAD, context);
    precacheImage(pg5FacebookPngLOAD.image, context);
    precacheImage(pg5LinkedInGPngLOAD.image, context);
    precacheImage(pg5LinkedInPngLOAD.image, context);
    precacheImage(pg5InstaGPngLOAD.image, context);
    precacheImage(pg5InstaPngLOAD.image, context);
    precacheImage(pg5TwitterGPngLOAD.image, context);
    precacheImage(pg5TwitterPngLOAD.image, context);
    precacheImage(signInPngLOAD.image, context);
    precacheImage(iphoneXPngLOAD.image, context);
    precacheImage(HundPctPngLOAD.image, context);
    precacheImage(five00PngLOAD.image, context);
    precacheImage(socketPngLOAD.image, context);
    precacheImage(hundredPngLOAD.image, context);
    precacheImage(tickSignLOAD.image, context);
    precacheImage(exclamationSignLOAD.image, context);
    
    //SIGN IN PAGE
    precacheImage(pgSignInFadedVLOAD.image, context);
    precacheImage(pgSignInRevoltTextLOAD.image, context);
    precacheImage(pgSignInGooglePlayLOAD.image, context);
    precacheImage(pgSignInAppStoreLOAD.image, context);
    precacheImage(pgSignInCrossButtonLOAD.image, context);
    precacheImage(pgSignInSignInArrowLOAD.image, context);
    precacheImage(resetPasswordResetBubbleLOAD.image, context);
    precacheImage(resetPasswordGoBackBubbleLOAD.image, context);


    //NavBar
    precacheImage(joinTheRevoltButtonPngLOAD.image, context);
    precacheImage(joinTheRevoltButtonTwoPngLOAD.image, context);

    //PAGE3
    precacheImage(bigVPngLOAD.image, context);
    precacheImage(lightGreenBigPngLOAD.image, context);
    precacheImage(greenBigPngLOAD.image, context);
    precacheImage(numberSwitch1PngLOAD.image, context);
    precacheImage(numberSwitch2PngLOAD.image, context);
    precacheImage(numberSwitch3PngLOAD.image, context);
    precacheImage(numberSwitch4PngLOAD.image, context);
    precacheImage(numberSwitch5PngLOAD.image, context);
    precacheImage(transparentSmallPngLOAD.image, context);
    precacheImage(greenSmallPngLOAD.image, context);
    precacheImage(usagePngLOAD.image, context);
    precacheImage(usersIconPngLOAD.image, context);
    precacheImage(longDashLinePngLOAD.image, context);
    precacheImage(exclamationIconPngLOAD.image, context);
    precacheImage(greyWidePngLOAD.image, context);
    precacheImage(stageBarBlackPngLOAD.image, context);
    precacheImage(stageBarGreyPngLOAD.image, context);
    precacheImage(WAHorizonSelectedPngLOAD.image, context);
    precacheImage(WAHorizonPngLOAD.image, context);
    precacheImage(WASynergySelectedPngLOAD.image, context);
    precacheImage(WASynergyPngLOAD.image, context);
    precacheImage(QLDEnergexGreenPngLOAD.image, context);
    precacheImage(QLDEnergexPngLOAD.image, context);
    precacheImage(QLDErgonGreenPngLOAD.image, context);
    precacheImage(QLDErgonPngLOAD.image, context);
    precacheImage(VICenlargedGreenCityPowerPngLOAD.image, context);
    precacheImage(VICenlargedWhiteCityPowerPngLOAD.image, context);
    precacheImage(VICenlargedGreenJenemaPngLOAD.image, context);
    precacheImage(VICenlargedWhiteJenemaPngLOAD.image, context);
    precacheImage(VICenlargedGreenPowercorPngLOAD.image, context);
    precacheImage(VICenlargedWhitePowercorPngLOAD.image, context);
    precacheImage(VICenlargedGreenUnitedEnergyLOAD.image, context);
    precacheImage(VICenlargedWhiteUnitedEnergyLOAD.image, context);
    precacheImage(VICnormalGreenPowercorPngLOAD.image, context);
    precacheImage(VICnormalWhitePowercorPngLOAD.image, context);
    precacheImage(VICnormalGreenAuzNetPngLOAD.image, context);
    precacheImage(VICnormalWhiteAuzNetPngLOAD.image, context);
    precacheImage(VICnormalGreenJenemaPngLOAD.image, context);
    precacheImage(VICnormalGreenCityPowerPngLOAD.image, context);
    precacheImage(VICnormalGreenUnitedEnergyLOAD.image, context);
    precacheImage(VICnormalWhiteJenemaPngLOAD.image, context);
    precacheImage(VICnormalWhiteCityPowerPngLOAD.image, context);
    precacheImage(VICnormalWhiteUnitedEnergyLOAD.image, context);
    precacheImage(NSWAusgridGreenPngLOAD.image, context);
    precacheImage(NSWAusgridPngLOAD.image, context);
    precacheImage(NSWEssentialGreenPngLOAD.image, context);
    precacheImage(NSWEssentialPngLOAD.image, context);
    precacheImage(NSWEndeavourGreenPngLOAD.image, context);
    precacheImage(NSWEndeavourPngLOAD.image, context);
    precacheImage(NSWEvoGreenPngLOAD.image, context);
    precacheImage(NSWEvoPngLOAD.image, context);
    precacheImage(onceoffChartPngLOAD.image, context);
    precacheImage(greenBubbleChartPngLOAD.image, context);
    precacheImage(holoBubbleChartPngLOAD.image, context);
    precacheImage(weeklyChartPngLOAD.image, context);
    precacheImage(greenBubbleChartWEEKLYPngLOAD.image, context);
    precacheImage(holoBubbleChartWEEKLYPngLOAD.image, context);
    precacheImage(stageBarGreenPngLOAD.image, context);
    precacheImage(ausMapPngLOAD.image, context);
    precacheImage(NSWPngLOAD.image, context);
    precacheImage(NTPngLOAD.image, context);
    precacheImage(QLDPngLOAD.image, context);
    precacheImage(SAPngLOAD.image, context);
    precacheImage(TASPngLOAD.image, context);
    precacheImage(VICPngLOAD.image, context);
    precacheImage(WAPngLOAD.image, context);
    precacheImage(NSWHoverPngLOAD.image, context);
    precacheImage(NTHoverPngLOAD.image, context);
    precacheImage(QLDHoverPngLOAD.image, context);
    precacheImage(SAHoverPngLOAD.image, context);
    precacheImage(TASHoverPngLOAD.image, context);
    precacheImage(VICHoverPngLOAD.image, context);
    precacheImage(WAHoverPngLOAD.image, context);
    precacheImage(QLDDefaultPngLOAD.image, context);
    precacheImage(VICenlargedWhiteAuzNetPngLOAD.image, context);
    precacheImage(VICenlargedGreenAuzNetPngLOAD.image, context);

    //page4
    precacheImage(shadowPngLOAD.image, context);
    precacheImage(c1PngLOAD.image, context);
    precacheImage(c2PngLOAD.image, context);
    precacheImage(c3PngLOAD.image, context);
    precacheImage(c4PngLOAD.image, context);
    precacheImage(c5PngLOAD.image, context);
    precacheImage(c51PngLOAD.image, context);
    precacheImage(c52PngLOAD.image, context);
    precacheImage(c53PngLOAD.image, context);
    precacheImage(c54PngLOAD.image, context);
    precacheImage(c55PngLOAD.image, context);
    precacheImage(alwaysPngLOAD.image, context);
    precacheImage(homePngLOAD.image, context);
    precacheImage(kitchenPngLOAD.image, context);
    precacheImage(otherPngLOAD.image, context);
    precacheImage(heatPngLOAD.image, context);
    precacheImage(w2000PngLOAD.image, context);
    precacheImage(redPngLOAD.image, context);

    //PG5
    precacheImage(iPhonePg5PngLOAD.image, context);

  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}