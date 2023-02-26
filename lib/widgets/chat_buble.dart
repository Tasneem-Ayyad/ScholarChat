import 'package:flutter/material.dart';

import '../models/message.dart';
import '../pages/constants.dart';

class chatBubble extends StatelessWidget {
  const chatBubble({Key? key, required this.message}) : super(key: key);
  final Message message;

  @override
  Widget build(BuildContext context) {
    return
        //بحط الكونتينر جوا الاين علشان في الشات اب الشات الوخده عرضها ما ياخد عرض الشاشه بالكامل ا
        Align(
      // بحط ال الاين علشان ياخد المساحه تاعت الكونتينر الي حددتها لان اذا ما كتبتها فهو بياخد مساحه الشاشه كامله
      alignment: Alignment.centerLeft,
      child: Container(
        //لكن طبعا مش صح
        // height: 65,
        // width: 150,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            //هون علشان الشكل الي بنلاحظه في ريديس من كل الزوايا عدا زاويه محدده فهيك بعملها
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: kPrimaryColor,
        ),
        child: Text(
          //هون بحط انه يعرض الماسج الي انا بكتبها ا
          message.message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

/// طبها كررتها مرتين علشان وج\ه تكون للرد ووحده للاجابه
class chatBubbleForFriend extends StatelessWidget {
  const chatBubbleForFriend({Key? key, required this.message})
      : super(key: key);
  final Message message;

  @override
  Widget build(BuildContext context) {
    return
        //بحط الكونتينر جوا الاين علشان في الشات اب الشات الوخده عرضها ما ياخد عرض الشاشه بالكامل ا
        Align(
      // بحط ال الاين علشان ياخد المساحه تاعت الكونتينر الي حددتها لان اذا ما كتبتها فهو بياخد مساحه الشاشه كامله
      alignment: Alignment.centerRight,
      child: Container(
        //لكن طبعا مش صح
        // height: 65,
        // width: 150,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            //هون علشان الشكل الي بنلاحظه في ريديس من كل الزوايا عدا زاويه محدده فهيك بعملها
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          color: Colors.orange,
        ),
        child: Text(
          //هون بحط انه يعرض الماسج الي انا بكتبها ا
          message.message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
