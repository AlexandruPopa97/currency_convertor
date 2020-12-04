import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String textFormValue;
  double convertedValue;
  double rate = 4.5;
  bool onlyNumbersCheck = false;

  bool _isNumeric(String str) {
    if (str == null) {
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
                  onChanged: (String value) {
                    textFormValue = value;
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Enter the amount of money in EUR',
                  ),
                  // ignore: missing_return
                  validator: (String value) {
                    if (!_isNumeric(value)) {
                      // ignore: unnecessary_parenthesis
                      return ('Please enter a number');
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  if (_formKey.currentState.validate()) {
                    onlyNumbersCheck = true;
                    convertedValue = double.parse(textFormValue) * rate;
                  } else {
                    onlyNumbersCheck = false;
                  }
                });
              },
              child: const Text('Convert!'),
              color: Colors.grey[300],
            ),
            Text(
              onlyNumbersCheck ? '$convertedValue RON' : '',
              style: const TextStyle(fontSize: 25.0),
            ),
          ],
        ),
      ),
    );
  }
}
