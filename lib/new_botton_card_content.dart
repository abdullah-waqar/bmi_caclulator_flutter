import 'package:flutter/material.dart';

class BottonCardContent extends StatelessWidget {

  BottonCardContent({required this.userText});
  final String userText;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$userText' ,style: TextStyle(
      fontSize: 18.0,
      color: Color(0xFF8D8E98),),),
      ],
    );
  }
}
