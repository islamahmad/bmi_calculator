import 'package:flutter/material.dart';

class BMIHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BMIHomeState();
  }
}

class BMIHomeState extends State<BMIHome> {
  final double _paddingConst = 15.0;
  String calcdBMI = '';
  String judgement = '';
  String warning = '';
  final TextEditingController weightTextController = TextEditingController();
  final TextEditingController heightTextController = TextEditingController();
  void calculateBMI() {
    setState(() {
      if (weightTextController.text.isNotEmpty &&
          heightTextController.text.isNotEmpty) {
        warning = '';
        calcBMI(double.parse(weightTextController.text),
            double.parse(heightTextController.text));
      } else {
        warning = 'Enter your weight and height';
        judgement = 'Evaluation is unknown';
        calcdBMI = 'unknown';
      }
    });
  }

  void calcBMI(double weight, double height) {
    double BMI = weight / (height * height);
    calcdBMI = BMI.toStringAsFixed(2);
    judgeBMI(calcdBMI);
  }

  void judgeBMI(String calcdBMI) {
    double BMI = double.parse(calcdBMI);
    if (BMI < 20.0) {
      judgement = 'Thin';
    } else if (BMI > 25.0) {
      judgement = 'Over weight';
    } else {
      judgement = 'Alright';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          textDirection: TextDirection.ltr,
        ),
      ),
      //bottomNavigationBar: BottomNavigationBar(items: [BottomNavigationBarItem(           icon: Icon(Icons.send), title: Text('Calculate')), BottomNavigationBarItem(icon: Icon(Icons.history), title: Text('Reset')),]),
      body: ListView(
        padding: EdgeInsets.all(_paddingConst),
        children: <Widget>[
          //Image(image: null),
          Container(
            padding: EdgeInsets.all(_paddingConst),
            height: 40.0,
            child: Text('Your BMI Calculator'),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(_paddingConst),
                  height: 40.0,
                  child: Text(
                    'Your weight:',
                  ),
                ),
                Container(
                  height: 40.0,
                  child: TextField(
                    controller: weightTextController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'in kilo grams',
                      labelText: 'Your weight',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(_paddingConst),
                ),
                Container(
                  padding: EdgeInsets.all(_paddingConst),
                  height: 40.0,
                  child: Text(
                    'Your height:',
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(_paddingConst),
                  child: TextField(
                    controller: heightTextController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'in meters',
                      labelText: 'Your height',
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue,
                  child: FlatButton(
                    onPressed: calculateBMI,
                    child: Text(
                      'Calculate',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Your BMI is $calcdBMI',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  '$judgement',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  '$warning',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //showDialog(context: context ,builder: (context) => warning),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
