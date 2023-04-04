import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdgp_first/add_meal_page.dart';
import 'package:sdgp_first/linear_model.dart';
import 'package:sdgp_first/form_group/CustomFormField.dart';

//ML model imports
// import 'package:tflite/tflite.dart';

class UserMeal extends StatefulWidget {
  const UserMeal({Key? key}) : super(key: key);

  @override
  State<UserMeal> createState() => _UserMealState();
}

class _UserMealState extends State<UserMeal> {
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
        appBar: AppBar(
          title: const Text('Meal Information'),
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
        body: Column(
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
                          if (count == 1) {
                            print(meal1.text +
                                " " +
                                weight1.text +
                                " " +
                                selectedMealUnits_1.characters.toString());
                          }
                          if (count == 2) {
                            print(meal1.text +
                                " " +
                                weight1.text +
                                " " +
                                selectedMealUnits_1.characters.toString());
                            print(meal2.text +
                                " " +
                                weight2.text +
                                " " +
                                selectedMealUnits_2.characters.toString());
                          }
                          if (count == 3) {
                            print(meal1.text +
                                " " +
                                weight1.text +
                                " " +
                                selectedMealUnits_1.characters.toString());
                            print(meal2.text +
                                " " +
                                weight2.text +
                                " " +
                                selectedMealUnits_2.characters.toString());
                            print(meal3.text +
                                " " +
                                weight3.text +
                                " " +
                                selectedMealUnits_3.characters.toString());
                          }
                          if (count == 4) {
                            print(meal1.text +
                                " " +
                                weight1.text +
                                " " +
                                selectedMealUnits_1.characters.toString());
                            print(meal2.text +
                                " " +
                                weight2.text +
                                " " +
                                selectedMealUnits_2.characters.toString());
                            print(meal3.text +
                                " " +
                                weight3.text +
                                " " +
                                selectedMealUnits_3.characters.toString());
                            print(meal4.text +
                                " " +
                                weight4.text +
                                " " +
                                selectedMealUnits_4.characters.toString());
                          }
                          if (count == 5) {
                            print(meal1.text +
                                " " +
                                weight1.text +
                                " " +
                                selectedMealUnits_1.characters.toString());
                            print(meal2.text +
                                " " +
                                weight2.text +
                                " " +
                                selectedMealUnits_2.characters.toString());
                            print(meal3.text +
                                " " +
                                weight3.text +
                                " " +
                                selectedMealUnits_3.characters.toString());
                            print(meal4.text +
                                " " +
                                weight4.text +
                                " " +
                                selectedMealUnits_4.characters.toString());
                            print(meal5.text +
                                " " +
                                weight5.text +
                                " " +
                                selectedMealUnits_5.characters.toString());
                          }
                          if (count == 6) {
                            print(meal1.text +
                                " " +
                                weight1.text +
                                " " +
                                selectedMealUnits_1.characters.toString());
                            print(meal2.text +
                                " " +
                                weight2.text +
                                " " +
                                selectedMealUnits_2.characters.toString());
                            print(meal3.text +
                                " " +
                                weight3.text +
                                " " +
                                selectedMealUnits_3.characters.toString());
                            print(meal4.text +
                                " " +
                                weight4.text +
                                " " +
                                selectedMealUnits_4.characters.toString());
                            print(meal5.text +
                                " " +
                                weight5.text +
                                " " +
                                selectedMealUnits_5.characters.toString());
                            print(meal6.text +
                                " " +
                                weight6.text +
                                " " +
                                selectedMealUnits_6.characters.toString());
                          }
                          if (count == 7) {
                            print(meal1.text +
                                " " +
                                weight1.text +
                                " " +
                                selectedMealUnits_1.characters.toString());
                            print(meal2.text +
                                " " +
                                weight2.text +
                                " " +
                                selectedMealUnits_2.characters.toString());
                            print(meal3.text +
                                " " +
                                weight3.text +
                                " " +
                                selectedMealUnits_3.characters.toString());
                            print(meal4.text +
                                " " +
                                weight4.text +
                                " " +
                                selectedMealUnits_4.characters.toString());
                            print(meal5.text +
                                " " +
                                weight5.text +
                                " " +
                                selectedMealUnits_5.characters.toString());
                            print(meal6.text +
                                " " +
                                weight6.text +
                                " " +
                                selectedMealUnits_6.characters.toString());
                            print(meal7.text +
                                " " +
                                weight7.text +
                                " " +
                                selectedMealUnits_7.characters.toString());
                          }
                          if (count == 8) {
                            print(meal1.text +
                                " " +
                                weight1.text +
                                " " +
                                selectedMealUnits_1.characters.toString());
                            print(meal2.text +
                                " " +
                                weight2.text +
                                " " +
                                selectedMealUnits_2.characters.toString());
                            print(meal3.text +
                                " " +
                                weight3.text +
                                " " +
                                selectedMealUnits_3.characters.toString());
                            print(meal4.text +
                                " " +
                                weight4.text +
                                " " +
                                selectedMealUnits_4.characters.toString());
                            print(meal5.text +
                                " " +
                                weight5.text +
                                " " +
                                selectedMealUnits_5.characters.toString());
                            print(meal6.text +
                                " " +
                                weight6.text +
                                " " +
                                selectedMealUnits_6.characters.toString());
                            print(meal7.text +
                                " " +
                                weight7.text +
                                " " +
                                selectedMealUnits_7.characters.toString());
                            print(meal8.text +
                                " " +
                                weight8.text +
                                " " +
                                selectedMealUnits_8.characters.toString());
                          }
                          print(gluLvl.text + " is Blood Glucose Level");

                          Navigator.of(context)
                              .pop(MaterialPageRoute(builder: (context) {
                            return FirstMealPage();
                          }));
                        },
                        child: const Text("Submit")),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
