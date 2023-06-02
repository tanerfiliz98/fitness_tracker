import 'package:fitness_tracker/controller/auth_controller.dart';
import 'package:fitness_tracker/controller/user_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserController>(UserController(), permanent: true);
    Get.put<AuthController>(AuthController(), permanent: true);

  }
}