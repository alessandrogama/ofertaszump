
import 'package:intl/intl.dart';
import 'package:ofertasZump/models/offers.dart';
import 'package:flutter/material.dart';
import 'package:ofertasZump/Api.dart';
import 'package:url_launcher/url_launcher.dart'; 
import 'package:google_fonts/google_fonts.dart';
import 'package:ofertasZump/models/coupons.dart';
import 'package:ofertasZump/utils/my_navigator.dart';

class HomeInitial extends StatefulWidget {
  @override
  _HomeInitialState createState() => new _HomeInitialState();
}

class _HomeInitialState extends State<HomeInitial> {
  var date = DateTime.now();
  bool showFirst = true;
  bool flagMenu = true; 
  @override
  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder(
      future: Api.getOfferSearchForWord('smartphone'),
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
            return SafeArea(
              child: Container(
                margin: EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(new DateFormat("dd-MM-yyyy").format(date).toString()),
                                Text(
                                  "A melhor oferta você encontra aqui !",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 17),
                                ),
                              ],
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage("assets/images/logo200x200.png"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 11.0,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Buscar Ofertas",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Container(
                        height: 275,
                        child: 
                          createListView(context, snapshot),
                      ),
                      SizedBox(height: 15.0),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 9, horizontal: 13),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9.0),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5.0,
                                offset: Offset(0, 5),
                                color: Colors.grey[100]),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(5.0),
                              margin: EdgeInsets.symmetric(horizontal: 9.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                gradient: LinearGradient(
                                    colors: [Colors.orangeAccent, Colors.pinkAccent]),
                              ),
                              child: Text(
                                "Cupons",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "#Confira os cupons",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 15.0),
                      SizedBox(height: 15.0),
                      Container(
                          height: 181,
                          child: 
                              SmallContainer(),
                        ),
                      SizedBox(height: 5.0),
                    ],
                  ),
                ),
              ),
            );
        }
      },
    );
    return new  Scaffold(
      appBar: new AppBar(
      title: Image.asset('assets/images/logo200x200.png', width: 120, height: 120)      
      ),
      body: futureBuilder,
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
              title: Text('Inicio'),
              onTap: () {
                MyNavigator.goToHomeInitial(context);
              },
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
}
_launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<Offers> values = snapshot.data.offers;
    return new ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
    return new GestureDetector(
      child: new Container(
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              offset: Offset(0, 3),
              color: Colors.grey[300],
            ),
          ],
        ),
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.symmetric(horizontal: 9.0, vertical: 7.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              child: new Image.network(
                values[index].thumbnail,
                fit: BoxFit.cover,
                width: 100.0,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            SizedBox(
              height: 9.0,
            ),
            Text(
              values[index].name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
              ),
            ),
            SizedBox(
              height: 9.0,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.pin_drop,
                  color: Colors.grey[400],
                ),
                Text(
                  values[index].store.name,
                  style: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
                Spacer(),
                Flexible(
                  flex: 3,
                  child: FittedBox(
  
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
        },
    );
  }
class SmallContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     var futureBuilderSmall = new FutureBuilder(
      future: Api.getStoreCoupon(),
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
              return createListCoupons(context,snapshot) ;
        } }
   );
  return new  Scaffold(
      body: futureBuilderSmall,
    );
 }
}
Widget createListCoupons(BuildContext context, AsyncSnapshot snapshot) {
    List<Stores> values = snapshot.data.stores;
    return new ListView.builder(
        itemCount: values.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
            return new Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => _launchURL(values[index].link),
                  child: Container(
                    height: 179,
                    width: MediaQuery.of(context).size.width / 2.5,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5.0,
                          offset: Offset(0, 3),
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                child: new Image.network(
                values[index].image,
                fit: BoxFit.cover,
                width: 100.0,
              ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              SizedBox(
                height: 9.0,
              ),

              SizedBox(
                height: 9.0,
              ),
              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.orange),
                    width: 15,
                    height: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                Text(
                    "5.0",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.favorite,
                    color: Colors.grey[400],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
    },
    );
}