import 'package:flutter/material.dart';
import 'package:flutterfoody/widget/mybutton.dart';
import 'package:flutterfoody/widget/mytext.dart';

import '../uidata.dart';

class ForgotPassPage extends StatefulWidget {
  ForgotPassPage({Key key}) : super(key: key);

  @override
  _ForgotPassPageState createState() {
    return _ForgotPassPageState();
  }
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        //leading: Icon(Icons.arrow_back_ios,color: UIData.PrimaryColor,),
        backgroundColor: UIData.Bassic2light,
        //title: new Text("Back",style: TextStyle(color: UIData.PrimaryColor),),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios, color: UIData.PrimaryColor),
            ),
            Text(
              "Back",
              style: TextStyle(color: UIData.PrimaryColor),
            ),
            // Your widgets here
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:16,bottom: 16),
              child: MyText(
                str: "Forgot Password",
              ),
            ),
            Text("Enter your email below and we will \n send you an email"),
            Padding(
              padding: const EdgeInsets.only(top:26,bottom: 32),
              child: TextField(
                //style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                    hintText: "Enter your email",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))
                ),
              ),
            ),
            MyButton(str:"Send",rong:double.infinity),
          ],
        ),
      ),
    );
  }

}