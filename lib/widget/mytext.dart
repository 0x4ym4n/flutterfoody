import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  MyText({Key key, this.str}) : super(key: key);
  final String str;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(str,style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),);
  }
}
