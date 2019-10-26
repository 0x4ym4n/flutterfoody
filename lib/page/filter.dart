import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:flutterfoody/widget/mytext.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../uidata.dart';

class FilterPage extends StatefulWidget {
  FilterPage({Key key}) : super(key: key);

  @override
  _FilterPageState createState() {
    return _FilterPageState();
  }
}

class _FilterPageState extends State<FilterPage> {
  int select1 = 0;
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
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(16),
              //color: UIData.Bassic2light,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 90,
                      color: UIData.Bassic2light,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          MyText(
                            str: "Filter",
                          ),
                          Text(
                            "Clear",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: UIData.PrimaryColor),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "SORT BY",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _buildItem(0, "Top Rated"),
                    SizedBox(
                      height: 10,
                    ),
                    _buildItem(1, "Nearest Me"),
                    SizedBox(
                      height: 10,
                    ),
                    _buildItem(2, "Cost Hight to Low"),
                    SizedBox(
                      height: 10,
                    ),
                    _buildItem(3, "Cost Low to hight"),
                    SizedBox(
                      height: 10,
                    ),
                    _buildItem(4, "Most Popular"),

                    SizedBox(
                      height: 16,
                    ),
                    Divider(height: 1,),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "FILTER",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _buildItemFilter(1, "Open Now"),
                    SizedBox(
                      height: 10,
                    ),
                    _buildItemFilter(1, "Credit Cards"),
                    SizedBox(
                      height: 10,
                    ),
                    _buildItemFilter(2, "Alcohol serverd"),
                    SizedBox(
                      height: 16,
                    ),
                    Divider(height: 1,),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "ADDITIONAL FILTER",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    FlutterSlider(
                      values: [0, 200],
                      rangeSlider: true,
                      max: 400,
                      min: 0,
                      rightHandler: FlutterSliderHandler(
                        child: Icon(FontAwesomeIcons.solidCircle, color: UIData.PrimaryColor, size: 18,),
                      ),
                      handler: FlutterSliderHandler(
                        child: Icon(FontAwesomeIcons.solidCircle, color: UIData.PrimaryColor, size: 18,),
                      ),
                      trackBar: FlutterSliderTrackBar(
                        activeTrackBarHeight: 7,
                        activeTrackBar: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: UIData.PrimaryColor
                        ),
                      ),
                      tooltip: FlutterSliderTooltip(
                        leftPrefix: Icon(Icons.attach_money, size: 19, color: Colors.black45,),
                        rightSuffix: Icon(Icons.attach_money, size: 19, color: Colors.black45,),
                        alwaysShowTooltip: true,
                      ),
                      onDragging: (handlerIndex, lowerValue, upperValue) {
                        var _lowerValue = lowerValue;
                        var _upperValue = upperValue;
                        setState(() {});
                      },
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
                            "Apply",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        )),
                  ])),
        ));
  }

  Widget _buildItem(int i, String str) {
    return GestureDetector(
      onTap: (){
        setState(() {
          select1=i;
        });
      },
      child: Container(
          child: i == select1
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      str,
                      style: TextStyle(color: UIData.PrimaryColor, fontSize: 16),
                    ),
                    Icon(
                      Icons.check,
                      color: UIData.PrimaryColor,
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      str,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                )),
    );
  }

  Widget _buildItemFilter(int i, String str) {
    return Container(
        child: i == 1
            ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              str,
              style: TextStyle(color: UIData.PrimaryColor, fontSize: 16),
            ),
            Icon(
              Icons.check,
              color: UIData.PrimaryColor,
            ),
          ],
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              str,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ));
  }
}
