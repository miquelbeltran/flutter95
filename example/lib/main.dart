import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';

void main() {
  runApp(Flutter95App());
}

class Flutter95App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Flutter95.background,
      home: Scaffold95(
        title: 'Flutter95 v0.0.3',
        body: Column(
          children: <Widget>[
            Button95(
              onTap: () {},
              child: Text('Button95'),
            )
          ],
        ),
      ),
    );
  }
}
