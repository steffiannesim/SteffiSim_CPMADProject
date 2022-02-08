import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();

  double _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            new TextField(
              controller: _heightController,
            keyboardType: TextInputType.number,
            decoration: new InputDecoration(
              labelText: 'height in cm',
              icon: new Icon(Icons.trending_up),
            ),
            ),
            SizedBox(height: 20),
            new TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                labelText: 'weight in kg',
                icon: new Icon(Icons.line_weight),
              ),
            ),
            SizedBox(height: 15),
            RaisedButton(
              color: Colors.green,
              child: new Text(
                "Calculate",
                style: new TextStyle(color: Colors.white),
              ),
              onPressed: calculateBMI,
            ),
             SizedBox(height: 15),
             Text(
               _result == null ? "Enter Value" : "${_result.toStringAsFixed(2)}",
               style: new TextStyle(
                 color: Colors.redAccent,
                 fontSize: 20,
                 fontWeight: FontWeight.w500,
               ),
             ),
              SizedBox(height: 15),
             Text(
               "Underweight: <18, \n Normal: 18.5-24.9, \n Overweight: 25-29.9, \n Obese: 30>",
               textAlign: TextAlign.center,
               style: new TextStyle(
                 color: Colors.black,
                 fontSize: 20,
                 fontWeight: FontWeight.w500,
               ),
             ),
          ],
        ),
      ),
      );
  }

  void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);

    double heightSquare = height * height;
    double result = weight/ heightSquare;
    _result = result;
    setState(() {
      
    });
  }
}