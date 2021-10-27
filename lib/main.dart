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

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Rate Calculator'),
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
              ),
            ),
          ),
          RaisedButton(
              child: Text('CONVERT'),
              onPressed: () {
                double amount = double.parse(amountController.text);
                setState(() {
                  result = amount * 280;
                });
                print(result);
              }),
          Text('Amount to be paid: $result'),
        ],
      ),
    ));
  }
}
