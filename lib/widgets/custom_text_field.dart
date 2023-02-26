import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'dart:html';

class CustomValedationTextFeild extends StatelessWidget {
  //هون بكتب الكونستركتر
  //بعطيه قيمه ابتدائيه للاوب سيكيور تيكست انه يساوي فولس علشان يتغير بس لما انا اروح احدد وين يكون ترو يعني وني ما يبين ا
  CustomValedationTextFeild(
      {this.hintText, this.onChange, this.variableObscureText = false});
//هو بياخد فنكشن والفنكشن بتاخد الارجيومينت سترينج ا
  Function(String)? onChange;
  String? hintText;
  bool? variableObscureText;
  @override
  Widget build(BuildContext context) {
    //عشان اخليه يتحقق من الشي الي جوا التيكست فيلد بخليها تيكست فورم فيلد مش تيكست فيلد ا
    return TextFormField(
      //هسا علشان لما اكتب كلمه سر ما تبين تكون نجوم يعني بستهدم هاي اوبسيكيور تيكست
      //لكن اذا خليتها هيك فهو اللايميل وكلنه السر بصيرو نجوم علشان احدد انه بس اشي معين الي بدي اياه نجوم فهو بعرف متعير ب اسمها لاستخدمه وين ما بدي يكون نجوم ا
      obscureText: variableObscureText!,
      //طبعا جوا التيكست فورم فيلد فيه فاليداتر
      //في الفاليداتر اول شي بحط الداتا تاعتنا الي حيشتغل عليها ا
      validator: (data) {
//هون بعمل فاليدات عالداتا هاي بشوفها اذا مطابقه للشي الي بدي اياه ولا لا
        //مثلا هون بقله اذا كانت البيانات فاضيه فهو رجعلي انه هاد الحقل مطلوب
        if (data!.isEmpty) {
          return "field is required";
        }
      },
      //طبعا بستخدم هون اون شينج مش اون سبمت
      onChanged: onChange,
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
