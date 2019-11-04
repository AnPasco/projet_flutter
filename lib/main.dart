import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'env.dart';


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
    _testUri();
    return MyCustomFormState();
  }
  _testUri() async{
    try {
      var response = await http.get(Uri.parse("https://api.foursquare.com/v2/venues/search?client_id=ZJOYKBUEJOZ4DVRYKWWARZQIZUCLR54W5UAUODPILW3UD2KV&client_secret="+CLEF+"&v=20180323&limit=1&ll=47.2704,-1.5184&query=coffee"));
      print('Response body: ${response.body}');
    } catch (e) {
      print("================== ERREUR URL TEST : "+e.toString());
    }
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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