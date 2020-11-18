import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  bool _isNumeric(String str) {
    if(str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Enter the amount of money in EUR',
                  ),
                  // ignore: missing_return
                  validator: (String value) {
                    if(!_isNumeric(value)) {
                        // ignore: unnecessary_parenthesis
                        return('Please enter a number');
                      }
                    else {
                      return null;
                    }
                  },
                ),
              ),
            ),
            FlatButton(
                onPressed: () {
                  if(_formKey.currentState.validate()) {
                  }
                },
                child: const Text('Convert!'),
                color: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }
}
