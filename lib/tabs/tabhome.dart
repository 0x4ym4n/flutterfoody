import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutterfoody/uidata.dart';
import 'package:flutterfoody/widget/wgetshopitem.dart';
import 'package:mdi/mdi.dart';

import '../fab_with_icons.dart';
import '../layout.dart';
import '../mockdata.dart';
import '../popular.dart';
import '../trending.dart';

class TabHomePage extends StatefulWidget {
  TabHomePage({Key key}) : super(key: key);

  @override
  _TabHomePageState createState() {
    return _TabHomePageState();
  }
}

class _TabHomePageState extends State<TabHomePage> {
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
      //floatingActionButton: _buildFab(context),
      appBar: AppBar(
        title: Text("Foody",style: TextStyle(fontSize: 24),),
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:16.0),
            child: GestureDetector(
              onTap: ()=>{
                Navigator.of(context).pop(),
              },
              child: Row(
                children: <Widget>[
                  Icon(Mdi.filter),
                  Text("Filter")
                ],
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              //padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 70,
                  ),
                  _buildListThongbao(),
                  Head1(),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: _buildListHor(),
                  ),
                  Head2(),
                  //---
                  WgetShopItem(0),
                  WgetShopItem(1),
                  WgetShopItem(2),
                ],
              ),
            ),
          ),
          wSearch(),
        ],
      ),
    );
  }

  Widget wSearch() {
    return Container(
        color: UIData.PrimaryColor,
        padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: Card(
          child: Container(
            child: TextField(
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  hintText: "Search",
                  border: InputBorder.none,
                  suffixIcon:
                      IconButton(onPressed: () {}, icon: Icon(Icons.search))),
            ),
          ),
        ));
  }

  Widget Head1() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            "Trending this week",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )),
          FlatButton(
              textColor: Colors.red,
              onPressed: () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return TrendingPage();
                }));
              },
              child: Text("View All")),
        ],
      ),
    );
  }

  Widget Head2() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            "Most popular",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )),
          FlatButton(
              textColor: Colors.red,
              onPressed: () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return PopularPage();
                }));
              },
              child: Text("View All")),
        ],
      ),
    );
  }

  Widget _buildFoodItem({int index}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
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
                  listmonan[index]["img"],
                  height: 150,
                  //width: 200,
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        StarRating(
                          color: Colors.amber,
                          rating: listmonan[index]["rating"],
                          size: 16,
                        ),
                        //Spacer(),
                        SizedBox(
                          width: 90,
                        ),
                        Text(
                          "\$" + listmonan[index]["giaban"],
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    )
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
      height: 230.0,
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

  Container _buildListThongbao() {
    return Container(
      //color: Colors.green,
      height: 200.0,
      padding: EdgeInsets.symmetric(horizontal: 1.0),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: listthongbao.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            //onTap: () => slideclick(_listthongbao[index]),
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                //width: 300.0,
                //height: 200.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      //child: Image.network(_listthongbao[index].link,
                      child: Image.asset(
                        listthongbao[index]["img"],
                        height: 120,
                        //width: 200,
                        fit: BoxFit.cover,
                      ),
                    )),
                  ],
                )),
          );
        },
      ),
    );
  }
}
