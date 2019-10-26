import 'package:flutter/material.dart';

import '../uidata.dart';

class MyButton extends StatelessWidget {
  final String str;
  final double rong;
  MyButton({Key key, this.str, this.rong}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  SizedBox(
        width: rong,
        height: 50,
        child: FlatButton(
          color: UIData.PrimaryColor,
          textColor: Colors.white,
          padding: EdgeInsets.all(8.0),
          onPressed: () {},
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(6.0),
              side: BorderSide(color: Colors.red)),
          child: Text(
            str,
            style: TextStyle(fontSize: 20.0),
          ),
        )
    );

  }
}
