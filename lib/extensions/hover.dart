import 'dart:html' as html;
import 'package:flutter/material.dart';


extension Hover on Widget{ //extension on some class,pretending I am in the class and writing adding methods
  static final appContainer = html.window.document.getElementById('app-container');

  Widget get showCursorOnHover {
    return MouseRegion(
      child: this, //the widget that is used the extension upon
      onHover: (event) => appContainer.style.cursor = 'pointer',
      onExit: (event) => appContainer.style.cursor = 'default',
    );
  }



}