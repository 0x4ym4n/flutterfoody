

import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutterfoody/models/shopobj.dart';

import '../mockdata.dart';

class WgetShopItem extends StatelessWidget {
  final int index;

  WgetShopItem(this.index);
  @override
  Widget build(BuildContext context) {
    showDogDetailPage() {
      Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
        //return new HLVDetailPage(hlvObj: _hlvObj);
      }));
    }

    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8),
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
              Container(height: 120, child: _buildListImgSquare(index)),
              Container(
                padding: EdgeInsets.all(5),
                //width: double.infinity,
                //color: Colors.lightGreenAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(listshop[index].tenquan,style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(
                      listshop[index].diachi,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        StarRating(
                          color: Colors.amber,
                          rating: 4,
                          size: 16,
                        ),
                        //Spacer(),
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
  ListView _buildListImgSquare(int i) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      // Must have an item count equal to the number of items!
      itemCount: 6,
      // A callback that will return a widget.
      itemBuilder: (context, int) {
        // In our case, a DogCard for each doggo.
        return Container(
            padding: EdgeInsets.all(3),
            height: 100,
            width: 100,
            child:
            i == 0
                ? Image.asset(imgset1[int]["img"])
                : i == 1
                ? Image.asset(imgset2[int]["img"])
                : Image.asset(imgset3[int]["img"])
        );
      },
    );
  }

}
