import 'package:bmi_calculator/bmi_calculator_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuseable_card.dart';
import 'icon_content.dart';
import 'result_page.dart';


const double bottomHeight = 80.0;
const int activeCardColor = 0xFF1D1E33;
const int inActiveCardColor = 0xFF111335;

enum Gender {
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;

  int weight = 60;

  int age = 17;

  int maleCardColor = inActiveCardColor;
  int femaleCardColor = inActiveCardColor;

  // 1 = male , 2 = female
  void updateColor(Gender selectedGender) {
    if (selectedGender == Gender.Male) {
      if (maleCardColor == inActiveCardColor) {
        maleCardColor = activeCardColor;
        femaleCardColor = inActiveCardColor;
      } else {
        maleCardColor = inActiveCardColor;
      }
    } else if (selectedGender == Gender.Female) {
      if (femaleCardColor == inActiveCardColor) {
        femaleCardColor = activeCardColor;
        maleCardColor = inActiveCardColor;
      } else {
        femaleCardColor = inActiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("BMI CALCULATOR")),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.Male);
                      });
                    },
                    child: Reuseable_Card(
                      colour: Color(maleCardColor),
                      cardChild: CardContent(
                        icon: FontAwesomeIcons.mars,
                        userText: "MALE",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.Female);
                      });
                    },
                    child: Reuseable_Card(
                      colour: Color(femaleCardColor),
                      cardChild: CardContent(
                        icon: FontAwesomeIcons.venus,
                        userText: "FEMALE",
                      ),
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: Reuseable_Card(
                colour: Color(activeCardColor),
                // REMOVE
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: TextStyle(
                        color: Color(0xFF8D8E98),
                        fontSize: 18.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text("cm"),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbColor: Colors.pink,
                        activeTrackColor: Colors.white,
                        overlayColor: Colors.pink.shade900,
                      ),
                      child: Expanded(
                        child: Slider(
                          value: height.toDouble(),
                          min: 100.0,
                          max: 300.0,
                          onChanged: (double value) {
                            setState(() {
                              height = value.round();
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Reuseable_Card(
                    colour: Color(activeCardColor),
                    // Change
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "MASS",
                          style: TextStyle(
                            color: Color(0xFF8D8E98),
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            floatingActionButton("-", FontAwesomeIcons.minus),
                            SizedBox(
                              width: 10.0,
                            ),
                            floatingActionButton("+", FontAwesomeIcons.plus),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reuseable_Card(
                    colour: Color(activeCardColor),
                    //CHANGE
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: TextStyle(
                            color: Color(0xFF8D8E98),
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            floatingActionButton("1", FontAwesomeIcons.minus),
                            SizedBox(
                              width: 10.0,
                            ),
                            floatingActionButton("2", FontAwesomeIcons.plus),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
            GestureDetector(
                onTap: (){
                CalculatorBrain cal = CalculatorBrain(mass: weight, height: height);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultPage(
                    bmiCalculator: cal.calculatorBmi(),
                    bmiInterpation: cal.getInterpretation(),
                    bmiResult: cal.bmiResult(),
                  )),
                );
              },
              child: Container(

                child: Center(child: Text("Calculation" , style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),)),
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: bottomHeight,
                decoration: BoxDecoration(
                  color: Color(0xFFEB1555),
                ),
              ),
            ),
          ],
        ));
  }

  FloatingActionButton floatingActionButton(String sign, IconData icon) {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          if (sign == "+") {
            weight++;
          } else if (sign == "-") {
            weight--;
          } else if (sign == "2") {
            age++;
          } else if (sign == "1") {
            age--;
          }
        });
      },
      child: Icon(icon),
      backgroundColor: Color(0xFF4C4F5C),
      foregroundColor: Colors.white,
    );
  }
}
