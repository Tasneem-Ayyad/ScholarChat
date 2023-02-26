// import 'package:bloc/bloc.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:meta/meta.dart';

// part 'login_state.dart';

// //هسا الخطوه الي بعد ما احدد الستات واكتبهم هي اني اكتب الفنكشن المسووله انها تغيرلي ال يو اي ا
// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit() : super(LoginInitial());
//   //فهسا هون بشوف ايش الفنكشن الي مسووله انها تعملي لوج ان في الفايربيس فبروح اشوف انا وين الفنكشن الي فيها اللوجيك الي كاتبه وين / طبعا جبتها وحطيتلها كوبي هون ا
//   //بعدها ببلش احط الستات عندي هون في الاوميت ا
//   Future<void> loginUser(
//       {required String email, required String password}) async {
//     emit(LoginLoading());
// //ملاحظه مهمه هون في اللوج ان بستخدم ساين ان ويذ ايميل اند باسوورد مش كريدينشل ويذ,, متلل الريجيستر
//     try {
//       UserCredential user = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);

//       emit(LoginSuccess());
//     } on FirebaseAuthException catch (ex) {
//       if (ex.code == "user-not-found") {
//         emit(LoginFailure(errMessage: "user-not-found"));
//       } else if (ex.code == "wrong-password") {
//         emit(LoginFailure(errMessage: "wrong-password"));
//       }
//     } on Exception catch (e) {
//       emit(LoginFailure(errMessage: "Something went wrong"));
//     }
//   }
// }
