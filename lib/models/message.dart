import '../pages/constants.dart';

class Message {
  final String message;
  //لما استقبل الرساله المفروض استقبل الايدي تاع الرساله كمان /الي نحنا هون حددنا في اللوج ان يكون الايميل  ا
  final String id;
  Message(this.message, this.id);

  //راح احط فاكتوري لانه الداتا الي راجعالي هي اصلا جيسون داتا بس هو هون عامللها دي كود لانه هو المفروض تيجيني على هيئه سترينج بعدهااعمللها دي كود بعدها ابعتها للفاكتوري كونستركتر   ا
//بس هون بما انه عامللها دي كود فوفر علي بس بضل علي اني اعمل فاكتوري كونستركتر واستقبل البيانات على طول   ا

  factory Message.fromJson(jsonData) {
    return Message(jsonData[kMessage], jsonData['id']);
  }
}
