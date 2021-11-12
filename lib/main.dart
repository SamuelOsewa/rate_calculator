import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State {
  final amountController = TextEditingController();
  double result = 0.0;
  late double amount;
  late int rateMultiplier;
  int _value = 1;
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Rate Calculator'),
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            child: Container(
              // color: Colors.amberAccent,
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
                controller: amountController,
                style: TextStyle(),
                onSubmitted: (String value) {
                  amount = double.parse(value);
                },
              ),
            ),
          ),
          RadioListTile(
            value: 1,
            groupValue: _value,
            onChanged: (val) {
              setState(() {
                _value = val as int;
              });
            },
            title: Text('PAYPAL'),
          ),
          RadioListTile(
            value: 2,
            groupValue: _value,
            onChanged: (val) {
              setState(() {
                _value = val as int;
              });
            },
            title: Text('APPLE PAY'),
          ),
          RadioListTile(
            value: 3,
            groupValue: _value,
            onChanged: (val) {
              setState(() {
                _value = val as int;
              });
            },
            title: Text('ZELLE'),
          ),
          RaisedButton(
              child: Text('CONVERT'),
              onPressed: () {
                double amount = double.parse(amountController.text);
                setState(() {
                  switch (_value) {
                    case 1:
                      rateMultiplier = 280;
                      break;
                    case 2:
                      rateMultiplier = 250;
                      break;
                    case 3:
                      rateMultiplier = 260;
                      break;
                  }
                  result = amount * rateMultiplier;
                });
                print(result);
              }),
          Text('Amount to be paid: $result'),
        ],
      ),
    ));
  }
}
