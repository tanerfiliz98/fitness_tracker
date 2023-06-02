import 'package:fitness_tracker/model/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController instance = Get.find<UserController>();
  final Rx<UserModel> _userModel = UserModel().obs;

  UserModel get user => _userModel.value;

  set user(UserModel value) => _userModel.value = value;

  void clear() {
    _userModel.value = UserModel();
  }
}
