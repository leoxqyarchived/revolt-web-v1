import 'dart:html';
import 'dart:typed_data';
import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import "package:intl/intl.dart";
import 'materials.dart';
import 'dart:io';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';

class Utilities {

  static List<List<dynamic>> csvTable1;
  static List<List<dynamic>> csvTable2;
  static List<List<dynamic>> csvTable3;
  static List<List<dynamic>> csvTable4;
  static List<List<dynamic>> csvTable5;


  //Display
  double UI_DESIGN_WIDTH = 1600;
  double UI_DESIGN_HEIGHT = 1080;

  BuildContext context;
  bool lastScrollIsDown = true;

  double width_rate;
  double height_rate;
  double WIDTH;
  double HEIGHT;
  double aspectRatio;
  bool wider_1440;
  bool wider_1024;
  bool wider_768;

  bool userSelected = false;

  DeviceType deviceType;

  //Content Info
  PageType _currentPage;
  ValueNotifier<double> _pagePosition = new ValueNotifier<double>(0);


    //-PAGE3
  PlanType _planType = PlanType.ONCE_OFF;
  PeopleNumber _peopleNumber = PeopleNumber.TWO ;
  int actualPeopleNumber = 2;
  StateType _stateType = StateType.QLD;
  MapState _mapState = MapState.UNSELECTED;
  DistributorState _distributorState = DistributorState.UNSELECTED;


  void LoadData() async {
    final myData1 = await rootBundle.loadString("assets/data/peopleNumber1.csv");
    final myData2 = await rootBundle.loadString("assets/data/peopleNumber2.csv");
    final myData3 = await rootBundle.loadString("assets/data/peopleNumber3.csv");
    final myData4 = await rootBundle.loadString("assets/data/peopleNumber4.csv");
    final myData5 = await rootBundle.loadString("assets/data/peopleNumber5.csv");
    csvTable1 = CsvToListConverter().convert(myData1);
    csvTable2 = CsvToListConverter().convert(myData2);
    csvTable3 = CsvToListConverter().convert(myData3);
    csvTable4 = CsvToListConverter().convert(myData4);
    csvTable5 = CsvToListConverter().convert(myData5);
    print(csvTable1[2][1]);
  }

  Utilities(){
    LoadData();
  }


  void update(BuildContext context){


    print("PagePosition: " + this._pagePosition.value.toString());
    this.context = context;
    WIDTH = MediaQuery
        .of(context)
        .size
        .width;
    HEIGHT = MediaQuery
        .of(context)
        .size
        .height;

    aspectRatio = WIDTH/HEIGHT;
    print(aspectRatio);

    if (aspectRatio >= 14/8.2){
      deviceType = DeviceType.DESKTOP_WIDE;
    }
    else if (aspectRatio >= 5/4){
      deviceType = DeviceType.DESKTOP;
    }
    else if (aspectRatio >= 6/15){
      deviceType = DeviceType.TABLET;
    }
    else{
      deviceType = DeviceType.MOBILE;
    }

    wider_1440 = WIDTH >= 1440;
    wider_1024 = WIDTH >= 1024;
    wider_768 = WIDTH >= 768;

    width_rate = 1280 / UI_DESIGN_WIDTH;
    height_rate = HEIGHT < 760 ? 760 / UI_DESIGN_HEIGHT : HEIGHT / UI_DESIGN_HEIGHT;

    //desktop
    if (deviceType == DeviceType.DESKTOP_WIDE){
      print("wide desktop");
      if(HEIGHT>900){
        width_rate = WIDTH / UI_DESIGN_WIDTH;
        height_rate = aspectRatio < 1.68 || aspectRatio > 1.75 ?  WIDTH/1.68/UI_DESIGN_HEIGHT : HEIGHT / UI_DESIGN_HEIGHT ;
      }
      else {
        width_rate = 1280 / UI_DESIGN_WIDTH;
        height_rate =
        HEIGHT < 760 ? 760 / UI_DESIGN_HEIGHT : HEIGHT / UI_DESIGN_HEIGHT;
      }
    }

    else if (deviceType == DeviceType.DESKTOP){


      width_rate = WIDTH / UI_DESIGN_WIDTH;
      height_rate = aspectRatio < 1.69 || aspectRatio > 1.75 ? HEIGHT / UI_DESIGN_HEIGHT  : WIDTH/1.75/UI_DESIGN_HEIGHT;

      print("desktop");
    }

    else if (deviceType == DeviceType.TABLET){
      //TODO
      print("tablet");
    }

    else if (deviceType == DeviceType.MOBILE){
      //TODO
      print("mobile");
    }


    //desktop large
  }




  //Methods
  void _handleValueChanged(){

  }





  //getter and setters
  void setCurrentPage (PageType _currentPage){
    this._currentPage = _currentPage;
    print(this._currentPage);
  }
  PageType getCurrentPage(){
    return _currentPage;
  }
  void setActualPeopleNumber (int number){
    this.actualPeopleNumber = number;
  }
  int getActualPeopleNumber(){
    return actualPeopleNumber;
  }

  void setPlanType (PlanType _planType){
    this._planType = _planType;
    print(this._planType);
  }
  PlanType getPlanType(){
    return _planType;
  }

  void setPeopleNumber (PeopleNumber _peopleNumber){
    this._peopleNumber = _peopleNumber;
    print(this._peopleNumber);
  }
  PeopleNumber getPeopleNumber(){
    return _peopleNumber;
  }

  void setStateType (StateType _peopleNumber){
    this._stateType = _stateType;
    print(this._stateType);
  }
  StateType getStateType(){
    return _stateType;
  }

