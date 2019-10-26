import 'package:flutter/material.dart';
import "package:flutter_swiper/flutter_swiper.dart";
import 'package:flutterfoody/models/walkobj.dart';
import 'package:flutterfoody/page/login.dart';
import 'package:flutterfoody/uidata.dart';
import 'package:flutterfoody/widget/swiperpage.dart';

class WalkthroughScreen extends StatefulWidget {
  //final SharedPreferences prefs;
  final List<Walkthrough> pages = [
    Walkthrough(
      icon: Icons.developer_mode,
      title: "Flutter Onboarding",
      description: "Build your onboarding flow in seconds.",
    ),
    Walkthrough(
      icon: Icons.layers,
      title: "Firebase Auth",
      description: "Use Firebase for user management.",
    ),
    Walkthrough(
      icon: Icons.account_circle,
      title: "Facebook Login",
      description: "Leverage Facebook to log in user easily.",
    ),
  ];

  //WalkthroughScreen({this.prefs});

  @override
  _WalkthroughScreenState createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  List<String> images = [
    'assets/images/a1.png',
    'assets/images/a2.png',
    'assets/images/a3.png',
  ];
  int _currentIndex = 0;
  final SwiperController _swiperController = SwiperController();
  final int _pageCount = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Swiper.children(
            autoplay: false,
            index: _currentIndex,
            loop: false,
            pagination: new SwiperPagination(
                margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 40.0),
                builder: CustomPaginationBuilder(
                    activeSize: Size(10.0, 20.0),
                    size: Size(10.0, 15.0),
                    color: UIData.Bassic1)),
            control: SwiperControl(
              iconPrevious: null,
              iconNext: null,
            ),
            controller: _swiperController,
            children: _getPages(context),
            onIndexChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
              //print("index${_currentIndex}");
            },
          ),
          _buildSkip(),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 70),
                child: _buildStart(),
              ))
        ],
      ),
    );
  }

  Widget _buildStart() {
    return _currentIndex==2?
      SizedBox(
        width: 200,
        height: 50,
        child: FlatButton(
          color: UIData.PrimaryColor,
          textColor: Colors.white,
          padding: EdgeInsets.all(8.0),
          onPressed: () {
            Navigator.of(context)
                .pushReplacement(new MaterialPageRoute(builder: (context) {
              return new LoginPage();
            }));
          },
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(6.0),
              side: BorderSide(color: Colors.red)),
          child: Text(
            "Get Stared",
            style: TextStyle(fontSize: 20.0),
          ),
        )) : SizedBox(height: 1,)
    ;
  }

  Widget _buildSkip() {
    return Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
            onTap: () => _skip(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 16, 0),
              child: Text(
                "Skip >>",
                style: TextStyle(color: UIData.PrimaryColor, fontSize: 16),
              ),
            )));
  }

  List<Widget> _getPages(BuildContext context) {
    List<Widget> widgets = [];
    for (int i = 0; i < images.length; i++) {
      //Walkthrough page = widget.pages[i];
      widgets.add(
        new Container(
          //color: Color.fromRGBO(212, 20, 15, 1.0),
          decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(30.0),
            image: DecorationImage(
              image: AssetImage(images[i]),
              fit: BoxFit.cover,
              //colorFilter: ColorFilter.mode(Colors.black38, BlendMode.multiply)
            ),
          ),
          //child:
        ),
      );
    }

    return widgets;
  }

  _skip() {
    print("click");
    Navigator.of(context)
        .pushReplacement(new MaterialPageRoute(builder: (context) {
      return new LoginPage();
    }));
  }
}
