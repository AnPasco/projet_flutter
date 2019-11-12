import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'env.dart';
import 'dart:convert';
import 'Venues.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'TrouveTonBar.com';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _testUri(String motchercher,String ville) async{
      var lieux = new List<Venues>();
      try {
        var response = await http.get(Uri.parse("https://api.foursquare.com/v2/venues/search?client_id=ZJOYKBUEJOZ4DVRYKWWARZQIZUCLR54W5UAUODPILW3UD2KV&client_secret="+CLEF+"&v=20180323&limit=50&near="+ville+"&query="+motchercher));
        print('Response \t\t: ${response.body}'+"\n\n");
        Map venueMap = json.decode(response.body);
        int count=0;
        while(venueMap['response']['venues'][count] != null){
          print('Response \n\n\t: ${venueMap['response']['venues'][count]}');
          var venue = Venues.fromMappedJson(venueMap['response']['venues'][count]);
          print("=========================================================\n"+venue.id + " "+ venue.name);
          lieux.add(venue);
          count++;
        }
       // return lieux; comment on fait un ptn de return ???

      } catch (e) {
        print("================== ERREUR URL TEST : "+e.toString());
      }
    }
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
          labelText: 'Location'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Place'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _testUri("bar","nantes");
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Confirmer'),
            ),
          ),
        ],
      ),
    );
  }
}