import 'package:chat_app/pages/resgister_page.dart';
import 'package:chat_app/widgets/customButton.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import 'constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                  "LogIN",
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
            CustomButton(text: "log in"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    color: Color(0xffC7EDE6),
                  ),
                ),
                GestureDetector(
                  //ملاحظه مهمه جدا جدا هسا انا لما احط في النافيجاتر بش فهو بكون احط الشاشات فوق بعض يعني لما احط على زر الرجوع برجعني على الشاشه الي قبلها كل الشاشات فوق بعض بصيرو
                  //لهيك انا هون بهاي الحاله ما بلزمني البوش بلزمني البوب عشان ارجع لويدجت قديمه موجوده عندي  ا
                  //لازم الاسم الي هون يكون نفس الاسم الي بالروت اذا مش نفسه ميه بالميه بطلعلي اكسبشن لهيك انا لازم اخلي عندي كمان طريقه ليقدر يوصله ويتعرف عليه بما انه هاد الاسم خاص في الريجيستر بيج اذن بخليه يوصل عن طريق الريجيستر بيج ف بنروح على الريجيستر بيج و بعمل سترينج و بسميه ايدي و بكتب جواته ريجيستر بيج  ا
                  //فأنا خلص بمسح السترنج تاع الريجستر بيج و بكتب هيك بقله فيها اعطيني السترنج نيم من الريجستر بيج - بنشئ منها اوبجيكت و بعدها بجيب الايدي تبعها ا
                  onTap: () => Navigator.pushNamed(context, RegisterPage.id),
                  child: Text(
                    "Register",
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
// لما ويدجت معينه تتكررر معنا كتير الاحسن نعملللها ريفاكتور لهاي الويدجت علشان بدل ما اكتبها كل مره اصير استدعيها فقط كل ما استخدمها
//هيني انشأت فولدر اسمه ويدجت عشان احط فيه كل الويدجت الي بتتكرر