  void setMapState (MapState _mapState){
    this._mapState = _mapState;
    print(this._mapState);
  }
  MapState getMapState(){
    return _mapState;
  }

  void setPagePosition (double _position){
    this._pagePosition.value = _position;
    print("--------"+this._pagePosition.value.toString());
  }
  double getPagePosition(){
    return this._pagePosition.value;
  }

  void setDistributorState (DistributorState _distributorState){
    this._distributorState = _distributorState;
  }
  DistributorState getDistributorState (){
    return _distributorState;
  }

}






//enums

//enumc


enum DeviceType{
  DESKTOP_WIDE,
  DESKTOP,
  TABLET,
  MOBILE
}

enum PageType{
  HOME,
  TWO,
  THREE,
  FOUR,
  FIVE,
  SIGN_IN
}

enum PlanType{
  WEEKLY,
  ONCE_OFF
}

enum PeopleNumber{
  ONE,
  TWO,
  THREE,
  FOUR,
  FIVE_MORE,
}

enum StateType{
  UNSELECTED,
  NSW,
  QLD,
  SA,
  TAS,
  VIC,
  WA,
  NT,
}

enum MapState{
  UNSELECTED,
  NSW,
  QLD,
  SA,
  TAS,
  VIC,
  WA,
  NT,
  SELECTED,
  REGULATED,
  UNDER_REVIEW,
}

enum DistributorState{
  UNSELECTED,
  JEMANA,
  AUSNET,
  POWERCOR,
  CITIPOWER,
  UNITEDENERGY,
  ENDEVOUR,
  ESSENTIALENERGY,
  AUSGRID,
  ENERGEX,
  ERGON,
  SAPOWER,
  TASNETWORK,
  EVOENERGY,
  SYNERGY,
  HORIZON,
  NT
}



class PlanPackage{
  PlanType planType;
  PeopleNumber peopleNumber;
  DistributorState distributorState;

  int longTermCostPerYear;
  int firstYearCost;
  int firstYearMonthlyCost;
  int longTermMonthlyCost;
  int bestCompetitorMonthlyCost;
  int referencePrice;
  String referenceText;


  PlanPackage(){
    planType = PlanType.ONCE_OFF;
    peopleNumber = PeopleNumber.TWO;
    distributorState = DistributorState.UNSELECTED;

    longTermCostPerYear = (Utilities.csvTable2[2][9] as double).round();
    longTermMonthlyCost = (Utilities.csvTable2[3][9] as double).round();
    firstYearCost = longTermCostPerYear + 500;
    firstYearMonthlyCost= (Utilities.csvTable2[4][9] as double).round();
    bestCompetitorMonthlyCost = (Utilities.csvTable2[7][9] as double).round();
    referencePrice = (Utilities.csvTable2[8][9]*100 as double).round();

    referenceText = "Reference Price";
  }



