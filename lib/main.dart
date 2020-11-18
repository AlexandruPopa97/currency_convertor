import 'package:flutter/material.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Currency convertor',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Image.network('https://static.playtech.ro/wp-content/uploads/2020/08/bani-monede-digitale-banci.jpg'),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Enter the amount of money in EUR',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
