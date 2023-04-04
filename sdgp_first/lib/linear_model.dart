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
  @override
  void initState() {
    super.initState();
    predValue = "click predict button";
  }

  Future<void> predData() async {
    final interpreter = await Interpreter.fromAsset('linear_model1.tflite');
    var input = [
      [66.83, 19.80, 0.81, 1.00, 2.66, 77, 118.8]
    ];

    print("nutrient data list in screen 2 : $nutrientData");

    List<num> numList =
        nutrientData.map((int value) => value.toDouble()).toList();
    // var flatList = input.expand((e) => e).toList(); // Flatten nested list
    var floatList = Float32List.fromList(
        numList.map((e) => e.toDouble()).toList()); // Convert to Float32List

    var output = List.filled(1, 0).reshape([1, 1]);
    interpreter.run(floatList, output);
    print("new BGL : ${output[0][0]}");

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
            MaterialButton(
              color: Colors.blue,
              onPressed: predData,
              child: const Text(
                "predict",
                style: TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Predicted value :  $predValue ",
              style: const TextStyle(color: Colors.red, fontSize: 23),
            ),
          ],
        ),
      ),
    );
  }
}
