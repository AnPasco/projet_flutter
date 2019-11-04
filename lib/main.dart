import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projet Flutter',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: RandomWords(),
    );
  }
}

class PageUnState extends State<RandomWords> {
  Widget input() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Location'
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TrouveTonBar.com'),
      ),
      body: input(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  PageUnState createState() => PageUnState();
}