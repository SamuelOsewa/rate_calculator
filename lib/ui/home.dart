import 'package:flutter/material.dart';
import 'package:rate_calculator/util/hexcolor.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State {
  Color _gold = HexColor('#FFC107');
  Color _purple = HexColor('#6908D6');

  final amountController = TextEditingController();
  double result = 0.0;
  late double amount;
  late int rateMultiplier;
  int _value = 1;
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      //backgroundColor: Colors.black,

      body: Container(
          alignment: Alignment.center,
          color: Colors.white,
          margin: EdgeInsets.only(top: 75),
          child: ListView(scrollDirection: Axis.vertical, children: [
            Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(20.5),
                    width: 370,
                    height: 150,
                    decoration: BoxDecoration(
                      color: _purple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Amount to be Paid',
                          style: TextStyle(
                              color: _purple,
                              fontSize: 15.0,
                              fontWeight: FontWeight.normal),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('#$result',
                              style: TextStyle(
                                  color: _purple,
                                  fontSize: 34.0,
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    )),
                // Card(
                //   elevation: 5,
                //   child:
                Container(
                  margin: EdgeInsets.all(20.0),
                  // color: Colors.amberAccent,
                  decoration: (BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                          color: _purple.withOpacity(0.5),
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(8.0))),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Amount',
                        ),
                        controller: amountController,
                        style: TextStyle(),
                        onSubmitted: (String value) {
                          amount = double.parse(value);
                        },
                      ),
                      RadioListTile(
                        activeColor: _purple,
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
                        activeColor: _purple,
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
                        activeColor: _purple,
                        value: 3,
                        groupValue: _value,
                        onChanged: (val) {
                          setState(() {
                            _value = val as int;
                          });
                        },
                        title: Text('ZELLE'),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                            color: _purple,
                            borderRadius: BorderRadius.circular(12.0)),
                        child: InkWell(
                            child: Text(
                              'CONVERT',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              double amount =
                                  double.parse(amountController.text);
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
                      ),
                    ],
                  ),
                ),
                //  ),
              ],
            ),
          ])),
    ));
  }
}
