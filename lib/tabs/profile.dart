import 'package:flutter/material.dart';
import 'package:flutterfoody/uidata.dart';
import 'package:flutterfoody/widget/mytext.dart';

class TabProfile extends StatefulWidget {
  TabProfile({Key key}) : super(key: key);

  @override
  _TabProfileState createState() {
    return _TabProfileState();
  }
}

class _TabProfileState extends State<TabProfile> {
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          color: UIData.PrimaryColor,
          height: size.height / 4,
        ),
        SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Profile",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.white),),
                      Text("Edit",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                    ],
                  )
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: 16.0, left: 16.0, right: 16.0, bottom: 10.0),
                  child: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    elevation: 5.0,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 16.0,
                        ),
                        ListTile(
                          leading: Material(
                            elevation: 5.0,
                            shape: CircleBorder(),
                            child: CircleAvatar(
                              radius: 30.0,
                              backgroundImage:
                                  ExactAssetImage("assets/images/user.jpeg"),
                            ),
                          ),
                          title: Row(
                            children: <Widget>[
                              Text("Recardo McDonald"),
                              Icon(
                                Icons.check_circle,
                                color: Colors.lightGreenAccent,
                              )
                            ],
                          ),
                          subtitle: Text("jeetebe@gmail.com"),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Account credit",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                "\$52.25",
                                style: TextStyle(
                                    color: UIData.PrimaryAssentColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        //
                      ],
                    ),
                  ),
                ),

                Container(
                    padding: EdgeInsets.only(
                        top: 16.0, left: 16.0, right: 16.0, bottom: 10.0),
                    child: Material(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        elevation: 5.0,
                        color: Colors.white,
                        child: Column(children: <Widget>[
                          ListTile(
                            title: Text(
                              "Payment cards",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("Add a credit or debit card"),
                            trailing: Icon(Icons.navigate_next),
                          ),
                          Divider(
                            height: 1,
                          ),
                          ListTile(
                            title: Text(
                              "Address",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("Add or remove address"),
                            trailing: Icon(Icons.navigate_next),
                          ),
                          Divider(
                            height: 1,
                          ),
                          ListTile(
                            title: Text(
                              "Refers Friends",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "Get \$10.00 FREE",
                              style: TextStyle(color: UIData.PrimaryColor),
                            ),
                            trailing: Icon(Icons.navigate_next),
                          ),
                          Divider(
                            height: 1,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.help,
                              color: Colors.pink,
                            ),
                            title: Text("Delivery support"),
                            trailing: Icon(Icons.navigate_next),
                          ),
                          Divider(
                            height: 1,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.settings,
                              color: Colors.blueAccent,
                            ),
                            title: Text("Setting"),
                            trailing: Icon(Icons.navigate_next),
                          ),
                          Divider(
                            height: 1,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.info,
                              color: Colors.green,
                            ),
                            title: Text("Term of use"),
                            trailing: Icon(Icons.navigate_next),
                          ),
                          Divider(
                            height: 1,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.beenhere,
                              color: Colors.yellow,
                            ),
                            title: Text("Privacy policy"),
                            trailing: Icon(Icons.navigate_next),
                          ),
                        ])))
              ],
            ),
          ),
        )
      ],
    ));
  }
}
