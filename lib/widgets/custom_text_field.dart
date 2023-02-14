import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'dart:html';

class CustomTextFeild extends StatelessWidget {
  //هون بكتب الكونستركتر
  CustomTextFeild({this.hintText});

  String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          // طبعا الهينت تيكست بيتغير من فيلد لفيلد لهيك فوق بعمل متغير
          hintText: hintText,
          //في البوردر في عندي شي اسمه فوكس بوردر وهو الي بصير لما انا اضغط على التيكست فيلد فبحدد كيف يتغير لونه وفي اشي اسمه اينابل بودر الي هو بالوضع الطبيعي ايش لونه
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white))),
    );
  }
}
