/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
 */

import 'package:flutter/material.dart';
import 'package:flutterfoody/main.dart';
import 'package:flutterfoody/page/forgotpass.dart';
import 'package:flutterfoody/widget/mybutton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../uidata.dart';

class LoginPage extends StatefulWidget {
  static final String path = "lib/src/pages/login/login4.dart";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/login.jpg'),
                      fit: BoxFit.cover)),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.black.withOpacity(0.7),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                      height: 100.0,
                    ),
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 34.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Sign in to continue",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Username",
                          hintStyle: TextStyle(color: Colors.white70),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54))),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white70),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54))),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),

                    SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: FlatButton(
                          color: UIData.PrimaryColor,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(8.0),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                new MaterialPageRoute(builder: (context) {
                              return new MyHomePage();
                            }));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(6.0),
                              side: BorderSide(color: Colors.red)),
                          child: Text(
                            "SIGN IN",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        )),
                    SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: FlatButton.icon(
                          icon: Icon(FontAwesomeIcons.facebookF),
                          color: Color(0xff2872C9),
                          textColor: Colors.white,
                          padding: EdgeInsets.all(8.0),
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(6.0),
                              side: BorderSide(color: Colors.transparent)),
                          label: Text(
                            "Connect with Facebook",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        )),
                    SizedBox(
                      height: 30.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(new MaterialPageRoute(builder: (context) {
                          return new ForgotPassPage();
                        }));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Forgot your password?",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    //Spacer(),
                    SizedBox(
                      height: 60.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Dont have an account?",
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "SIGN UP",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
