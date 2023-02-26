import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

//import 'dart:html';
class CustomButton extends StatelessWidget {
  CustomButton({this.onTapp, required this.text});
  VoidCallback? onTapp;
  String text;
  @override
  Widget build(BuildContext context) {
    //حطيته جوا جيستر ديتيكنر عشان لما اضغط عليه يتفعل
    return GestureDetector(
      //الاون تاب بتكون متغيره لانه الزر هاد بستخدمه باكتر من مكان
      onTap: onTapp,
      child: Container(
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
      ),
      
    );
  }
}
