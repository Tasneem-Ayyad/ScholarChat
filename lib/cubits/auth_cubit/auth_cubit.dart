import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  //فهسا هون بشوف ايش الفنكشن الي مسووله انها تعملي لوج ان في الفايربيس فبروح اشوف انا وين الفنكشن الي فيها اللوجيك الي كاتبه وين / طبعا جبتها وحطيتلها كوبي هون ا
  //بعدها ببلش احط الستات عندي هون في الاوميت ا
  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
//ملاحظه مهمه هون في اللوج ان بستخدم ساين ان ويذ ايميل اند باسوورد مش كريدينشل ويذ,, متلل الريجيستر
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      emit(LoginSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == "user-not-found") {
        emit(LoginFailure(errMessage: "user-not-found"));
      } else if (ex.code == "wrong-password") {
        emit(LoginFailure(errMessage: "wrong-password"));
      }
    } on Exception catch (e) {
      emit(LoginFailure(errMessage: "Something went wrong"));
    }
  }

  Future<void> registerUser(
      {required String email, required String password}) async {
    var auth = FirebaseAuth.instance;
    emit(RegisterLoading());
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == "weak-password") {
        emit(RegisterFailure(errMessage: "weak password"));
      } else if (ex.code == "email-already-in-use") {
        emit(RegisterFailure(errMessage: "email already in use"));
      }
    } catch (e) {
      emit(RegisterFailure(errMessage: "there was an error please try again"));
    }
  }
}
