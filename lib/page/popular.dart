import 'package:flutter/material.dart';

import '../mockdata.dart';
import '../uidata.dart';
import '../widget/mytext.dart';
import '../widget/wgetshopitem.dart';

class PopularPage extends StatefulWidget {
  PopularPage({Key key}) : super(key: key);

  @override
  _PopularPageState createState() {
    return _PopularPageState();
  }
}

class _PopularPageState extends State<PopularPage> {
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
            color: UIData.Bassic2light,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16,8,16,8),
                    child: MyText(
                      str: "Most popular",
                    ),
                  ),
                  Expanded(child: Container(
                      color: Colors.white,
                      child: _buildList())),

                ])));
  }

  ListView _buildList() {
    return ListView.builder(
      //scrollDirection: Axis.horizontal,
      // Must have an item count equal to the number of items!
      itemCount: 3,
      // A callback that will return a widget.
      itemBuilder: (context, int) {
        // In our case, a DogCard for each doggo.
        return WgetShopItem(int);
      },
    );
  }
}
