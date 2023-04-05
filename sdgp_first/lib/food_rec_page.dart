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
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color(0xFF6fb7e0),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              "Recommended Food",
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
                colors: [
                  Colors.blue,
                  Colors.blueGrey,
                ],
              ),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 30, // Position from top of the screen
                  left: 20, // Position from left of the screen
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Image.asset(
                      'img/leafy_1.jpg',
                      width: 160,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  top: 10,
                  left: 20,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (builder) => const RecLeafyPage()));
                    },
                    child: const Text('Leafy'),
                  ),
                ),

                Positioned(
                  top: 30,
                  right: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Image.asset(
                      'img/spices_1.jpg',
                      width: 160,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 20,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (builder) => const RecSpicesPage()));
                    },
                    child: const Text('Spices'),
                  ),
                ),
                Positioned(
                  top: 220, // Position from top of the screen
                  left: 20, // Position from left of the screen
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Image.asset(
                      'img/fruits_1.jpg',
                      width: 160,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 20,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (builder) => const RecFruitPage()));
                    },
                    child: const Text('Fruits'),
                  ),
                ),
                Positioned(
                  top: 220, // Position from top of the screen
                  right: 20, // Position from left of the screen
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Image.asset(
                      'img/veg_1.jpg',
                      width: 160,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  right: 20,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (builder) => const vegetables()));
                    },
                    child: const Text('Vegetables'),
                  ),
                ),
                Positioned(
                  top: 420, // Position from top of the screen
                  left: 20, // Position from left of the screen
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Image.asset(
                      'img/grains_1.jpg',
                      width: 160,
                      height: 160,
                      fit:
                      BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 400,
                  left: 20,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (builder) => const grains()),
                      );
                    },
                    child: const Text('Grains'),
                  ),
                ),
                Positioned(
                  top: 420, // Position from top of the screen
                  right: 20, // Position from left of the screen
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Image.asset(
                      'img/protein_1.jpg',
                      width: 160,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 400,
                  right: 20,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (builder) => const proteins()),
                      );
                    },
                    child: const Text('Proteins'),
                  ),
                ), Positioned(
                  bottom: 20,
                  left: 20,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Back'),
                  ),
                ),

                // Add other widgets as needed
              ],
            ),
          ),
        ));
  }


}