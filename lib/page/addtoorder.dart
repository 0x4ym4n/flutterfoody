import 'package:flutter/material.dart';
import 'package:flutterfoody/models/foodobj.dart';
import 'package:flutterfoody/widget/mybutton.dart';
import 'package:flutterfoody/widget/mytext.dart';
import 'package:mdi/mdi.dart';

import '../mockdata.dart';
import '../uidata.dart';

class Add2OrderPage extends StatefulWidget {
  final int index;
  Add2OrderPage({Key key, this.index}) : super(key: key);

  @override
  _Add2OrderPageState createState() {
    return _Add2OrderPageState();
  }
}

class _Add2OrderPageState extends State<Add2OrderPage> {
  int soluong = 0;
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
      body: Stack(children: <Widget>[
        Image.asset(
          listmonan[widget.index]["img"],
          //width: size.width,
          //height: size.height,
          fit: BoxFit.fill,
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 32,
              ),
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        Text(
                          "Back",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Row(
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
                            Mdi.star,
                            //size: 18.0,
                            color: UIData.PrimaryColor,
                          ),
                        ),
                        shape: new CircleBorder(),
                        fillColor: UIData.Bassic2light,
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 170),
                child: MyText(
                  str: listmonan[widget.index]["tenmon"],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "DESCRIPTION",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                  "Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."),
              SizedBox(
                height: 16,
              ),
              Text(
                "QUANLITY",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Row(
                children: <Widget>[
                  Text("${soluong} item"),
                  Spacer(),
                  quantityCard(context)
                ],
              ),
              Spacer(),
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
                      "Add to order",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ))
            ],
          ),
        )
      ]),
    );
  }

  Widget quantityCard(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    top:
    (deviceSize.height - deviceSize.height * 0.1);
    left:
    deviceSize.width / 2 - deviceSize.width / 5;
    width:
    deviceSize.width / 2 - 30;
    return new Material(
      clipBehavior: Clip.antiAlias,
      shape: new StadiumBorder(),
      shadowColor: Colors.black,
      elevation: 1.0,
      color: UIData.PrimaryColor,
      child: Ink(
//        decoration: new BoxDecoration(
//          gradient: new LinearGradient(colors: UIData.kitGradients),
//        ),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new IconButton(
                icon: new Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                onPressed: () {
                  if (soluong > 0) {
                    setState(() {
                      soluong--;
                    });
                  }
                }),
            new IconButton(
                icon: new Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    soluong++;
                  });
                })
          ],
        ),
      ),
    );
  }
}
