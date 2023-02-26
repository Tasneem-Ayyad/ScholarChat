import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../cubits/auth_cubit/auth_cubit.dart';
import '../widgets/customButton.dart';
import '../widgets/custom_text_field.dart';
import 'chat_page.dart';
import 'constants.dart';

//لو بدي اخلي الايدي هون خاصه في الكلاس مش الاوبجيكت فهو بحط ستاتك
// فأنا هيك لما اخليه ستاتك ما بصير اقدر اوصله من اوبجيكت من هاد الكلاس لانه بقدر أأكسسه عن طريق اللكلاس على طول ا
// ملااااااااااااحظه مهمه جداااااا
// هيك بستدعيه من اوبجيكت من هاد الكلاس لما يكون مش ستاتيك
//لكن لما يكون ستاتك هيك بستعيها من الكلاس الفرق يعني بينهم هو فقط الاقواس اذا في اقواس يعني من اوبجيكت اذا ما حطيت يعني من الكلاس
//RegisterPage().id هاد اوبجيكت
// RegisterPage.id هيك من الكلاس نفسه

class RegisterPage extends StatelessWidget {
  static String id = 'registerPage';

  String? email;

  String? password;
//بعرق متغير اللودنج وبعطيه قيمه ابتدائيه فولس
  bool isLoading = false;

//الفورم بحدد انه هاد الكي شغال جوا ايش هون الكي شغال جوا الفورم لهيك كتبت فورم ستات
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          Navigator.pushNamed(context, ChatPage.id);
          //هاي بكتبها هون انها تساوي فولس علشان خلص توقف اشاره الودنج ا
          isLoading = false;
        } else if (state is RegisterFailure) {
          showSnackBar(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: Padding(
              //سيميترك يعني راب من جهه وحده يعني هون انا  بدي من جهتين يمين و يسار تكون البادنج لان حددت هوريزنتل ا
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Form(
                //يتبع.. بعد ما حكينا تحت ايش اهميه الفورم وليش حطيناها راح نحكي هون عن الكي بكتبها لما استخدم الفورم
                //ففوق بروح انشئ متغير اسمه كي وبحط نوعه جلوبل كي ا
                //الكي هو مفتاح للفورم يعني بيعطيني اكسس لكل شي جواها ا
                key: formKey,
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
                    CustomValedationTextFeild(
                      //هو راح يستقبل سترينج لهيك بقله هون انه يستخدمه في متغير اسمه داتا
                      onChange: (data) {
                        //المتغير ايميل الي عرغته فوق راح اخزن فيه الداتا الي دخلها اليوزر
                        email = data;
                      },
                      hintText: " Enter Email",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomValedationTextFeild(
                      onChange: (data) {
                        password = data;
                      },
                      hintText: "Password",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      //هاي انا انشئتها بالكلاس الي فيه الاشياء المشتركه وحطيتها في كونستراكتر لانه تنفيذها بيختلف من زر ل زر
                      onTapp: () async {
                        //من الريفاككتور بختار اني احط كلشي في التراي جوا اف كوندشن ا
                        //جوا الفورم كونديشن بستخدم الفورم كي الي عرفتها فوق لانه من خلالها بقدرر أأكسس كلشي جوا الفورم ا
                        //وبقله هسا بدي الستات تاعت الفورم ا
                        //بعدها بعد ما اوصل لحالتها الحاليه بقله بدي اعمل فاليدات لالها
                        //لما تعمللها فاليدات اذا شفتها مطابقه نفذ الشي الي جوا ال اف
                        //ولو مش مطابقه فهو نفذ الاشي الي جوا ايلس ا
                        //طبعا بحكيله القيمه اكيد مش نل عشان يقبل الفاليدات ا
                        //هسا علشان احددله طريقه الفاليدات انا كيف بدي اياهالايعني والله بقله بدي الايميل هيك يكون والباسوورد هيك .. ما بدي اياه يدخل اشي معين في الباسوورد فهو من خلال التيكست فيلد بروح احددهم وبخليه تيكست فورم فيلد ا
                        if (formKey.currentState!.validate()) {
                          // طبعا مسحت كل الي تحت علشان استخدم البلوك بروفايدر الي حيعمل تريجر لل يو اي
                          BlocProvider.of<AuthCubit>(context)
                              .registerUser(email: email!, password: password!);

                          //هون بحط اللونج اول ما يفوت جوا ال اف بقله في كود حيشتغل فأعملي لودنج ا
                          //  isLoading = true;
                          //بحط هون سيت ستات علشان تغير حاله اليو اي لما تصير ترو
                          //   setState(() {});
                          //   try {
                          //////ملاحظه مهمه جدااااااا هيك الكود شكله مش لطيف لهيك بروح اعمله ريفاكتور يعني بحطه في مبثود و بستدعي هاي الميقود هون وبس بحط الاشي الي حيتغير خصوصا اني راح اكون استخدمها في اكتر من مكان فهي راح تكون تتغير نم بس اشي بسيط من مكان ل مكان وهون مقلا الاشي الي حيتغير هو الرساله فبهرعا كارجيومينت
                          //بكبس على الكودوبحط اكستراكت ميثود فبضغط عليه وبعدها بكتب اسم الميثود ا
                          //   await registerUser();
                          //هون مسحت انه ما يطلعلي نجاح علشان لما ينجح يروح على صفحه الشات
                          //  showSnackBar(context, 'success');
                          //هون في لروت بحط الايدي تاع الشات بيج علشان يروح عليها
                          //   Navigator.pushNamed(context, ChatPage.id);
                          // } on FirebaseAuthException catch (ex) {
                          //عشان اظهر لليوزر انه في مشكله اذا فيمشكله او انه كلشي تمام اذا كلشي تمام بستخدم كلاس اسمه سكافولد مسيجير ا
                          //دايما بتاخد سناك بار
                          //والسناك بار بار بتاخد الكونتينت وهي محتوى الشي الي حيظهر لليوزر طبعا هدول موجودين بالميثود التحت ا

                          //   if (ex.code == 'weak-password') {
                          //     showSnackBar(context, 'weak password');
                          //   } else if (ex.code == 'email-already-in-use') {
                          //     showSnackBar(context, 'email already exists');
                          //   }
                          // }
                          //هاي بستخدمها عشان اهندل اي اكسبشن عندي مش بس الااكسبشن الي في الفيير بيس /يعني مقلا ما دخلت اليوزر نيم وبالباسوورد وعملت تسجيل يهندل هاد الاكسبشن
                          // catch (ex) {
                          //   showSnackBar(context, 'there was an error');
                          // }
                          //هون بعد ما تخلص التراي والكاتش بخلي اللودنج فولس
                          //   isLoading = false;
                          //وبحط هون سيت ستات عشان تتعير حاله اليو اي لما تكون تساوي فولس
                          //   setState(() {});
                        } else {}
                      },
                      //عشان اعمل فاليداشن للقيم الي راح تدخل هاي البيانات الي راح يتأكد منها بحطها جوا ويدجت اسمها فورم/ هاي الويدجت الهدف منها انها بتسمحلي اعمل فاليداشن لمجموعه من البيانات ففي البدايه بحدد ايش مجموعه الويدجت الي بدي اعمللهم فاليداشن هون بدي اعمل للايميل والباسوورد فبروح على الويدجت الي فيها الايميل والباسوورد هون عندي اللليست فيو فيها الايميل والباسوورد الي بدي اعمللهم عمليه فاليداشن فبروح على هاي الويدجت الي هي الليست فيو وبحطها جوا ويدجت الفورم  ا
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
            ),
          ),
        );
      },
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> registerUser() async {
    var auth = FirebaseAuth.instance;
    //الايميل و الباسوورد هدول جايينلي من التيكست فيلد الي فوق لهيك فوق بنشئ متغيرات لاخزن فيهم القيم ا
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}
//ملاحظه مهمه جدا هسا لو كان عندي التطبيق ما بيشتغل الا من خلال انترنت وفصلت الانترنت عنه فرازم يطلعلي اشاره لودنج انه بيحمل
//فبروح انزل مكتبه للودنج اسمها model progress HUD
//بحطها فوق المكان الي حابب اعرض فيه اللودنج انديكاتر انا هون بدي اعرض اللودنج انديكاتر فوق الشاشه هاي كلها فبالتالي بحطها هون فوق السكافولد  ا
//بعمل راب ويذ ويدحت وبكتب الموديل بروجريس هب ا
//وهو بياخد اشي ريكويارد الي هو الاسينك كول ا
