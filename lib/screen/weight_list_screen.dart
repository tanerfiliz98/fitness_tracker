import 'package:fitness_tracker/controller/user_controller.dart';
import 'package:fitness_tracker/controller/weight_list_controller.dart';
import 'package:fitness_tracker/widget/weight_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeightListScreen extends StatelessWidget {
  const WeightListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetX<WeightListController>(
          init:  WeightListController(),
          builder: (WeightListController aControl) {
            return Expanded(
              child: ListView.builder(
                itemCount: aControl.weights.length,
                itemBuilder: (_, index) {
                  return WeightCard(
                    uid: UserController.instance.user.id,
                    weight: aControl.weights[index],
                  );
                },
              ),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
       /* ElevatedButton(
          onPressed: () {
            Get.bottomSheet(
              LoginScreen(),
              isScrollControlled: true,
              backgroundColor: ThemeData.dark().canvasColor,
            );
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(24),
          ),
          child: const Text("Egzersiz Ekle"),
        ),*/
      ],
    );
  }
}