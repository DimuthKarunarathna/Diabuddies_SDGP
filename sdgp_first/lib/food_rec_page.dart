import 'package:flutter/material.dart';
import 'package:sdgp_first/rec_Tables/rec_fruits_page.dart';
import 'package:sdgp_first/rec_Tables/rec_leafy_page.dart';

import 'add_meal_page.dart';
import 'rec_Tables/rec_grains_page.dart';
import 'rec_Tables/rec_proteins_page.dart';
import 'rec_Tables/rec_spices_page.dart';
import 'rec_Tables/rec_vegetables_page.dart';

class FoodRecPage extends StatefulWidget {
  const FoodRecPage({Key? key}) : super(key: key);

  @override
  State<FoodRecPage> createState() => _FoodRecPageState();
}

class _FoodRecPageState extends State<FoodRecPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Recommended Foods',
          ),
        ),
        body: Center(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 30, // Position from top of the screen
                left: 20, // Position from left of the screen
                child: Image.asset(
                  'img/leafy_1.jpg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),

              Positioned(
                top: 50,
                left: 20,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>const RecLeafyPage()));
                  },
                  child: const Text('Leafy'),
                ),
              ),

              Positioned(
                top: 30,
                right: 20,
                child: Image.asset(
                  'img/spices_1.jpg',
                  width: 160,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                top: 50,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>const RecSpicesPage()));
                  },
                  child: const Text('Spices'),
                ),
              ),
              Positioned(
                top: 220, // Position from top of the screen
                left: 20, // Position from left of the screen
                child: Image.asset(
                  'img/fruits_1.jpg',
                  width: 180,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                top: 240,
                left: 20,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>const RecFruitPage()));
                  },
                  child: const Text('Fruits'),
                ),
              ),
              Positioned(
                top: 220, // Position from top of the screen
                right: 20, // Position from left of the screen
                child: Image.asset(
                  'img/veg_1.jpg',
                  width: 180,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                top: 240,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>const vegetables()));
                  },
                  child: const Text('Vegetables'),
                ),
              ),
              Positioned(
                top: 420, // Position from top of the screen
                left: 20, // Position from left of the screen
                child: Image.asset(
                  'img/grains_1.jpg',
                  width: 220,
                  height: 230,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                top: 440,
                left: 20,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>const grains()));
                  },
                  child: const Text('Grains'),
                ),
              ),
              Positioned(
                top: 420, // Position from top of the screen
                right: 20, // Position from left of the screen
                child:Image.asset(
                  'img/protein_1.jpg',
                  width: 200,
                  height: 220,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                top: 440,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>const proteins()));
                  },
                  child: const Text('Proteins'),
                ),
              ),





              Positioned(
                top: 620,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, MaterialPageRoute(builder: (builder)=>const FirstMealPage()));
                  },
                  child: const Text('Back'),
                ),
              ),


              // Add other widgets as needed
            ],
          ),
        ),
      ),
    );
  }
}