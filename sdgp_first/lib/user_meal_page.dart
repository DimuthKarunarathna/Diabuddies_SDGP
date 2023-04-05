import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdgp_first/add_meal_page.dart';
import 'package:sdgp_first/linear_model.dart';
import 'package:sdgp_first/form_group/CustomFormField.dart';
import 'package:http/http.dart' as http;

class UserMeal extends StatefulWidget {
  const UserMeal({Key? key}) : super(key: key);
  @override
  State<UserMeal> createState() => _UserMealState();
}

class _UserMealState extends State<UserMeal> {
  int totalCarbAmount = 0;
  int totalCalorieAmount = 0;
  int totalFatAmount = 0;
  int totalFiberAmount = 0;
  int totalProteinAmount = 0;
  int currentBGL = 0;

  List<int> nutrientData = List.filled(7, 0); // 5 nutrition vals + current BGL

  TextEditingController gluLvl = TextEditingController();
  late String glucose;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<Widget> forms = [customFormField1()];
  int count = 1;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    gluLvl.dispose();
    disposeControllers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Meal Infromation",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Handle menu icon press
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                // Handle home icon press
              },
            ),
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
            gradient: LinearGradient(
               colors: [
                     Colors.blue,
                      Colors.blueGrey,
                    ],
                    ),
                  ),
         child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: forms.length,
                itemBuilder: (context, index) {
                  return forms[index];
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      count += 1;
                      if (count == 2) {
                        forms.add(customFormField2());
                        setState(() {});
                        print(meal2.text);
                      }
                      if (count == 3) {
                        forms.add(customFormField3());
                        setState(() {});
                        print(meal3.text);
                      }
                      if (count == 4) {
                        forms.add(customFormField4());
                        setState(() {});
                        print(meal4.text);
                      }
                      if (count == 5) {
                        forms.add(customFormField5());
                        setState(() {});
                        print(meal5.text);
                      }
                      if (count == 6) {
                        forms.add(customFormField6());
                        setState(() {});
                        print(meal6.text);
                      }
                      if (count == 7) {
                        forms.add(customFormField7());
                        setState(() {});
                        print(meal7.text);
                      }
                      if (count == 8) {
                        forms.add(customFormField8());
                        setState(() {});
                        print(meal8.text);
                      }
                    },
                    child: const Text("Add")),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (count != 1) {
                        count -= 1;
                        forms.removeAt(count);
                        setState(() {});
                      }
                    },
                    child: const Text("Delete")),
              ],
            ),
            Container(
              width: 350,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                      flex: 1,
                      child: Text(
                        "Blood Glucose Level :",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: 180,
                      height: 60,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: gluLvl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          // Add text to the label
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            // Add a border radius
                            borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1.0), // Add a border color and width
                          ),
                        ),
                        onChanged: (text) {
                          // Handle text input changes
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        onPressed: () {
                          callApi();
                        },
                        child: const Text("Submit")),
                  )
                ],
              ),
            ),
          ],
        )));
  }

  void callApi() async {
    totalCarbAmount = 0;
    totalCalorieAmount = 0;
    totalFatAmount = 0;
    totalFiberAmount = 0;
    totalProteinAmount = 0;
    currentBGL = int.parse(gluLvl.text);

    for (int i = 0; i < count; i++) {
      String mealName = mealControllers[i].text;
      String mealQuantity = weightControllers[i].text;
      String mealUnit = selectedUnitStrings[i];
      await getNutrition(mealName, mealQuantity, mealUnit);
    }

    print("nutrient data list in screen 1 : $nutrientData");

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => LinearModel(nutrientData: nutrientData)));
  }

  Future<void> getNutrition(
      String foodName, String quantity, String unit) async {
    final url =
        Uri.parse('https://trackapi.nutritionix.com/v2/natural/nutrients');
    final headers = {
      'Content-Type': 'application/json',
      'x-app-id': 'e85e39d9',
      'x-app-key': 'cdbb636da69a0dc889cb6a27b8264b38',
    };
    final query = jsonEncode({'query': ' $foodName $quantity $unit'});
    final response = await http.post(url, headers: headers, body: query);
    final responseData = jsonDecode(response.body);

    totalCarbAmount =
        responseData['foods'][0]['nf_total_carbohydrate'].toInt() +
            totalCarbAmount;
    totalCalorieAmount =
        responseData['foods'][0]['nf_calories'].toInt() + totalCalorieAmount;
    totalFatAmount =
        responseData['foods'][0]['nf_total_fat'].toInt() + totalFatAmount;
    totalFiberAmount =
        responseData['foods'][0]['nf_dietary_fiber'].toInt() + totalFiberAmount;
    totalProteinAmount =
        responseData['foods'][0]['nf_protein'].toInt() + totalProteinAmount;

    nutrientData = [
      totalCarbAmount,
      totalCalorieAmount,
      totalFiberAmount,
      totalFatAmount,
      totalProteinAmount,
      45,
      currentBGL,
    ];

    print(
        "total carbs : $totalCarbAmount \n total Cals : $totalCalorieAmount \n total fat : $totalFatAmount");
  }
}
