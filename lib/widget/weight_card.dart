import 'package:fitness_tracker/model/weight_model.dart';
import 'package:fitness_tracker/service/database.dart';
import 'package:flutter/material.dart';

class WeightCard extends StatelessWidget {
  final String? uid;
  final WeightModel? weight;
  const WeightCard({Key? key, this.weight, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                (weight!.exerciseName!),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                '${weight!.exerciseWeight.toString()} kg',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
           IconButton(
              icon: const Icon(
                  Icons.add,
              size: 30,
              ),
              onPressed: (){
                Database.instance.addWeight(uid!, weight!);
              },
              iconSize: 20,
            ),
            IconButton(
              icon: const Icon(
                  Icons.remove,
              size: 30,
              ),
              onPressed: (){
                Database.instance.removeWeight(uid!, weight!);
              },
              iconSize: 20,
            ),
          ],
        ),
      ),
    );
  }
}
