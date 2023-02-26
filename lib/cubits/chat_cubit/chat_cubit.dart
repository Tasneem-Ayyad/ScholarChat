import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../models/message.dart';
import '../../pages/constants.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  CollectionReference messages =
      FirebaseFirestore.instance.collection(KMessagesCollections);

//الكيوبيت الي عندي بيعمل شغلتين بجيب رساله و بيبعت رساله ا
  void sendMessage({required String message, required String email}) {
    //هسا هون بين الاقواس هدول بكتب اللوجيك تاعي / هون بجيبه من الشات بيج ا
    try {
      messages.add({
        //انا عندي لما انشأت حطيت في الماسج كي وحده الي هي ماسج
        //فبكتب اسمها اول شي بعدين بكتب هي من وين راح تاخد الداتا تاعتها الي هي هون راح تاخد الداتا تاعتها من السب ميت ا
        kMessage: message,
        //بجيب الوقت الي تم ارسال الرساله فيه عن طريق كلاس اسمه ديت تايم ا
        //دوت ناو يعني بقله اعطيني الوقت الحالي فهو هيك ببيخزن وقت كل رساله بيبعتها ا
        kCreatedAt: DateTime.now(),
        //هون بزيد فيلد زياده الي هو الايدي هاد حطيته علشان يكون لكل مستخدم ايدي خاص فيه وهو يكون عباره عن الايميل علشان شكل الرساله تكون تختلف ما بين المرسل و المستقبل ا
        "id": email
      });
    } on Exception catch (e) {
      // TODO
    }
  }

//الجيت ماسج هون المفروض عملتلها تريجر قبل ما اعمللها ارسال / لانه اصلا اول ما ادخل على شات بشوف الرسائل القديمه موجوده/ مش اضيف رساله بعدها كل الرسائل القديمه تظهر/ لهيك لازم هون الجيت ماسج احطها قبل السيند ا
// هسا قبل ما اروح على شاشه الشات لازم استدعي الميثود هاي ا
//اذن الاحسن اعمل تريجر لهاي الميثود عند شاشه الوج ان بحط في حاله السكسس قبل ما يعمل نافيجات وينتقل لهاي الصفحه اقله قبل ما تنتقل لهاي الصفحه اعمل جيت ماسيج وجيبلي الرسائل القديمه الموجوده ا
  void getMessages() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      List<Message> messagesList2 = [];
      for (var doc in event.docs) {
        messagesList2.add(Message.fromJson(doc));
        // messagesList.add(Message.fromJson(doc));
      }
      emit(ChatSuccess(messages: messagesList2));
    });
  }
}

//////////ملاحظه مهمه ::: انا على هاد المشروع مطبق الكيوبيت و على مشروع الشات الي بالفايل التاني الي نولته من الجيت هب مطبق طريقه البلوك اا