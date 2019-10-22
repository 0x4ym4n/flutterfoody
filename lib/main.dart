import 'package:flutter/material.dart';
import 'package:flutterfoody/tabs/tabhome.dart';
import 'package:flutterfoody/uidata.dart';
import 'package:mdi/mdi.dart';

import 'favorite.dart';
import 'tabs/discovery.dart';
import 'fab_bottom_app_bar.dart';
import 'fab_with_icons.dart';
import 'layout.dart';
import 'tabs/tabpage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foody',
      theme: new ThemeData(
        primaryColor: UIData.PrimaryColor,
      ),
      home: new MyHomePage(title: 'Foody'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;



  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  String _lastSelected = 'TAB: 0';

  int _current = 0;

  List<Widget> tabs = [
    //QRcodeScanPage(),

    TabHomePage(),
    TabDiscovery(),
    FavoritePage(),
    TabScreen(Colors.yellow),
    TabScreen(Colors.green),
    TabScreen(Colors.blue)
  ];

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';
      _current = index;
    });
  }

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = 'FAB: $index';
      _current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: tabs[_current],
      bottomNavigationBar: FABBottomAppBar(
        //centerItemText: 'A',
        color: Colors.grey,
        selectedColor: UIData.PrimaryColor,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Mdi.home, text: 'Home'),
          FABBottomAppBarItem(
              iconData: Mdi.mapMarker, text: 'Discovery'),
          FABBottomAppBarItem(iconData: Mdi.star, text: 'Favorite'),
          FABBottomAppBarItem(iconData: Mdi.account, text: 'Profile'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab2(context), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildFab(BuildContext context) {
    final icons = [Icons.sms, Icons.mail, Icons.phone];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
//          child: FabWithIcons(
//            icons: icons,
//            onIconTapped: _selectedFab,
//          ),
        );
      },
      child: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.shopping_cart),
        elevation: 2.0,
      ),
    );
  }
  Widget _buildFab2(BuildContext context) {
    final icons = [Icons.sms, Icons.mail, Icons.phone];
    return FloatingActionButton(
      onPressed: () {},
      tooltip: 'Increment',
      child: Icon(Icons.shopping_cart),
      elevation: 2.0,
      backgroundColor: UIData.PrimaryColor,
    );
  }
}
