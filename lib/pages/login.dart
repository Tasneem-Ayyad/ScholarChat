//هسا بدي اكتب هاد التطبيق بطريقه البلوك / فأول شي هون بشاشه اللوج ان بحدد ايش الستاات الي عندي ا
//مثلا هون عندي 3 ستات ممكن تصير لما اعمل لوج ان وهم اول شي لما اعمل لوج ان يعملي لودنج / تاني شي انه بعد ما يعمل لودنح يفوت ويسجل بشكل صحيح/ والتالت انه البيانات تكون غلط وما يسجل دخول ا
//في اكستنشن لطيفه اسمها بلوك بتوفرلي كومبوننت مفيده ممكن استخدمها منها اني اقدر انشئ الكيوبيت على طول بدل ما اروح واكتب الكود تاعي بأيدي فهو بينشئلي الشكل العام للكيوبيت  ا
//اذن بعد ما انشئ الستات والكيوبيت هسا بدي اخلي ال يو اي عندي يتعامل مع اللوج ان كيوبيت// فأول شي بروح على المين وبوفر هاد الكيوبيت يلاا ا
//رحت على الماتيريل في المين وعملتلها راب للبلوك بروفايدر وبحط في السبجيكت تاعه اللوج ان كيوبيت ا
// هسا هون في صفحه اللوج ان بستخدم الكود الي بيتعامل مع اللوج ان كيوبيت ا
//ملاحظه مهمه جدا جدا في البلوك  دائما بنستخدم الستات ليس مش فل فهسا هون بغيرها من ستات فل الى ليس  ا
//طبعا هون بشوف ايش الاشي الي عندي في ال يو اي بيضل يتغير علشان احط فوقيه البلوك سواء البلوك ليسينر او كونسيومر ا
//هسا بنعمل تريجر للوج ان كيوبيت/ هسا بروح على المكان الي المفروض يعمل تريجير للكيوبيت ألا وهو اللوج ان بوتوم هون ا
//******************************************* */
//ملاحظه مهمه جدا :: الاحسن نقسم المشروع عنا فيشر وكل فيشر بضيفها في ملف الفيشر// يعني مثلا في حاله التطبيق هاد شاشه اللوج ان وشاشه الريجيستر بنعتبرهم لحالهم فيشر وبنسميهم-الاوث فيشر- لهيك كمان الاحسن بدل ما اعمل كيوبيت لكل واحد منهم اني اعمل كيوبيت واحد بيضم اللوج ان و الريجيستر   ا
//هسا بعد ما احطهم مع بعض بقدر اروح امسحهم الكيوبيت كل وحده لحال بس انا خليته للتعليم ا
// المهم هسا كمان بروح على ال يو اي بخليهم كلهم يتعاملو مع الاوث كيوبيت ا
import 'package:chat_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_snack_bar.dart';
import '../widgets/customButton.dart';
import '../widgets/custom_text_field.dart';
import 'chat_page.dart';
import 'constants.dart';
import 'resgister_page.dart';

