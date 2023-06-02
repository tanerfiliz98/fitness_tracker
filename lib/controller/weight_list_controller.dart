import 'package:fitness_tracker/controller/user_controller.dart';
import 'package:fitness_tracker/model/weight_model.dart';
import 'package:fitness_tracker/service/database.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WeightListController extends GetxController {
  final Rx<List<WeightModel>> _weightList = Rx<List<WeightModel>>([]);
  List<WeightModel> get weights => _weightList.value;
  var format = DateFormat('Hm');
  @override
  Future<void> onReady() async {
    super.onReady();
    String uid = UserController.instance.user.id!;
    _weightList.bindStream(await Database.instance.weightStream(uid));
  }
}