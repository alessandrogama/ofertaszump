import 'package:ofertasZump/models/categories.dart';
import 'package:ofertasZump/models/offers.dart';
import 'package:flutter/material.dart';
import 'package:ofertasZump/Api.dart';
import 'package:url_launcher/url_launcher.dart'; 
import 'package:google_fonts/google_fonts.dart';

class HomeInitial extends StatefulWidget {
  @override

  _HomeInitialState createState() => new _HomeInitialState();
}

class _HomeInitialState extends State<HomeInitial> { 
  @override
  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder(
      future: Api.getOfferSearchForWord('informática'),
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
    return new  Scaffold(
      appBar: new AppBar(
      title: Image.asset('assets/images/logo200x200.png', width: 120, height: 120)      
      ),
      body: futureBuilder,
      backgroundColor: Colors.white,
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
        itemCount: values.length,
        itemBuilder: (BuildContext context, int index) {
       return new Card(
      child: new Column(
    children: <Widget>[
      new ListTile(
        leading: new Image.network(
          values[index].thumbnail,
          fit: BoxFit.cover,
          width: 100.0,
        ),
        title: new Text(
          values[index].name,
          style: GoogleFonts.roboto(),
        ),
        subtitle: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(values[index].store.name,
                  style: new TextStyle(fontSize: 13.0, fontWeight: FontWeight.normal)),
              new Text('Preço : ${values[index].price}',
                  style: GoogleFonts.arimaMadurai(textStyle: TextStyle(
                      fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.blue))),
            ]),
            trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          _launchURL(values[index].link);
        },
      )
    ],
  ));
        },
    );
  }
