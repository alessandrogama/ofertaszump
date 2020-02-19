import 'package:flutkart/models/categories.dart';
import 'package:flutkart/models/offers.dart';
import 'package:flutter/material.dart';
import 'package:flutkart/Api.dart';

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
        title: new Text("Ofertas"),
      ),
      body: futureBuilder,
      backgroundColor: Colors.white,
    );
  }
}

Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<Offers> values = snapshot.data.offers;
    return new ListView.builder(
        itemCount: values.length,
        itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          child: Column(
              children: <Widget>[
                new Container( 
                  padding: const EdgeInsets.all(9.0),
                  child: 
                  Image.network(
                    values[index].thumbnail,
                    width: 100.0, 
                    height: 100.0,
                    alignment:  Alignment.topLeft,
                  )),
                  new Container( 
                  padding: const EdgeInsets.all(16.0),
                  child:                    
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(values[index].name, style: TextStyle(fontSize: 12)),
                        Text(values[index].store.name, style: TextStyle(color: Colors.black.withOpacity(0.5))),
                        Text(values[index].priceFrom.toString(),style: TextStyle(fontSize: 30,color: Colors.red,fontFamily: 'Arial')),
                      ],
                    ),
                    
                  )
            ],
           crossAxisAlignment: CrossAxisAlignment.start,
          )
    );        },
    );
  }
