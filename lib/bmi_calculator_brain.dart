import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math';
class CalculatorBrain{

  CalculatorBrain({required this.mass , required this.height});

  final int mass;
  final int height;
  double _bmi = 0.0;

  String calculatorBmi()
  {
    _bmi = mass / pow(height/100 , 2);
    return _bmi.toStringAsFixed(1);
  }

  String bmiResult() {
    if (_bmi >= 25) {
      return "OverWeight";
    }
    else if (_bmi >= 18) {
      return "Normal";
    }
    else {
      return "UnderWeight";
    }
  }

  String getInterpretation()
  {
    if (_bmi >= 25) {
      return "Your are overWeight.Do some exercise.";
    }
    else if (_bmi >= 18) {
      return "Your are normal.Good job";
    }
    else {
      return "Your are underWeight.Please eat more";
    }
  }

}
