import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:sdgp_first/user_meal_page.dart';

class LinearModel extends StatefulWidget {
  late final List<int> nutrientData;

  LinearModel({required this.nutrientData});

  @override
  _PredModelState createState() => _PredModelState(nutrientData: nutrientData);
}

class _PredModelState extends State<LinearModel> {
  late final List<int> nutrientData;
  _PredModelState({required this.nutrientData});

  var predValue = "";
  int totalCarbAmount = 0;
  int totalCalorieAmount = 0;
  int totalFatAmount = 0;
  int totalFiberAmount = 0;
  int totalProteinAmount = 0;
  int currentBGL = 0;

  @override
  void initState() {
    super.initState();
    predValue = "click predict button";
    predData();
  }

  Future<void> predData() async {
    final interpreter = await Interpreter.fromAsset('linear_model1.tflite');
    print("nutrient data list in screen 2 : $nutrientData");

    List<num> numList =
        nutrientData.map((int value) => value.toDouble()).toList();
    // var flatList = input.expand((e) => e).toList(); // Flatten nested list
    var floatList = Float32List.fromList(
        numList.map((e) => e.toDouble()).toList()); // Convert to Float32List

    var output = List.filled(1, 0).reshape([1, 1]);
    interpreter.run(floatList, output);
    print("new BGL : ${output[0][0]}");

    totalCarbAmount = nutrientData[0];
    totalCalorieAmount = nutrientData[1];
    totalFatAmount = nutrientData[2];
    totalFiberAmount = nutrientData[3];
    totalProteinAmount = nutrientData[4];
    currentBGL = nutrientData[6];

    setState(() {
      predValue = output[0][0].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            Text(
              "Carbs :  $totalCarbAmount ",
              style: const TextStyle(color: Colors.green, fontSize: 17),
            ),
            Text(
              "Calories :  $totalCalorieAmount ",
              style: const TextStyle(color: Colors.green, fontSize: 17),
            ),
            Text(
              "Fat :  $totalFatAmount ",
              style: const TextStyle(color: Colors.green, fontSize: 17),
            ),
            Text(
              "Fiber :  $totalFiberAmount ",
              style: const TextStyle(color: Colors.green, fontSize: 17),
            ),
            Text(
              "Protein :  $totalProteinAmount ",
              style: const TextStyle(color: Colors.green, fontSize: 17),
            ),
            Text(
              "Current BGL :  $currentBGL ",
              style: const TextStyle(color: Colors.red, fontSize: 23),
            ),
            Text(
              "Predicted BGL :  $predValue ",
              style: const TextStyle(color: Colors.red, fontSize: 23),
            ),
          ],
        ),
      ),
    );
  }
}
