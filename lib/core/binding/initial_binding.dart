import 'package:chat_app/core/controllers/login_controller.dart';
import 'package:get/get.dart';

class IntialBinding extends Bindings {
  @override
  void dependencies() {
    //here we initialize our controller or inital things
    //we need controller when our app start to check user login or not
    Get.lazyPut(() => LoginController());
  }
}
