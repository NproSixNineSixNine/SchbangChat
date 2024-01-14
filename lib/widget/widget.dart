import 'package:flutter/material.dart';

import '../helper/theme.dart';

PreferredSizeWidget appBarMain(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(40),
    child: AppBar(
      title: const Text(
        'SchbangChat',
        style: TextStyle(
            fontSize: 35,
            color: Colors.white,
            fontFamily: 'DancingScript',
            fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: Colors.blue,
    ),
  );
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white54),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)));
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 16);
}

TextStyle biggerTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 17);
}
