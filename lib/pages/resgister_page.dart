import 'package:chat_app/pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../widgets/customButton.dart';
import '../widgets/custom_text_field.dart';
import 'constants.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  //لو بدي اخلي الايدي هون خاصه في الكلاس مش الاوبجيكت فهو بحط ستاتك
  // فأنا هيك لما اخليه ستاتك ما بصير اقدر اوصله من اوبجيكت من هاد الكلاس لانه بقدر أأكسسه عن طريق اللكلاس على طول ا
  // ملااااااااااااحظه مهمه جداااااا
  // هيك بستدعيه من اوبجيكت من هاد الكلاس لما يكون مش ستاتيك
  //لكن لما يكون ستاتك هيك بستعيها من الكلاس الفرق يعني بينهم هو فقط الاقواس اذا في اقواس يعني من اوبجيكت اذا ما حطيت يعني من الكلاس
  //RegisterPage().id هاد اوبجيكت
  // RegisterPage.id هيك من الكلاس نفسه

  static String id = 'registerPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        //سيميترك يعني راب من جهه وحده يعني هون انا  بدي من جهتين يمين و يسار تكون البادنج لان حددت هوريزنتل ا
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            Spacer(
              flex: 2,
            ),
            Row(
              children: [
                Text(
                  "REGISTER",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFeild(
              hintText: " Enter Email",
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFeild(
              hintText: "Password",
            ),
            SizedBox(
              height: 10,
            ),
            CustomButton(
              text: "Register",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    color: Color(0xffC7EDE6),
                  ),
                ),
                //هاي الطريقه الاولى علشان لما اكبس على شي يوديني على صفحه تانيه وهيك لكن في طريقه تانيه وهي الي تحت
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) {
                //       return LoginPage();
                //     }));
                //   },
                //   child: Text(
                //     "Log in",
                //     style: TextStyle(color: Color(0xffC7EDE6)),
                //   ),
                // ),

                //هاي الطريقه التانيه علشان يخليني اتنقل من اشي ل اشي لما اكبس عليها بس هاي الطريقه بتحتاج اني اعرفلها روت في الهوم بيج ا
                GestureDetector(
                  onTap: (() {
                    //بش نيم الطريقه التانيه
                    //هسا لازم اخلي هاد السترنج يعبر عن الويدجت الي بدي اياه يروح الهافبعمل هاد الشي عن طريق الماتيييريل اب بنروح هناك نعمل روت ا
                    // البش بتحكيله روح دور على اللوجن بيج الموجوده في الماتيريل اب و اول ما تلاقيها اعمل ريتيرن للوج يبج الي عندي الي بدي اياها ا

                    //ملاحظه مهمه جدا جدا هسا انا لما احط في النافيجاتر بش فهو بكون احط الشاشات فوق بعض يعني لما احط على زر الرجوع برجعني على الشاشه الي قبلها كل الشاشات فوق بعض بصيرو
                    //لهيك انا هون بهاي الحاله ما بلزمني البوش بلزمني البوب عشان ارجع لويدجت قديمه موجوده عندي
                    // Navigator.pushNamed(context, 'LoginPage');
                    Navigator.pop(context);
                  }),
                  child: Text(
                    "Log in",
                    style: TextStyle(color: Color(0xffC7EDE6)),
                  ),
                ),
              ],
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
