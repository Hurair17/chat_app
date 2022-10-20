import 'package:chat_app/core/controllers/users_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  Rx<UserModel> userModel = UserModel(
    uId: '',
    name: '',
    image: '',
    number: '',
    status: '',
    typing: '',
    online: '',
  ).obs;

  @override
  void onInit() {
    super.onInit();
    FirebaseFirestore.instance
        .collection('user')
        .doc(auth.currentUser?.uid)
        .get()
        .then((value) {
      if (value.exists) {
        userModel.value =
            UserModel.fromJson(value.data() as Map<String, dynamic>);
      }
    });
  }
}
