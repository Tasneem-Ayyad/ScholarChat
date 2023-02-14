import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

//import 'dart:html';
class CustomButton extends StatelessWidget {
  CustomButton({required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      //هون بقله افينتي يعني ياخد عرض الشاشه كامله
      width: double.infinity,
      height: 60,
      child: Center(
        child: Text(text),
      ),
    );
  }
}
