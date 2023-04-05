import 'package:flutter/material.dart';

TextEditingController meal1 = TextEditingController();
TextEditingController weight1 = TextEditingController();
TextEditingController meal2 = TextEditingController();
TextEditingController weight2 = TextEditingController();
TextEditingController meal3 = TextEditingController();
TextEditingController weight3 = TextEditingController();
TextEditingController meal4 = TextEditingController();
TextEditingController weight4 = TextEditingController();
TextEditingController meal5 = TextEditingController();
TextEditingController weight5 = TextEditingController();
TextEditingController meal6 = TextEditingController();
TextEditingController weight6 = TextEditingController();
TextEditingController meal7 = TextEditingController();
TextEditingController weight7 = TextEditingController();
TextEditingController meal8 = TextEditingController();
TextEditingController weight8 = TextEditingController();

List<TextEditingController> mealControllers = [
  meal1,
  meal2,
  meal3,
  meal4,
  meal5,
  meal6,
  meal7,
  meal8,
];

List<TextEditingController> weightControllers = [
  weight1,
  weight2,
  weight3,
  weight4,
  weight5,
  weight6,
  weight7,
  weight8,
];

TextEditingController unit_1 = TextEditingController();

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

List<String> _mealUnits = ['g', 'ml'];
String selectedMealUnits_1 = 'g';
String selectedMealUnits_2 = 'g';
String selectedMealUnits_3 = 'g';
String selectedMealUnits_4 = 'g';
String selectedMealUnits_5 = 'g';
String selectedMealUnits_6 = 'g';
String selectedMealUnits_7 = 'g';
String selectedMealUnits_8 = 'g';

List<String> selectedUnitStrings = [
  selectedMealUnits_1,
  selectedMealUnits_2,
  selectedMealUnits_3,
  selectedMealUnits_4,
  selectedMealUnits_5,
  selectedMealUnits_6,
  selectedMealUnits_7,
  selectedMealUnits_8,
];

void disposeControllers() {
  meal1.clear();
  meal2.clear();
  meal3.clear();
  meal4.clear();
  meal5.clear();
  meal6.clear();
  meal7.clear();
  meal8.clear();

  weight1.clear();
  weight2.clear();
  weight3.clear();
  weight4.clear();
  weight5.clear();
  weight6.clear();
  weight7.clear();
  weight8.clear();
}

Container customFormField1() {
  return Container(
    height: 90,
    child: Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Meal',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                width: 280,
                height: 60,
                margin: const EdgeInsets.all(2),
                // padding: const EdgeInsets.all(6),
                child: TextField(
                  controller: meal1,
                  decoration: InputDecoration(
                    // Add text to the label
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Add a border radius
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
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Weight',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                width: 80,
                height: 60,
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.only(left: 2),
                child: TextField(
                  controller: weight1,
                  decoration: InputDecoration(
                    // Add text to the label
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Add a border radius
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
            ],
          ),
        ),
        Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Unit ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 80,
                  child: DropdownButtonFormField<String>(
                    value: selectedMealUnits_1,
                    items: _mealUnits.map((String mealType) {
                      return DropdownMenuItem<String>(
                        value: mealType,
                        child: Text(mealType),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      selectedMealUnits_1 = value!;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      //labelText: 'Select a meal unit',
                    ),
                  ),
                ),
              ],
            ))
      ],
    ),
  );
}

Container customFormField2() {
  return Container(
    height: 90,
    child: Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //const Text('Meal',
              //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Container(
                width: 280,
                height: 60,
                margin: const EdgeInsets.all(2),
                // padding: const EdgeInsets.all(6),
                child: TextField(
                  controller: meal2,
                  decoration: InputDecoration(
                    // Add text to the label
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Add a border radius
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
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //const Text('Weight',
              //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Container(
                width: 80,
                height: 60,
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.only(left: 2),
                child: TextField(
                  controller: weight2,
                  decoration: InputDecoration(
                    // Add text to the label
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Add a border radius
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
            ],
          ),
        ),
        Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //const Text('Unit ',
                //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                //),
                SizedBox(
                  width: 80,
                  child: DropdownButtonFormField<String>(
                    value: selectedMealUnits_2,
                    items: _mealUnits.map((String mealType) {
                      return DropdownMenuItem<String>(
                        value: mealType,
                        child: Text(mealType),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      selectedMealUnits_2 = value!;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      //labelText: 'Select a meal unit',
                    ),
                  ),
                ),
              ],
            ))
      ],
    ),
  );
}

