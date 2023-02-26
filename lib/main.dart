import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/auth_cubit/auth_cubit.dart';
import 'cubits/chat_cubit/chat_cubit.dart';
import 'firebase_options.dart';
import 'pages/chat_page.dart';
import 'pages/login.dart';
import 'pages/resgister_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //علشان هون اوفر اكتر من كيوبيت بستخدم اشي اسمه ملتي بلوك بروفايدر وفي جواه اتريبيوت اسمها بروفايدر بحط جواها كل البروفايدر الي عنا ا
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => LoginCubit()),
        // BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ChatCubit()),
      ],
      child: MaterialApp(
        //الراوت هاي عباره عن ماب بقدر اربط من خلالها بين كي الي هو السترنج تاعي و فاليو الي هي الويدجت الي حاب ارجعه لما اكتب هاد السترنج ا
        routes: {
          "LoginPage": (context) => LoginPage(),
          // بعمل هيك عشان اكون ضامن انه الايدي الي هون نفس الايدي الي بالريجيستر بيج ا
          RegisterPage.id: (context) => RegisterPage(),
          ChatPage.id: (context) => ChatPage(),
        },
        // بما اني هون بستخدم روت ما بستخدم هون بستخدم انيشيل راوت وهي بتاخد اسم الستر ج الي راح يعرض الصفحه تاعته  ا
        //home: LoginPage(),
        initialRoute: "LoginPage",
      ),
    );
  }
}
