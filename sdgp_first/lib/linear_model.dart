import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:sdgp_first/user_meal_page.dart';
import 'package:intl/intl.dart';

class LinearModel extends StatefulWidget {
  late final List<int> nutrientData;

  LinearModel({required this.nutrientData});

  @override
  _PredModelState createState() => _PredModelState(nutrientData: nutrientData);
}

class _PredModelState extends State<LinearModel> {
  final firestore = FirebaseFirestore.instance;
  final _auth2 = FirebaseAuth.instance;
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

  void getCurrentUser() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      //we are using authStateChanges bcs FireBaseauth.instance.currentUser doesnt availabe for immediately when sign in with google
      //but FireBaseauth.instance.currentUser fine when sign in using email and password instead of google sign in
      if (user != null) {
        // In this code User is signed in, you can access the user object via `currentUser` or `user` parameter.
        final user = _auth2.currentUser; //it will null if anyone not signed in
        print(user!.email);
        print('User is signed in!');
      } else {
        // User is signed out.
        print('User is signed out!');
      }
    });
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
    predValue = output[0][0].toStringAsFixed(2);

    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    String currentTime = DateFormat('HH:mm:ss').format(DateTime.now());

    firestore.collection("FoodSummary").add({
      'afbgl': double.parse(predValue),
      'bebgl': currentBGL,
      'carbs': totalCarbAmount,
      'protein': totalProteinAmount,
      'fats': totalFatAmount,
      'calories': totalCalorieAmount,
      'fiber': totalFiberAmount,
      'date': currentDate,
      'time': currentTime,
      'user': _auth2.currentUser?.email
    });

    setState(() {
      predValue = output[0][0].toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6fb7e0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Result",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 185, 243, 252),
                Color.fromARGB(255, 24, 78, 131)
              ]
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 360,
                height: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Table(
                    children: [
                      _buildTableRow(
                        "Carbohydrate",
                        "${totalCalorieAmount.toDouble()} g",
                      ),
                      _buildTableRow(
                        "Calories",
                        "${totalCalorieAmount.toDouble()} g",
                      ),
                      _buildTableRow(
                        "Fat",
                        "${totalFatAmount.toDouble()} g",
                      ),
                      _buildTableRow(
                        "Fiber",
                        "${totalFiberAmount.toDouble()} g",
                      ),
                      _buildTableRow(
                        "Protein",
                        "${totalProteinAmount.toDouble()} g",
                      ),
                      _buildTableRow(
                          "Current BGL", "${currentBGL.toDouble()} mg/dL",
                          color: Colors.red, fontSize: 23),
                      _buildTableRow("Predicted BGL",
                          "${double.parse(predValue).toStringAsFixed(2)} mg/dL",
                          color: Colors.red, fontSize: 23),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildTableRow(String label, String value,
      {Color color = Colors.green, double fontSize = 20}) {
    return TableRow(
      children: [
        Container(
          width: 130,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(1),
            border: Border.all(color: Colors.black),
          ),
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: Text(
              label,
              style: TextStyle(fontSize: fontSize, color: color),
            ),
          ),
        ),
        Container(
          width: 130,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(1),
            border: Border.all(color: Colors.black),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              value,
              style: TextStyle(fontSize: fontSize, color: color),
            ),
          ),
        ),
      ],
    );
  }
}
