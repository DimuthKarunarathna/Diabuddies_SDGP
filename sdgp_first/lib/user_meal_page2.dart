import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondMealPage extends StatefulWidget {
  const SecondMealPage({Key? key}) : super(key: key);

  @override
  State<SecondMealPage> createState() => _SecondMealPageState();
}

class _SecondMealPageState extends State<SecondMealPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Meal'),

      ),
    );
  }
}