class LoginPage extends StatelessWidget {
  static String id = 'loginPage';
  bool isLoading = false;
  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
//ملاحظه هون راح نستخدم بلوك جديد وهو البلوك ليسينر والي فيه على اساس ستات جاييتلي بنفذ مجموعه من الاكواد حسب اختلاف الستات يعني ما ببني فيها يو اي مختلف ا
    //البلوك ليسينر بيختلف عن البلوك بيلدر انه البلوك بيلدر بيحتوي على بيلدر فقط لا غير/ ونحنا حكينا انه البيلدر الهدف منه انه بيبني ال يو اي تاعي على اساس الستات الي جاييتلي زي الويذر اب انه على اساس كل ستات ببني يو اي مختلف بالكامل  ا
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        //هسا هون البلوك هو فعليا بيعمل ليسن للستات الي عندي لكككننن ما بعمل ابديت لل يو اي لما يصير عنا قيمه جديده قبل كان عنا سيت ستات و بروفايدر  ا
        //هسا الليسينر هاد هدفه بستخدمه لما ما اكون مهتم ابدا اني اعيد بناء ال يو اي ا
        //انا بكون بس مهتم فيه انه في حاله الستات اجتني فقط انفذ مجموعه اكواد فقط لا غير ا
        //لهيك في المكان هاد كان الافضل انه استخدم البلوك كونسيومير مش ليسيلنر لانه البلوك كونسيومر بوفرلي ال2 الليسينر والبيلدر بس خليت الليسين علشان اعرف ايش استخدامه واهميته ا
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          BlocProvider.of<ChatCubit>(context).getMessages();
          Navigator.pushNamed(context, ChatPage.id);
          //هاي بكتبها هون انها تساوي فولس علشان خلص توقف اشاره الودنج ا
          isLoading = false;
        } else if (state is LoginFailure) {
          showSnackBar(context, state.errMessage);
          isLoading = false;
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            //سيميترك يعني راب من جهه وحده يعني هون انا  بدي من جهتين يمين و يسار تكون البادنج لان حددت هوريزنتل ا
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formKey,
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
                  CustomValedationTextFeild(
                    onChange: (data) {
                      email = data;
                    },
                    hintText: " Enter Email",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomValedationTextFeild(
                    //هون خليتها ترو علشان ما تبين كلمه السر ا
                    variableObscureText: true,
                    onChange: (data) {
                      password = data;
                    },
                    hintText: "Password",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                      onTapp: () async {
                        if (formKey.currentState!.validate()) {
                          //هسا هون عندي بعد ما يعمل فاليدات راح يبدأ ويعمل عمليه لوج ان فببلش هون اسنخدم البلوك بروفايدر ا
                          //طبعا بحددله انه انا بدي اتعامل مع اللوج ان كيوبيت وبقله يعملي لوج ان لليوزر ا
                          BlocProvider.of<AuthCubit>(context)
                              .loginUser(email: email!, password: password!);

                          //مسحت كل هاد الي تحت لاني عدلت على الكود هاد بطريقه البلوك لانه كل هدول الاكواد الي تحت اختصرتهم فقط بسطر واحد فوق بالبلوك لاني فصلت اليو اي عن اللوجيك ا
                          // isLoading = true;
                          // //مستحتها لانه خلص بالبلوك بنبطل محتاجينها ا
                          // // setState(() {});

                          // ///بما انه الشو سناك بار بيضل يتكرر معيوانا بستخدمه كتير فبروح اعمل فولدر هيلبر وبحكه حوا فايل عشان بدل ما ارحع اكتبه كل مره بس بستخدمه مره وحده
                          // try {
                          //   await loginUser();
                          //   //الارجيومينت هي البيانات الي ببعتها للشاشه الي انا رايح الها والارجيومينت هي بتاخد اوبجيكت / انا هون حطيت الايميل ا
                          //   Navigator.pushNamed(context, ChatPage.id,
                          //       arguments: email);
                          //   // showSnackBar(context, 'success');
                          // } on FirebaseAuthException catch (ex) {
                          //   if (ex.code == "user-not-found") {
                          //     showSnackBar(context, 'user-not-found ');
                          //   } else if (ex.code == "wrong-password") {
                          //     showSnackBar(context, 'wrong-password');
                          //   }
                          // } catch (ex) {
                          //   showSnackBar(context, 'there was an error');
                          // }
                          // isLoading = false;
                          // //  setState(() {});
                        } else {}
                      },
                      text: "log in"),
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
                        onTap: () =>
                            Navigator.pushNamed(context, RegisterPage.id),
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
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
//ملاحظه مهمه هون في اللوج ان بستخدم ساين ان ويذ ايميل اند باسوورد مش كريدينشل ويذ,, متلل الريجيستر
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}

// لما ويدجت معينه تتكررر معنا كتير الاحسن نعملللها ريفاكتور لهاي الويدجت علشان بدل ما اكتبها كل مره اصير استدعيها فقط كل ما استخدمها
//هيني انشأت فولدر اسمه ويدجت عشان احط فيه كل الويدجت الي بتتكرر
