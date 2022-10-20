import 'dart:io';

import 'package:chat_app/core/controllers/users_models.dart';
import 'package:chat_app/ui/screens/verification_screen/verification_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppFirebase {
  Future<void> sendVerificationCode(String number) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: (PhoneAuthCredential credential) {
        printInfo(info: 'User Verified');
      },
      verificationFailed: (FirebaseAuthException e) {
        printInfo(info: e.message!);
      },
      codeSent: (String verificationId, int? rasendToken) async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setString('code', verificationId);
        Get.to(const VerificationScreen());
      },
      //OTP for 2 min timeout
      // timeout: const Duration(seconds: 120),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> verifyOTP(String otp) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? verificationId = preferences.getString('code');
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId!,
      smsCode: otp,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> createUser(UserModel userModel) async {
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    await FirebaseAuth.instance.currentUser?.updateDisplayName(userModel.name);
    await FirebaseAuth.instance.currentUser?.updatePhotoURL(userModel.image);
    SharedPreferences.getInstance().then((value) {
      value.setString('number', userModel.number);
    });
    return await ref.doc(userModel.uId).set(userModel.toJson());
  }

  Future<String> uploadUserImage(String path, String uId, File file) async {
    final _firebaseStorage = FirebaseStorage.instance;
    print(file.path);
    var snapshot = await _firebaseStorage.ref(uId).child(path).putFile(file);
    var downloadUrl = await snapshot.ref.getDownloadURL();
    print(downloadUrl);
    return downloadUrl;
  }
}
