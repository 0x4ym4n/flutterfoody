import 'package:flutter/material.dart';
import 'package:flutterfoody/page/order.dart';
import 'package:flutterfoody/tabs/tabhome.dart';
import 'package:flutterfoody/uidata.dart';
import 'package:mdi/mdi.dart';

import 'page/favorite.dart';
import 'page/intro.dart';
import 'page/login.dart';
import 'tabs/discovery.dart';
import 'widget/fab_bottom_app_bar.dart';
import 'widget/fab_with_icons.dart';
import 'widget/layout.dart';
import 'tabs/profile.dart';
import 'tabs/tabpage.dart';

void main() => runApp(new MyApp());


class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();

    checkIfAuthenticated();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Image.asset(
      'assets/images/bg.png',
      width: size.width,
      height: size.height,
      fit: BoxFit.fill,
    );
  }

  checkIfAuthenticated() async {
    await Future.delayed(Duration(
        seconds:
        6)); // could be a long running task, like a fetch from keychain
    Navigator.pushReplacementNamed(context, '/intro');

    return true;
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //primarySwatch: PrimaryColor,
        primaryColor: UIData.PrimaryColor,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        //'/': (context) => MyHomePage(),
        '/login': (context) => LoginPage(),
        //'/home': (context) => ProfileFillPage(),
        '/intro': (context) => WalkthroughScreen(),
        '/home': (context) => MyHomePage(),
      },
    );
  }
}

/*
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
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        //'/': (context) => MyHomePage(),
        '/login': (context) => LoginPage(),
        //'/home': (context) => ProfileFillPage(),
        '/intro': (context) => WalkthroughScreen(),
        '/home': (context) => MyHomePage(),
      },
    );
  }
}*/

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
    TabProfile(),
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
      onPressed: () {
        Navigator.of(context)
            .push(new MaterialPageRoute(builder: (context) {
          return OrderPage();
        }));
      },
      tooltip: 'Order',
      child: Icon(Icons.shopping_cart),
      elevation: 2.0,
      backgroundColor: UIData.PrimaryColor,
    );
  }
}
