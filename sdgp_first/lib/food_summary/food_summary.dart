import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'food_card.dart';
import 'food_entity.dart';

class FoodSummary extends StatefulWidget {
  const FoodSummary({Key? key}) : super(key: key);

  @override
  State<FoodSummary> createState() => _FoodSummaryState();
}

class _FoodSummaryState extends State<FoodSummary> {
  final firestore = FirebaseFirestore.instance;
  final _auth2 = FirebaseAuth.instance;
  List<FoodEntity> entities = [];

  Future<void> getFoodHistory() async {
    final QuerySnapshot result = await FirebaseFirestore
        .instance // it perform operations on the documents returned by a query to a collection or sub collection.
        .collection('FoodSummary')
        .where('user', isEqualTo: _auth2.currentUser?.email)
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${documents.length}")));
    // for(int i=0;i<documents.length;i++){
    //
    // }
    documents.forEach((document) {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("working1")));
      Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;
      if (data != null) {
        String date = data['date'];
        String time = data['time'];
        double carbs = data['carbs'].toDouble();
        double protein = data['protein'].toDouble();
        double fats = data['fats'].toDouble();
        double fiber = data['fiber'].toDouble();
        double bebgl = data['bebgl'].toDouble();
        double afbgl =
            double.parse(data['afbgl'].toDouble().toStringAsFixed(2));
        double calories = data['calories'].toDouble();

        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("working2")));
        entities.add(FoodEntity(
            time: time,
            date: date,
            carbs: carbs,
            protein: protein,
            fiber: fiber,
            fats: fats,
            calories: calories,
            bglBefore: bebgl,
            bglAfter: afbgl));
        setState(() {});
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("working3")));
      }

      // Do something with the field value
    });
  }

  void addFoods() {
    firestore.collection("FoodSummary").add({
      'afbgl': 100.8,
      'bebgl': 90.7,
      'carbs': 10.9,
      'protein': 15.7,
      'fats': 40,
      'calories': 20,
      'fiber': 80,
      'date': "2023-08-09",
      'time': "01:08",
      'user': "kavee@gmail.com"
    });
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

  @override
  void initState() {
    // addFoods();
    getFoodHistory();
  }
  // List<FoodEntity> _entities=[
  // FoodEntity(time:"12:00",date: "2023-04-04", carbs: 50.20, protein: 60.20, fiber: 20.70, fats: 10.5, calories:80, bglBefore: 90, bglAfter: 100),
  // FoodEntity(time:"12:00",date: "2023-04-04", carbs: 50.70, protein: 60.20, fiber: 20.70, fats: 10.5, calories:80, bglBefore: 90, bglAfter: 100),
  // FoodEntity(time:"12:00",date: "2023-04-04", carbs: 90.20, protein: 60.20, fiber: 20.70, fats: 10.5, calories:80, bglBefore: 90, bglAfter: 100),
  // FoodEntity(time:"12:00",date: "2023-04-04", carbs: 30.20, protein: 60.20, fiber: 20.70, fats: 10.5, calories:80, bglBefore: 90, bglAfter: 100),
  // FoodEntity(time:"12:00",date: "2023-04-04", carbs: 110.20, protein: 60.20, fiber: 20.70, fats: 10.5,calories: 80, bglBefore: 90, bglAfter: 100),
  //   FoodEntity(time:"12:00",date: "2023-04-04", carbs: 90.20, protein: 60.20, fiber: 20.70, fats: 10.5, calories:80, bglBefore: 90, bglAfter: 100),
  //   FoodEntity(time:"12:00",date: "2023-04-04", carbs: 30.20, protein: 60.20, fiber: 20.70, fats: 10.5, calories:80, bglBefore: 90, bglAfter: 100),
  //   FoodEntity(time:"12:00",date: "2023-04-04", carbs: 110.20, protein: 60.20, fiber: 20.70, fats: 10.5,calories: 80, bglBefore: 90, bglAfter: 100),
  //
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Food Details"),

      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 185, 243, 252),
                Color.fromARGB(255, 5, 14, 73)
              ]),
        ),
        child: ListView.builder(
          itemCount: entities.length,
          itemBuilder: (context, index) {
            return FoodCard(entity: entities[index]);
          },
        ),
      ),
    );
  }
}
