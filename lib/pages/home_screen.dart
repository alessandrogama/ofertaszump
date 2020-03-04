import 'package:ofertasZump/models/categories.dart';
import 'package:flutter/material.dart';
import 'package:ofertasZump/Api.dart';
import 'package:ofertasZump/utils/my_navigator.dart';

import 'offerZump.dart';

class HomeScreen extends StatefulWidget {
  @override
  const HomeScreen({
    Key key,
    this.values
  }) : super(key: key);
  final List<Categories> values;
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController animCtrl;
  Animation<double> animation;

  AnimationController animCtrl2;
  Animation<double> animation2;
  bool showFirst = true;
  bool flagMenu = true;

  @override
  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder(
      future: Api.getCategoryAll(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return createListView(context, snapshot);
        }
      },
    );
    return new Scaffold(
      appBar: new AppBar(
      title: Image.asset('assets/images/logo200x200.png', width: 120, height: 120)      
      ),
      body: flagMenu ? futureBuilder : OfferZump(),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                image: new DecorationImage(
                  image: NetworkImage("https://www.online.citibank.co.in/special-offers/home/images/New_Offers/thumbnail/New-Offers.jpg")
                  ) 
              ),
            ),
            ListTile(
              title: Text('Categorias'),
              onTap: () {
                MyNavigator.goToHome(context);
              },
            ),
            ListTile(
              title: Text('Ofertas'),
              onTap: () {
                setState(() {
                  flagMenu = false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<Categories> values = snapshot.data.categories;
    return new ListView.builder(
        itemCount: values.length,
        itemBuilder: (BuildContext context, int index) {
          return new Column(
            children: <Widget>[
              new ListTile(
                title: new Text(values[index].name),
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => OfferZump(cat: values[index]),
          ),
        );
              },
              ),
              new Divider(height: 2.0,),
            ],
          );
          
        },
    );
  }
}