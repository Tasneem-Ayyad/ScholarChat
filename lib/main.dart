import 'package:chat_app/pages/login.dart';
import 'package:chat_app/pages/resgister_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

void main() {
  runApp(ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //الراوت هاي عباره عن ماب بقدر اربط من خلالها بين كي الي هو السترنج تاعي و فاليو الي هي الويدجت الي حاب ارجعه لما اكتب هاد السترنج ا
      routes: {
        "LoginPage": (context) => LoginPage(),
        // بعمل هيك عشان اكون ضامن انه الايدي الي هون نفس الايدي الي بالريجيستر بيج ا
        RegisterPage.id: (context) => RegisterPage(),
      },
      // بما اني هون بستخدم روت ما بستخدم هون بستخدم انيشيل راوت وهي بتاخد اسم الستر ج الي راح يعرض الصفحه تاعته  ا
      //home: LoginPage(),
      initialRoute: "LoginPage",
    );
  }
}
