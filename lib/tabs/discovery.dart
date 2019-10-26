import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../page/mapview.dart';
import '../uidata.dart';

class TabDiscovery extends StatefulWidget {
  TabDiscovery({Key key}) : super(key: key);

  @override
  _TabDiscoveryState createState() {
    return _TabDiscoveryState();
  }
}

class _TabDiscoveryState extends State<TabDiscovery>
    with SingleTickerProviderStateMixin {
  TabController controller;

  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
    textEditingController.text = "B16 KDC 91B CanTho";
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    textStyle() {
      return new TextStyle(color: Colors.white, fontSize: 30.0);
    }

    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: wSearch(),
        bottom:  new TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.white, width: 3.0),
              insets: EdgeInsets.fromLTRB(22,0,22,5)
            ),
            controller: controller, tabs: <Tab>[
          new Tab(child: Text("Fastfood"),),
          new Tab(child: Text("Desserts"),),
          new Tab(child: Text("Dim sum"),),
         // new Tab(child: Text("Breakfast"),),
        ])
      ),
      body: TabBarView(
          controller: controller,
          children: <Widget>[
            new MapviewPage(),
            new MapviewPage(),
            new MapviewPage(),


          ]
      ),
    );
  }

  Widget wSearch() {
    return Container(
        color: UIData.PrimaryColor,
        padding: EdgeInsets.fromLTRB(8, 60, 8, 8),
        child: Column(
          children: <Widget>[
            Card(
              child: Container(
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      //hintText: "B16 KDC 91B CanTho",
                      border: InputBorder.none,
                      prefixIcon: Icon(Mdi.mapMarkerOutline),
                      suffixIcon: IconButton(
                          onPressed: () {
                            textEditingController.clear();
                          }, icon: Icon(Mdi.closeCircle))),
                ),
              ),
            ),
            new TabBar(controller: controller, tabs: <Tab>[
              new Tab(icon: new Icon(Icons.arrow_forward)),
              new Tab(icon: new Icon(Icons.arrow_downward)),
              new Tab(icon: new Icon(Icons.arrow_back))
            ])
          ],
        ));
  }


}
