import 'package:flutter/material.dart';
import 'package:flutterfoody/uidata.dart';

import '../mockdata.dart';

class CheckOutPage extends StatefulWidget {
  CheckOutPage({Key key}) : super(key: key);

  @override
  _CheckOutPageState createState() {
    return _CheckOutPageState();
  }
}

class _CheckOutPageState extends State<CheckOutPage> {
  int num =1;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  _dochange(int n) {
    setState(() {
      num=n;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ArcBackground(),
          Container(
            margin: EdgeInsets.only(left: 90, bottom: 20),
            width: 299,
            height: 170,
            decoration: BoxDecoration(
                color: Color(0xffE52C51),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(290),
                    bottomRight: Radius.circular(90),
                    topRight: Radius.circular(5))),
          ),
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Checkout",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Close",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(
                          top: 16.0, left: 16.0, right: 16.0, bottom: 10.0),
                      child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          elevation: 5.0,
                          color: Colors.white,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "DELIVERY ADDRESS",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: UIData.Bassic2light,
                                        border: Border.all(
                                            color: UIData.PrimaryColor)),
                                    child: ListTile(
                                      title: Text(
                                        "ADDRESS #1",
                                        style: TextStyle(
                                            color: UIData.PrimaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text("B16 KDC 91B Can Tho"),
                                      trailing: Icon(
                                        Icons.check_circle,
                                        color: UIData.PrimaryColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 22,
                                  ),
                                  Text(
                                    "PAYMENT METHOD",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  InkWell(
                                    onTap: ()=>{
                                      _dochange(1)
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        child: ListTile(
                                          leading: Image.asset('assets/images/master.png'),
                                          title: Text ("**** **** **** 1234"),
                                          subtitle: Text ("Expired 07/21"),
                                          trailing: (num==1) ?Icon(Icons.check_circle, color: UIData.PrimaryColor,):null,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: ()=>{
                                      _dochange(2)
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        child: ListTile(
                                          leading: Image.asset('assets/images/visa.png'),
                                          title: Text ("**** **** **** 5678"),
                                          subtitle: Text ("Expired 07/21"),
                                          trailing: (num==2) ?Icon(Icons.check_circle, color: UIData.PrimaryColor,):null,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: ()=>{
                                      _dochange(3)
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        child: ListTile(
                                          leading: Image.asset('assets/images/paypal.png'),
                                          title: Text ("Jeetebe@gmail.com"),
                                          subtitle: Text (""),
                                          trailing: (num==3) ?Icon(Icons.check_circle, color: UIData.PrimaryColor,):null,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: FlatButton(
                                        color: UIData.PrimaryColor,
                                        textColor: Colors.white,
                                        padding: EdgeInsets.all(8.0),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius: new BorderRadius.circular(6.0),
                                            side: BorderSide(color: Colors.red)),
                                        child: Text(
                                          "Payment",
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                      )
                                  )
                                ]),
                          ))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItem({int index}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        // color: Colors.pinkAccent,
        padding: EdgeInsets.all(8),

        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.asset(
                listmonan[index]["img"],
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              //width: double.infinity,
              //color: Colors.lightGreenAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(listmonan[index]["tenmon"],
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    listmonan[index]["tenquan"],
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "\$" + listmonan[index]["giaban"],
                    style: TextStyle(
                        color: UIData.PrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListVer() {
    return Container(
      //height: 110.0,
      //width: 200,
      child: Column(
        children: <Widget>[
          _buildFoodItem(index: 0),
          Divider(
            height: 1,
          ),
          _buildFoodItem(index: 1),
          Divider(
            height: 1,
          ),
          _buildFoodItem(index: 2),
          Divider(
            height: 1,
          ),
          _buildFoodItem(index: 3),
        ],
      ),
    );
  }
}

class ArcBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        width: double.infinity,
        height: 250.0,
        color: UIData.PrimaryColor,
      ),
      clipper: RoundedClipper(),
    );
  }
}

class RoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
