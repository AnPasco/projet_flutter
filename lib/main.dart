import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'env.dart';
import 'dart:convert';
import 'Venues.dart';
import 'Location.dart';
import 'Categories.dart';
import 'Stats.dart';

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
  var lieux = new List<Venues>();

  @override
  void initState() {
    lieux.add(new Venues("", "", null, null, null));
  }

  @override
  Widget build(BuildContext context) {
    _testUri(String motchercher, String ville) async {
      try {
        var response = await http.get(Uri.parse(
            "https://api.foursquare.com/v2/venues/search?client_id=ZJOYKBUEJOZ4DVRYKWWARZQIZUCLR54W5UAUODPILW3UD2KV&client_secret=" +
                CLEF +
                "&v=20180323&limit=50&near=" +
                ville +
                "&query=" +
                motchercher));
        print('Response \t\t: ${response.body}' + "\n\n");
        Map venueMap = json.decode(response.body);
        int count = 0;
        while (venueMap['response']['venues'][count] != null) {
          print('Response \n\n\t: ${venueMap['response']['venues'][count]}');
          var venue =
              Venues.fromMappedJson(venueMap['response']['venues'][count]);
          print("=========================================================\n" +
              venue.id +
              " " +
              venue.name);
          lieux.add(venue);
          count++;
        } // Append Text to the list
        // Clear the Text area
        setState(() {});
        // return lieux; comment on fait un ptn de return ??? Tu peux pass ici -- jcrois faut faire une fonction que tu apelle

      } catch (e) {
        print("================== ERREUR URL TEST : " + e.toString());
      }
    }

    TextEditingController _txtController1 = TextEditingController();
    TextEditingController _txtController2 = TextEditingController();

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _txtController1,
            decoration: InputDecoration(labelText: 'Location'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _txtController2,
            decoration: InputDecoration(labelText: 'Place'),
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
                  _testUri(_txtController1.text, _txtController2.text);
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Confirmer'),
            ),
          ),
          RaisedButton(
            child: Text('Open route'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute()),
              );
            },
          ),
          Expanded(
              child: new ListView.builder(
                  itemCount: lieux.length,
                  itemBuilder: (BuildContext ctxt, int Index) {
                    return new Text(lieux[Index].toString(),);
                  })),
        ],
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
