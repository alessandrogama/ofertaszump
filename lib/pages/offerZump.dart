import 'package:flutkart/models/categories.dart';
import 'package:flutkart/models/offers.dart';
import 'package:flutter/material.dart';
import 'package:flutkart/Api.dart';
import 'package:url_launcher/url_launcher.dart'; 

class OfferZump extends StatefulWidget {
  @override
  const OfferZump({
    Key key,
    this.cat
  }) : super(key: key);
  final Categories cat;
  _OfferZumpState createState() => new _OfferZumpState();
}

class _OfferZumpState extends State<OfferZump> { 
  @override
  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder(
      future: Api.getOfferSearchForIdCategory(widget.cat.id.toString()),
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
          return Card(
            child: ListTile(
                leading: Image.network(
                      values[index].thumbnail,
                    ),
                title: Text(values[index].name),
                subtitle: Text('Preço: ${values[index].priceFrom}',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                _launchURL(values[index].link);
              },
              ),
            );        
        },
    );
  }