  void calculate(){

    referenceText = "Reference Price";
    if (planType == PlanType.ONCE_OFF){
      switch(peopleNumber){
        case PeopleNumber.ONE:
          switch(distributorState){
            case DistributorState.UNSELECTED:
              longTermCostPerYear = (Utilities.csvTable1[2][1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable1[3][1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable1[4][1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][1] as double).round();
              referencePrice = (Utilities.csvTable1[8][1]*100 as double).round();
              break;
            case DistributorState.CITIPOWER:
              longTermCostPerYear = (Utilities.csvTable1[2][1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable1[3][1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable1[4][1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][1] as double).round();
              referencePrice = (Utilities.csvTable1[8][1]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.JEMANA:
              longTermCostPerYear = (Utilities.csvTable1[2][2] as double).round();
              longTermMonthlyCost = (Utilities.csvTable1[3][2] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable1[4][2] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][2] as double).round();
              referencePrice = (Utilities.csvTable1[8][2]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.UNITEDENERGY:
              longTermCostPerYear = (Utilities.csvTable1[2][3] as double).round();
              longTermMonthlyCost = (Utilities.csvTable1[3][3] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable1[4][3] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][3] as double).round();
              referencePrice = (Utilities.csvTable1[8][3]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.POWERCOR:
              longTermCostPerYear = (Utilities.csvTable1[2][4] as double).round();
              longTermMonthlyCost = (Utilities.csvTable1[3][4] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable1[4][4] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][4] as double).round();
              referencePrice = (Utilities.csvTable1[8][4]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.AUSNET:
              longTermCostPerYear = (Utilities.csvTable1[2][5] as double).round();
              longTermMonthlyCost = (Utilities.csvTable1[3][5] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable1[4][5] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][5] as double).round();
              referencePrice = (Utilities.csvTable1[8][5]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.ENDEVOUR:
              longTermCostPerYear = (Utilities.csvTable1[2][6] as double).round();
              longTermMonthlyCost = (Utilities.csvTable1[3][6] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable1[4][6] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][6] as double).round();
              referencePrice = (Utilities.csvTable1[8][6]*100 as double).round();
              break;
            case DistributorState.ESSENTIALENERGY:
              longTermCostPerYear = (Utilities.csvTable1[2][7] as double).round();
              longTermMonthlyCost = (Utilities.csvTable1[3][7] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable1[4][7] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][7] as double).round();
              referencePrice = (Utilities.csvTable1[8][7]*100 as double).round();
              break;
            case DistributorState.AUSGRID:
              longTermCostPerYear = (Utilities.csvTable1[2][8] as double).round();
              longTermMonthlyCost = (Utilities.csvTable1[3][8] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable1[4][8] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][8] as double).round();
              referencePrice = (Utilities.csvTable1[8][8]*100 as double).round();
              break;
            case DistributorState.ENERGEX:
              longTermCostPerYear = (Utilities.csvTable1[2][9] as double).round();
              longTermMonthlyCost = (Utilities.csvTable1[3][9] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable1[4][9] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][9] as double).round();
              referencePrice = (Utilities.csvTable1[8][9]*100 as double).round();
              break;
            case DistributorState.ERGON:
              longTermCostPerYear = (Utilities.csvTable1[2][11-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable1[3][11-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable1[4][11-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][10] as double).round();
              referencePrice = (Utilities.csvTable1[8][10]*100 as double).round();
              break;
            case DistributorState.SAPOWER:
              longTermCostPerYear = (Utilities.csvTable1[2][12-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable1[3][12-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable1[4][12-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][11] as double).round();
              referencePrice = (Utilities.csvTable1[8][11]*100 as double).round();
              break;
            case DistributorState.TASNETWORK:
              longTermCostPerYear = (Utilities.csvTable1[2][13-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable1[3][13-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable1[4][13-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][12] as double).round();
              referencePrice = (Utilities.csvTable1[8][12]*100 as double).round();
              break;
            case DistributorState.EVOENERGY:
              longTermCostPerYear = (Utilities.csvTable1[2][14-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable1[3][14-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable1[4][14-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][13] as double).round();
              referencePrice = (Utilities.csvTable1[8][13]*100 as double).round();
              break;
          }
              break;

        case PeopleNumber.TWO:
          switch(distributorState){
            case DistributorState.UNSELECTED:
              longTermCostPerYear = (Utilities.csvTable2[2][1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable2[3][1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable2[4][1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][1] as double).round();
              referencePrice = (Utilities.csvTable2[8][1]*100 as double).round();
              break;
            case DistributorState.CITIPOWER:
              longTermCostPerYear = (Utilities.csvTable2[2][1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable2[3][1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable2[4][1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][1] as double).round();
              referencePrice = (Utilities.csvTable2[8][1]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.JEMANA:
              longTermCostPerYear = (Utilities.csvTable2[2][2] as double).round();
              longTermMonthlyCost = (Utilities.csvTable2[3][2] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable2[4][2] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][2] as double).round();
              referencePrice = (Utilities.csvTable2[8][2]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.UNITEDENERGY:
              longTermCostPerYear = (Utilities.csvTable2[2][3] as double).round();
              longTermMonthlyCost = (Utilities.csvTable2[3][3] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable2[4][3] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][3] as double).round();
              referencePrice = (Utilities.csvTable2[8][3]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.POWERCOR:
              longTermCostPerYear = (Utilities.csvTable2[2][4] as double).round();
              longTermMonthlyCost = (Utilities.csvTable2[3][4] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable2[4][4] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][4] as double).round();
              referencePrice = (Utilities.csvTable2[8][4]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.AUSNET:
              longTermCostPerYear = (Utilities.csvTable2[2][5] as double).round();
              longTermMonthlyCost = (Utilities.csvTable2[3][5] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable2[4][5] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][5] as double).round();
              referencePrice = (Utilities.csvTable2[8][5]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.ENDEVOUR:
              longTermCostPerYear = (Utilities.csvTable2[2][6] as double).round();
              longTermMonthlyCost = (Utilities.csvTable2[3][6] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable2[4][6] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][6] as double).round();
              referencePrice = (Utilities.csvTable2[8][6]*100 as double).round();
              break;
            case DistributorState.ESSENTIALENERGY:
              longTermCostPerYear = (Utilities.csvTable2[2][7] as double).round();
              longTermMonthlyCost = (Utilities.csvTable2[3][7] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable2[4][7] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][7] as double).round();
              referencePrice = (Utilities.csvTable2[8][7]*100 as double).round();
              break;
            case DistributorState.AUSGRID:
              longTermCostPerYear = (Utilities.csvTable2[2][8] as double).round();
              longTermMonthlyCost = (Utilities.csvTable2[3][8] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable2[4][8] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][8] as double).round();
              referencePrice = (Utilities.csvTable2[8][8]*100 as double).round();
              break;
            case DistributorState.ENERGEX:
              longTermCostPerYear = (Utilities.csvTable2[2][9] as double).round();
              longTermMonthlyCost = (Utilities.csvTable2[3][9] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable2[4][9] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][9] as double).round();
              referencePrice = (Utilities.csvTable2[8][9]*100 as double).round();
              break;
            case DistributorState.ERGON:
              longTermCostPerYear = (Utilities.csvTable2[2][10] as double).round();
              longTermMonthlyCost = (Utilities.csvTable2[3][10] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable2[4][10] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][10] as double).round();
              referencePrice = (Utilities.csvTable2[8][10]*100 as double).round();
              break;
            case DistributorState.SAPOWER:
              longTermCostPerYear = (Utilities.csvTable2[2][11] as double).round();
              longTermMonthlyCost = (Utilities.csvTable2[3][11] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable2[4][11] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][11] as double).round();
              referencePrice = (Utilities.csvTable2[8][11]*100 as double).round();
              break;
            case DistributorState.TASNETWORK:
              longTermCostPerYear = (Utilities.csvTable2[2][12] as double).round();
              longTermMonthlyCost = (Utilities.csvTable2[3][12] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable2[4][12] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][12] as double).round();
              referencePrice = (Utilities.csvTable2[8][12]*100 as double).round();
              break;
            case DistributorState.EVOENERGY:
              longTermCostPerYear = (Utilities.csvTable2[2][13] as double).round();
              longTermMonthlyCost = (Utilities.csvTable2[3][13] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable2[4][13] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][13] as double).round();
              referencePrice = (Utilities.csvTable2[8][13]*100 as double).round();
              break;
          }
              break;

        case PeopleNumber.THREE:
          switch(distributorState){
            case DistributorState.UNSELECTED:
              longTermCostPerYear = (Utilities.csvTable3[2][1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable3[3][1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable3[4][1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][1] as double).round();
              referencePrice = (Utilities.csvTable3[8][1]*100 as double).round();
              break;
            case DistributorState.CITIPOWER:
              longTermCostPerYear = (Utilities.csvTable3[2][2-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable3[3][2-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable3[4][2-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][1] as double).round();
              referencePrice = (Utilities.csvTable3[8][1]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.JEMANA:
              longTermCostPerYear = (Utilities.csvTable3[2][3-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable3[3][3-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable3[4][3-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][2] as double).round();
              referencePrice = (Utilities.csvTable3[8][2]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.UNITEDENERGY:
              longTermCostPerYear = (Utilities.csvTable3[2][4-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable3[3][4-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable3[4][4-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][3] as double).round();
              referencePrice = (Utilities.csvTable3[8][3]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.POWERCOR:
              longTermCostPerYear = (Utilities.csvTable3[2][5-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable3[3][5-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable3[4][5-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][4] as double).round();
              referencePrice = (Utilities.csvTable3[8][4]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.AUSNET:
              longTermCostPerYear = (Utilities.csvTable3[2][6-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable3[3][6-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable3[4][6-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][5] as double).round();
              referencePrice = (Utilities.csvTable3[8][5]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.ENDEVOUR:
              longTermCostPerYear = (Utilities.csvTable3[2][7-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable3[3][7-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable3[4][7-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][6] as double).round();
              referencePrice = (Utilities.csvTable3[8][6]*100 as double).round();
              break;
            case DistributorState.ESSENTIALENERGY:
              longTermCostPerYear = (Utilities.csvTable3[2][8-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable3[3][8-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable3[4][8-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][7] as double).round();
              referencePrice = (Utilities.csvTable3[8][7]*100 as double).round();
              break;
            case DistributorState.AUSGRID:
              longTermCostPerYear = (Utilities.csvTable3[2][9-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable3[3][9-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable3[4][9-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][8] as double).round();
              referencePrice = (Utilities.csvTable3[8][8]*100 as double).round();
              break;
            case DistributorState.ENERGEX:
              longTermCostPerYear = (Utilities.csvTable3[2][10-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable3[3][10-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable3[4][10-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][9] as double).round();
              referencePrice = (Utilities.csvTable3[8][9]*100 as double).round();
              break;
            case DistributorState.ERGON:
              longTermCostPerYear = (Utilities.csvTable3[2][11-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable3[3][11-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable3[4][11-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][10] as double).round();
              referencePrice = (Utilities.csvTable3[8][10]*100 as double).round();
              break;
            case DistributorState.SAPOWER:
              longTermCostPerYear = (Utilities.csvTable3[2][12-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable3[3][12-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable3[4][12-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][11] as double).round();
              referencePrice = (Utilities.csvTable3[8][11]*100 as double).round();
              break;
            case DistributorState.TASNETWORK:
              longTermCostPerYear = (Utilities.csvTable3[2][13-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable3[3][13-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable3[4][13-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][12] as double).round();
              referencePrice = (Utilities.csvTable3[8][12]*100 as double).round();
              break;
            case DistributorState.EVOENERGY:
              longTermCostPerYear = (Utilities.csvTable3[2][14-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable3[3][14-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable3[4][14-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][13] as double).round();
              referencePrice = (Utilities.csvTable3[8][13]*100 as double).round();
              break;
          }
              break;

        case PeopleNumber.FOUR:
          switch(distributorState){
            case DistributorState.UNSELECTED:
              longTermCostPerYear = (Utilities.csvTable4[2][1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable4[3][1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable4[4][1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][1] as double).round();
              referencePrice = (Utilities.csvTable4[8][1]*100 as double).round();
              break;
            case DistributorState.CITIPOWER:
              longTermCostPerYear = (Utilities.csvTable4[2][2-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable4[3][2-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable4[4][2-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][1] as double).round();
              referencePrice = (Utilities.csvTable4[8][1]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.JEMANA:
              longTermCostPerYear = (Utilities.csvTable4[2][3-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable4[3][3-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable4[4][3-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][2] as double).round();
              referencePrice = (Utilities.csvTable4[8][2]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.UNITEDENERGY:
              longTermCostPerYear = (Utilities.csvTable4[2][4-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable4[3][4-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable4[4][4-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][3] as double).round();
              referencePrice = (Utilities.csvTable4[8][3]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.POWERCOR:
              longTermCostPerYear = (Utilities.csvTable4[2][5-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable4[3][5-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable4[4][5-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][4] as double).round();
              referencePrice = (Utilities.csvTable4[8][4]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.AUSNET:
              longTermCostPerYear = (Utilities.csvTable4[2][6-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable4[3][6-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable4[4][6-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][5] as double).round();
              referencePrice = (Utilities.csvTable4[8][5]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.ENDEVOUR:
              longTermCostPerYear = (Utilities.csvTable4[2][7-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable4[3][7-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable4[4][7-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][6] as double).round();
              referencePrice = (Utilities.csvTable4[8][6]*100 as double).round();
              break;
            case DistributorState.ESSENTIALENERGY:
              longTermCostPerYear = (Utilities.csvTable4[2][8-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable4[3][8-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable4[4][8-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][7] as double).round();
              referencePrice = (Utilities.csvTable4[8][7]*100 as double).round();
              break;
            case DistributorState.AUSGRID:
              longTermCostPerYear = (Utilities.csvTable4[2][9-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable4[3][9-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable4[4][9-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][8] as double).round();
              referencePrice = (Utilities.csvTable4[8][8]*100 as double).round();
              break;
            case DistributorState.ENERGEX:
              longTermCostPerYear = (Utilities.csvTable4[2][10-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable4[3][10-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable4[4][10-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][9] as double).round();
              referencePrice = (Utilities.csvTable4[8][9]*100 as double).round();
              break;
            case DistributorState.ERGON:
              longTermCostPerYear = (Utilities.csvTable4[2][11-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable4[3][11-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable4[4][11-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][10] as double).round();
              referencePrice = (Utilities.csvTable4[8][10]*100 as double).round();
              break;
            case DistributorState.SAPOWER:
              longTermCostPerYear = (Utilities.csvTable4[2][12-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable4[3][12-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable4[4][12-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][11] as double).round();
              referencePrice = (Utilities.csvTable4[8][11]*100 as double).round();
              break;
            case DistributorState.TASNETWORK:
              longTermCostPerYear = (Utilities.csvTable4[2][13-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable4[3][13-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable4[4][13-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][12] as double).round();
              referencePrice = (Utilities.csvTable4[8][12]*100 as double).round();
              break;
            case DistributorState.EVOENERGY:
              longTermCostPerYear = (Utilities.csvTable4[2][14-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable4[3][14-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable4[4][14-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][13] as double).round();
              referencePrice = (Utilities.csvTable4[8][13]*100 as double).round();
              break;
          }
              break;


        case PeopleNumber.FIVE_MORE:
          switch(distributorState){
            case DistributorState.UNSELECTED:
              longTermCostPerYear = (Utilities.csvTable5[2][1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable5[3][1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable5[4][1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][1] as double).round();
              referencePrice = (Utilities.csvTable5[8][1]*100 as double).round();
              break;
            case DistributorState.CITIPOWER:
              longTermCostPerYear = (Utilities.csvTable5[2][2-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable5[3][2-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable5[4][2-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][1] as double).round();
              referencePrice = (Utilities.csvTable5[8][1]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.JEMANA:
              longTermCostPerYear = (Utilities.csvTable5[2][3-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable5[3][3-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable5[4][3-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][2] as double).round();
              referencePrice = (Utilities.csvTable5[8][2]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.UNITEDENERGY:
              longTermCostPerYear = (Utilities.csvTable5[2][4-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable5[3][4-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable5[4][4-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][3] as double).round();
              referencePrice = (Utilities.csvTable5[8][3]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.POWERCOR:
              longTermCostPerYear = (Utilities.csvTable5[2][5-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable5[3][5-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable5[4][5-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][4] as double).round();
              referencePrice = (Utilities.csvTable5[8][4]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.AUSNET:
              longTermCostPerYear = (Utilities.csvTable5[2][6-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable5[3][6-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable5[4][6-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][5] as double).round();
              referencePrice = (Utilities.csvTable5[8][5]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.ENDEVOUR:
              longTermCostPerYear = (Utilities.csvTable5[2][7-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable5[3][7-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable5[4][7-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][6] as double).round();
              referencePrice = (Utilities.csvTable5[8][6]*100 as double).round();
              break;
            case DistributorState.ESSENTIALENERGY:
              longTermCostPerYear = (Utilities.csvTable5[2][8-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable5[3][8-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable5[4][8-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][7] as double).round();
              referencePrice = (Utilities.csvTable5[8][7]*100 as double).round();
              break;
            case DistributorState.AUSGRID:
              longTermCostPerYear = (Utilities.csvTable5[2][9-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable5[3][9-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable5[4][9-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][8] as double).round();
              referencePrice = (Utilities.csvTable5[8][8]*100 as double).round();
              break;
            case DistributorState.ENERGEX:
              longTermCostPerYear = (Utilities.csvTable5[2][10-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable5[3][10-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable5[4][10-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][9] as double).round();
              referencePrice = (Utilities.csvTable5[8][9]*100 as double).round();
              break;
            case DistributorState.ERGON:
              longTermCostPerYear = (Utilities.csvTable5[2][11-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable5[3][11-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable5[4][11-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][10] as double).round();
              referencePrice = (Utilities.csvTable5[8][10]*100 as double).round();
              break;
            case DistributorState.SAPOWER:
              longTermCostPerYear = (Utilities.csvTable5[2][12-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable5[3][12-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable5[4][12-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][11] as double).round();
              referencePrice = (Utilities.csvTable5[8][11]*100 as double).round();
              break;
            case DistributorState.TASNETWORK:
              longTermCostPerYear = (Utilities.csvTable5[2][13-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable5[3][13-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable5[4][13-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][12] as double).round();
              referencePrice = (Utilities.csvTable5[8][12]*100 as double).round();
              break;
            case DistributorState.EVOENERGY:
              longTermCostPerYear = (Utilities.csvTable5[2][14-1] as double).round();
              longTermMonthlyCost = (Utilities.csvTable5[3][14-1] as double).round();
              firstYearCost = longTermCostPerYear + 500;
              firstYearMonthlyCost= (Utilities.csvTable5[4][14-1] as double).round();
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][13] as double).round();
              referencePrice = (Utilities.csvTable5[8][13]*100 as double).round();
              break;
          }
              break;

      }
    }

    else {
      switch (peopleNumber) {
        case PeopleNumber.ONE:
          switch(distributorState){
            case DistributorState.UNSELECTED:
              longTermCostPerYear = (Utilities.csvTable1[5][1] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable1[6][1] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][1] as double).round();
              referencePrice = (Utilities.csvTable1[9][1]*100 as double).round();
              break;
            case DistributorState.CITIPOWER:
              longTermCostPerYear = (Utilities.csvTable1[5][1] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable1[6][1] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][1] as double).round();
              referencePrice = (Utilities.csvTable1[9][1]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.JEMANA:
              longTermCostPerYear = (Utilities.csvTable1[5][2] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable1[6][2] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][2] as double).round();
              referencePrice = (Utilities.csvTable1[9][2]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.UNITEDENERGY:
              longTermCostPerYear = (Utilities.csvTable1[5][3] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable1[6][3] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][3] as double).round();
              referencePrice = (Utilities.csvTable1[9][3]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.POWERCOR:
              longTermCostPerYear = (Utilities.csvTable1[5][4] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable1[6][4] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][4] as double).round();
              referencePrice = (Utilities.csvTable1[9][4]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.AUSNET:
              longTermCostPerYear = (Utilities.csvTable1[5][5] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable1[6][5] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][5] as double).round();
              referencePrice = (Utilities.csvTable1[9][5]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.ENDEVOUR:
              longTermCostPerYear = (Utilities.csvTable1[5][6] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable1[6][6] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][6] as double).round();
              referencePrice = (Utilities.csvTable1[9][6]*100 as double).round();
              break;
            case DistributorState.ESSENTIALENERGY:
              longTermCostPerYear = (Utilities.csvTable1[5][7] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable1[6][7] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][7] as double).round();
              referencePrice = (Utilities.csvTable1[9][7]*100 as double).round();
              break;
            case DistributorState.AUSGRID:
              longTermCostPerYear = (Utilities.csvTable1[5][8] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable1[6][8] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][8] as double).round();
              referencePrice = (Utilities.csvTable1[9][8]*100 as double).round();
              break;
            case DistributorState.ENERGEX:
              longTermCostPerYear = (Utilities.csvTable1[5][9] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable1[6][9] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][9] as double).round();
              referencePrice = (Utilities.csvTable1[9][9]*100 as double).round();
              break;
            case DistributorState.ERGON:
              longTermCostPerYear = (Utilities.csvTable1[5][10] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable1[6][10] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][10] as double).round();
              referencePrice = (Utilities.csvTable1[9][10]*100 as double).round();
              break;
            case DistributorState.SAPOWER:
              longTermCostPerYear = (Utilities.csvTable1[5][11] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable1[6][11] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][11] as double).round();
              referencePrice = (Utilities.csvTable1[9][11]*100 as double).round();
              break;
            case DistributorState.TASNETWORK:
              longTermCostPerYear = (Utilities.csvTable1[5][12] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable1[6][12] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][12] as double).round();
              referencePrice = (Utilities.csvTable1[9][12]*100 as double).round();
              break;
            case DistributorState.EVOENERGY:
              longTermCostPerYear = (Utilities.csvTable1[5][13] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable1[6][13] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable1[7][13] as double).round();
              referencePrice = (Utilities.csvTable1[9][13]*100 as double).round();
              break;
          };
              break;



        case PeopleNumber.TWO:
          switch(distributorState){
            case DistributorState.UNSELECTED:
              longTermCostPerYear = (Utilities.csvTable2[5][1] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable2[6][1] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][1] as double).round();
              referencePrice = (Utilities.csvTable2[9][1]*100 as double).round();
              break;
            case DistributorState.CITIPOWER:
              longTermCostPerYear = (Utilities.csvTable2[5][1] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable2[6][1] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][1] as double).round();
              referencePrice = (Utilities.csvTable2[9][1]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.JEMANA:
              longTermCostPerYear = (Utilities.csvTable2[5][2] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable2[6][2] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][2] as double).round();
              referencePrice = (Utilities.csvTable2[9][2]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.UNITEDENERGY:
              longTermCostPerYear = (Utilities.csvTable2[5][3] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable2[6][3] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][3] as double).round();
              referencePrice = (Utilities.csvTable2[9][3]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.POWERCOR:
              longTermCostPerYear = (Utilities.csvTable2[5][4] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable2[6][4] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][4] as double).round();
              referencePrice = (Utilities.csvTable2[9][4]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.AUSNET:
              longTermCostPerYear = (Utilities.csvTable2[5][5] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable2[6][5] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][5] as double).round();
              referencePrice = (Utilities.csvTable2[9][5]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.ENDEVOUR:
              longTermCostPerYear = (Utilities.csvTable2[5][6] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable2[6][6] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][6] as double).round();
              referencePrice = (Utilities.csvTable2[9][6]*100 as double).round();
              break;
            case DistributorState.ESSENTIALENERGY:
              longTermCostPerYear = (Utilities.csvTable2[5][7] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable2[6][7] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][7] as double).round();
              referencePrice = (Utilities.csvTable2[9][7]*100 as double).round();
              break;
            case DistributorState.AUSGRID:
              longTermCostPerYear = (Utilities.csvTable2[5][8] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable2[6][8] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][8] as double).round();
              referencePrice = (Utilities.csvTable2[9][8]*100 as double).round();
              break;
            case DistributorState.ENERGEX:
              longTermCostPerYear = (Utilities.csvTable2[5][9] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable2[6][9] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][9] as double).round();
              referencePrice = (Utilities.csvTable2[9][9]*100 as double).round();
              break;
            case DistributorState.ERGON:
              longTermCostPerYear = (Utilities.csvTable2[5][10] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable2[6][10] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][10] as double).round();
              referencePrice = (Utilities.csvTable2[9][10]*100 as double).round();
              break;
            case DistributorState.SAPOWER:
              longTermCostPerYear = (Utilities.csvTable2[5][11] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable2[6][11] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][11] as double).round();
              referencePrice = (Utilities.csvTable2[9][11]*100 as double).round();
              break;
            case DistributorState.TASNETWORK:
              longTermCostPerYear = (Utilities.csvTable2[5][12] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable2[6][12] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][12] as double).round();
              referencePrice = (Utilities.csvTable2[9][12]*100 as double).round();
              break;
            case DistributorState.EVOENERGY:
              longTermCostPerYear = (Utilities.csvTable2[5][13] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable2[6][13] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable2[7][13] as double).round();
              referencePrice = (Utilities.csvTable2[9][13]*100 as double).round();
              break;
          };
              break;


        case PeopleNumber.THREE:
          switch(distributorState){
            case DistributorState.UNSELECTED:
              longTermCostPerYear = (Utilities.csvTable3[5][1] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable3[6][1] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][1] as double).round();
              referencePrice = (Utilities.csvTable3[9][1]*100 as double).round();
              break;
            case DistributorState.CITIPOWER:
              longTermCostPerYear = (Utilities.csvTable3[5][1] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable3[6][1] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][1] as double).round();
              referencePrice = (Utilities.csvTable3[9][1]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.JEMANA:
              longTermCostPerYear = (Utilities.csvTable3[5][2] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable3[6][2] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][2] as double).round();
              referencePrice = (Utilities.csvTable3[9][2]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.UNITEDENERGY:
              longTermCostPerYear = (Utilities.csvTable3[5][3] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable3[6][3] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][3] as double).round();
              referencePrice = (Utilities.csvTable3[9][3]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.POWERCOR:
              longTermCostPerYear = (Utilities.csvTable3[5][4] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable3[6][4] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][4] as double).round();
              referencePrice = (Utilities.csvTable3[9][4]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.AUSNET:
              longTermCostPerYear = (Utilities.csvTable3[5][5] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable3[6][5] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][5] as double).round();
              referencePrice = (Utilities.csvTable3[9][5]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.ENDEVOUR:
              longTermCostPerYear = (Utilities.csvTable3[5][6] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable3[6][6] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][6] as double).round();
              referencePrice = (Utilities.csvTable3[9][6]*100 as double).round();
              break;
            case DistributorState.ESSENTIALENERGY:
              longTermCostPerYear = (Utilities.csvTable3[5][7] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable3[6][7] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][7] as double).round();
              referencePrice = (Utilities.csvTable3[9][7]*100 as double).round();
              break;
            case DistributorState.AUSGRID:
              longTermCostPerYear = (Utilities.csvTable3[5][8] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable3[6][8] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][8] as double).round();
              referencePrice = (Utilities.csvTable3[9][8]*100 as double).round();
              break;
            case DistributorState.ENERGEX:
              longTermCostPerYear = (Utilities.csvTable3[5][9] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable3[6][9] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][9] as double).round();
              referencePrice = (Utilities.csvTable3[9][9]*100 as double).round();
              break;
            case DistributorState.ERGON:
              longTermCostPerYear = (Utilities.csvTable3[5][10] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable3[6][10] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][10] as double).round();
              referencePrice = (Utilities.csvTable3[9][10]*100 as double).round();
              break;
            case DistributorState.SAPOWER:
              longTermCostPerYear = (Utilities.csvTable3[5][11] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable3[6][11] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][11] as double).round();
              referencePrice = (Utilities.csvTable3[9][11]*100 as double).round();
              break;
            case DistributorState.TASNETWORK:
              longTermCostPerYear = (Utilities.csvTable3[5][12] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable3[6][12] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][12] as double).round();
              referencePrice = (Utilities.csvTable3[9][12]*100 as double).round();
              break;
            case DistributorState.EVOENERGY:
              longTermCostPerYear = (Utilities.csvTable3[5][13] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable3[6][13] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable3[7][13] as double).round();
              referencePrice = (Utilities.csvTable3[9][13]*100 as double).round();
              break;
          };
              break;


        case PeopleNumber.FOUR:
          switch(distributorState){
            case DistributorState.UNSELECTED:
              longTermCostPerYear = (Utilities.csvTable4[5][1] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable4[6][1] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][1] as double).round();
              referencePrice = (Utilities.csvTable4[9][1]*100 as double).round();
              break;
            case DistributorState.CITIPOWER:
              longTermCostPerYear = (Utilities.csvTable4[5][1] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable4[6][1] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][1] as double).round();
              referencePrice = (Utilities.csvTable4[9][1]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.JEMANA:
              longTermCostPerYear = (Utilities.csvTable4[5][2] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable4[6][2] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][2] as double).round();
              referencePrice = (Utilities.csvTable4[9][2]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.UNITEDENERGY:
              longTermCostPerYear = (Utilities.csvTable4[5][3] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable4[6][3] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][3] as double).round();
              referencePrice = (Utilities.csvTable4[9][3]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.POWERCOR:
              longTermCostPerYear = (Utilities.csvTable4[5][4] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable4[6][4] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][4] as double).round();
              referencePrice = (Utilities.csvTable4[9][4]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.AUSNET:
              longTermCostPerYear = (Utilities.csvTable4[5][5] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable4[6][5] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][5] as double).round();
              referencePrice = (Utilities.csvTable4[9][5]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.ENDEVOUR:
              longTermCostPerYear = (Utilities.csvTable4[5][6] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable4[6][6] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][6] as double).round();
              referencePrice = (Utilities.csvTable4[9][6]*100 as double).round();
              break;
            case DistributorState.ESSENTIALENERGY:
              longTermCostPerYear = (Utilities.csvTable4[5][7] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable4[6][7] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][7] as double).round();
              referencePrice = (Utilities.csvTable4[9][7]*100 as double).round();
              break;
            case DistributorState.AUSGRID:
              longTermCostPerYear = (Utilities.csvTable4[5][8] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable4[6][8] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][8] as double).round();
              referencePrice = (Utilities.csvTable4[9][8]*100 as double).round();
              break;
            case DistributorState.ENERGEX:
              longTermCostPerYear = (Utilities.csvTable4[5][9] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable4[6][9] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][9] as double).round();
              referencePrice = (Utilities.csvTable4[9][9]*100 as double).round();
              break;
            case DistributorState.ERGON:
              longTermCostPerYear = (Utilities.csvTable4[5][10] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable4[6][10] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][10] as double).round();
              referencePrice = (Utilities.csvTable4[9][10]*100 as double).round();
              break;
            case DistributorState.SAPOWER:
              longTermCostPerYear = (Utilities.csvTable4[5][11] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable4[6][11] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][11] as double).round();
              referencePrice = (Utilities.csvTable4[9][11]*100 as double).round();
              break;
            case DistributorState.TASNETWORK:
              longTermCostPerYear = (Utilities.csvTable4[5][12] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable4[6][12] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][12] as double).round();
              referencePrice = (Utilities.csvTable4[9][12]*100 as double).round();
              break;
            case DistributorState.EVOENERGY:
              longTermCostPerYear = (Utilities.csvTable4[5][13] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable4[6][13] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable4[7][13] as double).round();
              referencePrice = (Utilities.csvTable4[9][13]*100 as double).round();
              break;
          };
              break;


        case PeopleNumber.FIVE_MORE:
          switch(distributorState){
            case DistributorState.UNSELECTED:
              longTermCostPerYear = (Utilities.csvTable5[5][1] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable5[6][1] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][1] as double).round();
              referencePrice = (Utilities.csvTable5[9][1]*100 as double).round();
              break;
            case DistributorState.CITIPOWER:
              longTermCostPerYear = (Utilities.csvTable5[5][1] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable5[6][1] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][1] as double).round();
              referencePrice = (Utilities.csvTable5[9][1]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.JEMANA:
              longTermCostPerYear = (Utilities.csvTable5[5][2] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable5[6][2] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][2] as double).round();
              referencePrice = (Utilities.csvTable5[9][2]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.UNITEDENERGY:
              longTermCostPerYear = (Utilities.csvTable5[5][3] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable5[6][3] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][3] as double).round();
              referencePrice = (Utilities.csvTable5[9][3]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.POWERCOR:
              longTermCostPerYear = (Utilities.csvTable5[5][4] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable5[6][4] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][4] as double).round();
              referencePrice = (Utilities.csvTable5[9][4]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.AUSNET:
              longTermCostPerYear = (Utilities.csvTable5[5][5] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable5[6][5] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][5] as double).round();
              referencePrice = (Utilities.csvTable5[9][5]*100 as double).round();
              referenceText = "Victorian Default Offer";
              break;
            case DistributorState.ENDEVOUR:
              longTermCostPerYear = (Utilities.csvTable5[5][6] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable5[6][6] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][6] as double).round();
              referencePrice = (Utilities.csvTable5[9][6]*100 as double).round();
              break;
            case DistributorState.ESSENTIALENERGY:
              longTermCostPerYear = (Utilities.csvTable5[5][7] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable5[6][7] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][7] as double).round();
              referencePrice = (Utilities.csvTable5[9][7]*100 as double).round();
              break;
            case DistributorState.AUSGRID:
              longTermCostPerYear = (Utilities.csvTable5[5][8] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable5[6][8] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][8] as double).round();
              referencePrice = (Utilities.csvTable5[9][8]*100 as double).round();
              break;
            case DistributorState.ENERGEX:
              longTermCostPerYear = (Utilities.csvTable5[5][9] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable5[6][9] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][9] as double).round();
              referencePrice = (Utilities.csvTable5[9][9]*100 as double).round();
              break;
            case DistributorState.ERGON:
              longTermCostPerYear = (Utilities.csvTable5[5][10] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable5[6][10] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][10] as double).round();
              referencePrice = (Utilities.csvTable5[9][10]*100 as double).round();
              break;
            case DistributorState.SAPOWER:
              longTermCostPerYear = (Utilities.csvTable5[5][11] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable5[6][11] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][11] as double).round();
              referencePrice = (Utilities.csvTable5[9][11]*100 as double).round();
              break;
            case DistributorState.TASNETWORK:
              longTermCostPerYear = (Utilities.csvTable5[5][12] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable5[6][12] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][12] as double).round();
              referencePrice = (Utilities.csvTable5[9][12]*100 as double).round();
              break;
            case DistributorState.EVOENERGY:
              longTermCostPerYear = (Utilities.csvTable5[5][13] as double).round();
              firstYearMonthlyCost = (Utilities.csvTable5[6][13] as double).round();
              firstYearCost = longTermCostPerYear;
              longTermMonthlyCost = firstYearMonthlyCost;
              bestCompetitorMonthlyCost = (Utilities.csvTable5[7][13] as double).round();
              referencePrice = (Utilities.csvTable5[9][13]*100 as double).round();
              break;
          };
          break;
      }

    }


    print("called-----\nplanType: "+planType.toString()+"\npeopleNumber: "+peopleNumber.toString()
        +"\ndistributorState: "+distributorState.toString());
    print("longTermCostPerYear: "+longTermCostPerYear.toString());
    print("firstYearCost: "+firstYearCost.toString());
    print("firstYearMonthlyCost: "+firstYearMonthlyCost.toString());
    print("longTermMonthlyCost: "+longTermMonthlyCost.toString());

  }

}
