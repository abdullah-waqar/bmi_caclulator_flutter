import 'package:bmi_calculator/reuseable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  ResultPage({required this.bmiCalculator , required this.bmiInterpation , required this.bmiResult});

  final String bmiCalculator;
  final String bmiInterpation;
  final String bmiResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI CALCULATOR")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Text(
              "Your Result",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Reuseable_Card(
                colour: Color(0xFF060C10),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text( bmiResult , style: TextStyle(
                      color: Color(0xFF24D876),

                      fontSize: 30.0,
                    ),),
                    Text(bmiCalculator , style: TextStyle(
                        fontSize: 100.0,
                        color: Colors.white
                    ),),

                    Text(bmiInterpation , style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),)

                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: GestureDetector(

                onTap: (){
                  Navigator.pop(context);
                },

                child: Container(
                  color: Colors.pink,
                  width: double.infinity,
                  child: Center(
                      child: Text(
                        "Re-Calculate",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ))
        ],
      ),
    );
  }
}