Container customFormField3() {
  return Container(
    height: 90,
    child: Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Text('Meal',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Container(
                width: 280,
                height: 60,
                margin: const EdgeInsets.all(2),
                // padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: meal3,
                  decoration: InputDecoration(
                    // Add text to the label
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Add a border radius
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
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Text('Weight',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Container(
                width: 80,
                height: 60,
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.only(left: 2),
                child: TextField(
                  controller: weight3,
                  decoration: InputDecoration(
                    // Add text to the label
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Add a border radius
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
            ],
          ),
        ),
        Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Text('Unit ',
                //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                // ),
                SizedBox(
                  width: 80,
                  child: DropdownButtonFormField<String>(
                    value: selectedMealUnits_3,
                    items: _mealUnits.map((String mealType) {
                      return DropdownMenuItem<String>(
                        value: mealType,
                        child: Text(mealType),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      selectedMealUnits_3 = value!;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      //labelText: 'Select a meal unit',
                    ),
                  ),
                ),
              ],
            ))
      ],
    ),
  );
}

Container customFormField4() {
  return Container(
    height: 90,
    child: Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Text('Meal',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Container(
                width: 280,
                height: 60,
                margin: const EdgeInsets.all(2),
                // padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: meal4,
                  decoration: InputDecoration(
                    // Add text to the label
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Add a border radius
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
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Text('Weight',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Container(
                width: 80,
                height: 60,
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.only(left: 2),
                child: TextField(
                  controller: weight4,
                  decoration: InputDecoration(
                    // Add text to the label
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Add a border radius
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
            ],
          ),
        ),
        Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Text('Unit ',
                //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                // ),
                SizedBox(
                  width: 80,
                  child: DropdownButtonFormField<String>(
                    value: selectedMealUnits_4,
                    items: _mealUnits.map((String mealType) {
                      return DropdownMenuItem<String>(
                        value: mealType,
                        child: Text(mealType),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      selectedMealUnits_4 = value!;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      //labelText: 'Select a meal unit',
                    ),
                  ),
                ),
              ],
            ))
      ],
    ),
  );
}

Container customFormField5() {
  return Container(
    height: 90,
    child: Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Text('Meal',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Container(
                width: 280,
                height: 60,
                margin: const EdgeInsets.all(2),
                // padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: meal5,
                  decoration: InputDecoration(
                    // Add text to the label
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Add a border radius
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
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Text('Weight',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Container(
                width: 80,
                height: 60,
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.only(left: 2),
                child: TextField(
                  controller: weight5,
                  decoration: InputDecoration(
                    // Add text to the label
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Add a border radius
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
            ],
          ),
        ),
        Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Text('Unit ',
                //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                // ),
                SizedBox(
                  width: 80,
                  child: DropdownButtonFormField<String>(
                    value: selectedMealUnits_5,
                    items: _mealUnits.map((String mealType) {
                      return DropdownMenuItem<String>(
                        value: mealType,
                        child: Text(mealType),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      selectedMealUnits_5 = value!;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      //labelText: 'Select a meal unit',
                    ),
                  ),
                ),
              ],
            ))
      ],
    ),
  );
}

Container customFormField6() {
  return Container(
    height: 90,
    child: Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Text('Meal',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Container(
                width: 280,
                height: 60,
                margin: const EdgeInsets.all(2),
                // padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: meal6,
                  decoration: InputDecoration(
                    // Add text to the label
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Add a border radius
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
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Text('Weight',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Container(
                width: 80,
                height: 60,
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.only(left: 2),
                child: TextField(
                  controller: weight6,
                  decoration: InputDecoration(
                    // Add text to the label
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Add a border radius
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
            ],
          ),
        ),
        Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Text('Unit ',
                //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                // ),
                SizedBox(
                  width: 80,
                  child: DropdownButtonFormField<String>(
                    value: selectedMealUnits_6,
                    items: _mealUnits.map((String mealType) {
                      return DropdownMenuItem<String>(
                        value: mealType,
                        child: Text(mealType),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      selectedMealUnits_6 = value!;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      //labelText: 'Select a meal unit',
                    ),
                  ),
                ),
              ],
            ))
      ],
    ),
  );
}

Container customFormField7() {
  return Container(
    height: 90,
    child: Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Text('Meal',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Container(
                width: 280,
                height: 60,
                margin: const EdgeInsets.all(2),
                // padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: meal7,
                  decoration: InputDecoration(
                    // Add text to the label
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Add a border radius
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
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Text('Weight',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Container(
                width: 80,
                height: 60,
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.only(left: 2),
                child: TextField(
                  controller: weight7,
                  decoration: InputDecoration(
                    // Add text to the label
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Add a border radius
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
            ],
          ),
        ),
        Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Text('Unit ',
                //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                // ),
                SizedBox(
                  width: 80,
                  child: DropdownButtonFormField<String>(
                    value: selectedMealUnits_7,
                    items: _mealUnits.map((String mealType) {
                      return DropdownMenuItem<String>(
                        value: mealType,
                        child: Text(mealType),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      selectedMealUnits_7 = value!;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      //labelText: 'Select a meal unit',
                    ),
                  ),
                ),
              ],
            ))
      ],
    ),
  );
}

Container customFormField8() {
  return Container(
    height: 90,
    child: Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Text('Meal',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Container(
                width: 280,
                height: 60,
                margin: const EdgeInsets.all(2),
                // padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: meal8,
                  decoration: InputDecoration(
                    // Add text to the label
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Add a border radius
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
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Text('Weight',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Container(
                width: 80,
                height: 60,
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.only(left: 2),
                child: TextField(
                  controller: weight8,
                  decoration: InputDecoration(
                    // Add text to the label
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Add a border radius
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
            ],
          ),
        ),
        Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Text('Unit ',
                //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                // ),
                SizedBox(
                  width: 80,
                  child: DropdownButtonFormField<String>(
                    value: selectedMealUnits_8,
                    items: _mealUnits.map((String mealType) {
                      return DropdownMenuItem<String>(
                        value: mealType,
                        child: Text(mealType),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      selectedMealUnits_8 = value!;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      //labelText: 'Select a meal unit',
                    ),
                  ),
                ),
              ],
            ))
      ],
    ),
  );
}
