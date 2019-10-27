import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutterfoody/widget/mytext.dart';
import 'package:mdi/mdi.dart';

import '../uidata.dart';
import '../mockdata.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key}) : super(key: key);

  @override
  _DetailPageState createState() {
    return _DetailPageState();
  }
}

class _DetailPageState extends State<DetailPage> {
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
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(8),
              color: Colors.white,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText(
                      str: "Gogi Restourant",
                    ),
                    Text(
                      "20 Mau Than, Ninh Kieu",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      children: <Widget>[
                        StarRating(
                          color: Colors.amber,
                          rating: 4,
                          size: 16,
                        ),
                        Text(
                          "(245 reviews)",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Delivery",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Free",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Open time",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "8:00 AM",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 200,
                            //color: Colors.yellow,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                RawMaterialButton(
                                  constraints: BoxConstraints(maxWidth: 60),
                                  child: new Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: new Icon(
                                      Mdi.shareOutline,
                                      //size: 18.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  shape: new CircleBorder(),
                                  fillColor: UIData.Bassic2light,
                                ),
                                RawMaterialButton(
                                  constraints: BoxConstraints(maxWidth: 60),
                                  child: new Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: new Icon(
                                      Mdi.starOutline,
                                      //size: 18.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  shape: new CircleBorder(),
                                  fillColor: UIData.Bassic2light,
                                ),
                                RawMaterialButton(
                                  constraints: BoxConstraints(maxWidth: 60),
                                  child: new Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: new Icon(
                                      Mdi.mapMarkerOutline,
                                      //size: 18.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  shape: new CircleBorder(),
                                  fillColor: UIData.Bassic2light,
                                ),
                                SizedBox(width: 10.0),
                              ],
                            ),
                          ),
                          Expanded(
                            child: OutlineButton(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 30.0,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              highlightedBorderColor: UIData.PrimaryColor,
                              borderSide:
                                  BorderSide(color: UIData.PrimaryColor),
                              color: UIData.PrimaryColor,
                              textColor: UIData.PrimaryColor,
                              child: Text("Contact"),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "FEATURE ITEMS",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    _buildListHor(),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "REVIEW",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    _buildReview1(),
                    _buildReview2(),
                    _buildReview3(),
                    SizedBox(height: 20,)
                  ])),
        ));
  }

  Widget _buildReview1() {
    return Column(
      children: <Widget>[

        ListTile(
          title: Text("Hong Loan", style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text("2h ago"),
          leading: Material(
            elevation: 1.0,
            shape: CircleBorder(),
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: ExactAssetImage("assets/images/ava1.jpg"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Text(
              "Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."),
        )
      ],
    );
  }
  Widget _buildReview2() {
    return Column(
      children: <Widget>[

        ListTile(
          title: Text("Van Minh", style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text("3h ago"),
          leading: Material(
            elevation: 1.0,
            shape: CircleBorder(),
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: ExactAssetImage("assets/images/ava3.jpg"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Text(
              "Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."),
        )
      ],
    );
  }
  Widget _buildReview3() {
    return Column(
      children: <Widget>[

        ListTile(
          title: Text("Cam Nhung", style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text("3h ago"),
          leading: Material(
            elevation: 1.0,
            shape: CircleBorder(),
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: ExactAssetImage("assets/images/ava2.jpg"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Text(
              "Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."),
        )
      ],
    );
  }

  Widget _buildFoodItem({int index}) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          // color: Colors.pinkAccent,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(
                  listfood[index]["img"],
                  height: 140,
                  //width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      listmonan[index]["tenmon"],
                    ),
                    Text(
                      "\$ " + listmonan[index]["giaban"],
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListHor() {
    return Container(
      height: 200.0,
      //width: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _buildFoodItem(index: 0),
          _buildFoodItem(index: 1),
          _buildFoodItem(index: 2),
          _buildFoodItem(index: 3),
          _buildFoodItem(index: 4),
          _buildFoodItem(index: 5),
          SizedBox(
            width: 20.0,
          ),
        ],
      ),
    );
  }
}
