import 'package:flutter/material.dart';

class Reuseable_Card extends StatelessWidget {
  Reuseable_Card({required this.colour, required this.cardChild});

  final Color colour;
  final Widget cardChild;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
