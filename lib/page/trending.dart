import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutterfoody/uidata.dart';

import '../mockdata.dart';
import '../widget/mytext.dart';

class TrendingPage extends StatefulWidget {
  TrendingPage({Key key}) : super(key: key);

  @override
  _TrendingPageState createState() {
    return _TrendingPageState();
  }
}

class _TrendingPageState extends State<TrendingPage> {


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
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 180) / 2;
    final double itemWidth = size.width / 2;

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
            Text("Back",style: TextStyle(color: UIData.PrimaryColor),),
            // Your widgets here
          ],
        ),
      ),
      floatingActionButton: null,
      body: Container(
        color: UIData.Bassic2light,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16,8,16,8),
              child: MyText(str: "Trending",),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.white,
                child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: (itemWidth / itemHeight),
                    children: List.generate(12, (index) {
                      return Center(
                        //child: ChoiceCard(choice: choices[index]),
                        child: _buildFoodItem(index: index),
                      );
                    }
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
   Widget _buildFoodItem({int index}) {
     return Padding(
       padding: const EdgeInsets.all(2.0),
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
                   //height: 100,
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
                     Text(listmonan[index]["tenmon"],style: TextStyle(fontWeight: FontWeight.bold)),
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
                           size: 12,
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
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}
class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
        color: Colors.white,
        child: Center(child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(choice.icon, size:90.0, color: textStyle.color),
              Text(choice.title, style: textStyle),
            ]
        ),
        )
    );
  }
}