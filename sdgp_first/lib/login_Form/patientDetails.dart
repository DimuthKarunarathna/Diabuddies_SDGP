import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sdgp_first/login_Form/smokingHis.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../add_meal_page.dart';
import 'ageInput.dart';
import 'heightInput.dart';


class PatientDetailsForm extends StatefulWidget {
  @override
  _PatientDetailsFormState createState() => _PatientDetailsFormState();
}

class _PatientDetailsFormState extends State<PatientDetailsForm> {
  final _auth2=FirebaseAuth.instance;
  final firestore=FirebaseFirestore.instance;
  bool checkUserNotAvailable=true;

  Future<bool> doesNameAlreadyExist(String user) async {//checking whether if the user already added values
    final QuerySnapshot result = await FirebaseFirestore.instance// it perform operations on the documents returned by a query to a collection or sub collection.
        .collection('UserDetails')
        .where('user', isEqualTo: user)
        .limit(1)
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    return documents.length == 1;
  }

  Future<void> deleteUserFromDb(String user) async {
    CollectionReference collection=FirebaseFirestore.instance.collection("UserDetails");// accessing to the collection named UserDetails
    QuerySnapshot query=await collection.where('user', isEqualTo: user).get();//comparing with user name

    if(query.docs.isNotEmpty){
      DocumentReference docInstance=query.docs.first.reference; //getting the user's document
      await docInstance.delete();// simply deleting
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your details were deleted add new details")));
    }
  }

  void checkDbUser() async {
    print("chack a");
    if(await doesNameAlreadyExist(_auth2.currentUser?.email ?? "")){
      print("chack b");
      checkUserNotAvailable=false;
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You have already added values")));
      showDialog( //Error Validation
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('You have already added details'),
            content: Text(
                'Do you need to change details'),
            actions: [
              TextButton(
                onPressed: () {
                  deleteUserFromDb(_auth2.currentUser?.email ?? "");
                  checkUserNotAvailable=true;
                  Navigator.of(context).pop();
                },
                child: Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  checkUserNotAvailable=false;
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>FirstMealPage()));
                },
                child: Text('No'),
              ),
            ],
          );
        },
      );
    }
  }



  @override
  initState() {
   getCurrentUser();
   checkDbUser();
  }

  String _gender = 'female';
  String? _diabeticType;
  String? _activityLevel;
  String? _alcoholConsumption;
  int? _feet ;
  int? _inches;
  int? _age;
  int? _weight;
  int? _smoke;
  double? bmi;

  int _selectedIndex=0;

  void getCurrentUser() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {//we are using authStateChanges bcs FireBaseauth.instance.currentUser doesnt availabe for immediately when sign in with google
      //but FireBaseauth.instance.currentUser fine when sign in using email and password instead of google sign in
      if (user != null) {
        // In this code User is signed in, you can access the user object via `currentUser` or `user` parameter.
        final user=_auth2.currentUser;//it will null if anyone not signed in
        print(user!.email);
        print('User is signed in!');
      } else {
        // User is signed out.
        print('User is signed out!');
      }
    });
  }


  void _onBarItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });

    switch(index){
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (builder)=>FirstMealPage()));
        break;
    }
  }


  void _selectGender(String gender) {
    setState(() {
      _gender = gender;
    });
  }

  void _selectDiabeticType(String? diabeticType) {
    setState(() {
      _diabeticType = diabeticType;
    });
  }


  void _onHeightChanged(int feet, int inches) {
    if (feet <= 11 && inches <= 8) {
      setState(() {
        _feet = feet;
        _inches = inches;
      });
    } else {
      showDialog( //Error Validation
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid input'),
            content: Text(
                'The maximum number of feet is 11 and the maximum number of inches is 8.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _showBMIDialog(double bmi) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('BMI'),
          content: Text('Your BMI is ${bmi.toStringAsFixed(2)}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
  void _onSubmit() {
    if (_feet == null || _inches == null || _age == null || _weight == null || bmi == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Incomplete form'),
            content: Text('Please fill in all fields to calculate the BMI.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('BMI Calculation'),
            content: Text('Your BMI is: $bmi'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _onAgeChanged(int age, int weight) {
    if (age <= 100 && weight <= 100) {
      setState(() {
        _age = age;
        _weight = weight;
      });

      if (_age != null && _weight != null) { // check if both age and weight have been entered
        double heightInMeters = ((_feet ?? 0) * 12 + (_inches ?? 0)) * 0.0254;
        double weightInKg = (_weight ?? 0) * 0.453592;

        double bmi = weightInKg / (heightInMeters * heightInMeters);

        setState(() {
          this.bmi = bmi;
        });

      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid input'),
            content: Text(
                'The maximum age limit is 100, and the maximum weight is 100.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _onSubmits() {
    if (_feet == null || _inches == null || _age == null || _weight == null || bmi == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Incomplete form'),
            content: Text('Please fill in all fields to display details.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      if(checkUserNotAvailable){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Details saved successfully")));
        firestore.collection("UserDetails").add({
          'activity':_activityLevel,
          'age':_age,
          'alcohol':_alcoholConsumption,
          'bmi':bmi,
          'gender':_gender,
          'height':{
            'feet':_feet,
            'inches':_inches
          },
          'smoking':_smoke,
          'type':_diabeticType,
          'user':_auth2.currentUser?.email,
          'weight': _weight,

        });

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Details'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Gender: $_gender'),
                  Text('Diabetic Type: $_diabeticType'),
                  Text('Age: $_age'),
                  Text('Weight: $_weight'),
                  Text('Height: ${_feet ?? 0} feet ${_inches ?? 0} inches'),
                  Text('Smoking History: $_smoke'),
                  Text('Activity Level: $_activityLevel'),
                  Text('Alcohol Consumption: $_alcoholConsumption'),
                  Text('BMI: ${bmi?.toStringAsFixed(2)}'),
                  Text('User ${_auth2.currentUser?.email}')
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>FirstMealPage()));
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("you have already added the details")));
      }
    }
  }






  void _onSmokeChanged(int smoke) {
    if (smoke <= 100 ) {
      setState(() {
        _smoke = smoke;
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid input'),
            content: Text(
                'Please Enter Year Between 1-40 '),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Details Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Center(
            child: Text(
              'Gender',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => _selectGender('male'),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: _gender == 'male' ?  Colors.blue : Colors.blue.withOpacity(0.3),
                      child: Icon(Icons.male),
                    ),
                    SizedBox(height: 5),
                    Text('Male'),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => _selectGender('female'),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: _gender == 'female'
                          ? Colors.blue
                          : Colors.blue.withOpacity(0.3),
                      child: Icon(Icons.female),
                    ),
                    SizedBox(height: 5),
                    Text('Female'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Center(
            child: Text(
              'Diabetic Type',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: RadioListTile<String>(
                  title: Text('Type 1 Diabetic'),
                  value: 'type1',
                  groupValue: _diabeticType,
                  onChanged: _selectDiabeticType,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: RadioListTile<String>(
                  title: Text('Type 2 Diabetic'),
                  value: 'type2',
                  groupValue: _diabeticType,
                  onChanged: _selectDiabeticType,
                ),
              ),
            ],
          ),

          SizedBox(height: 25),
          Center(
            child: Text(
              'Height',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),

          SizedBox(height: 10),
          HeightInputWidget(onHeightChanged: _onHeightChanged),
          SizedBox(height: 25),
          Center(
            child: Text(
              'Age & Weight',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),

          SizedBox(height: 20),
            AgeInputWidget(
              onAgeChanged: (age, weight) => _onAgeChanged(age, weight),
            ),
          SizedBox(height: 25),


          Center(
            child: Text(
              'Smoking History',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(height: 20),
          SmokeInputWidget(onSmokeChanged:_onSmokeChanged),
          SizedBox(height: 25),




          Column(
            children: [
              Center(
                child: Text(
                  'Activity Level',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
          RadioListTile<String>(
            title: Text('Low level of activity'),
            value: 'low',
            groupValue: _activityLevel,
            onChanged: (value) {
              setState(() {
                _activityLevel = value;
              });
            },
          ),

          RadioListTile<String>(
            title: Text('Moderate level of activity'),
            value: 'moderate',
            groupValue: _activityLevel,
            onChanged: (value) {
              setState(() {
                _activityLevel = value;
              });
            },
          ),
          RadioListTile<String>(
            title: Text('High level of activity'),
            value: 'high',
            groupValue: _activityLevel,
            onChanged: (value) {
              setState(() {
                _activityLevel = value;
              });
            },
          ),
          SizedBox(height: 25),
          Column(
            children: [
              Center(
                child: Text(
                  'History of Alcohol Drinking',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: RadioListTile<String>(
                  title: Text('Drinker'),
                  value: 'Drinker',
                  groupValue: _alcoholConsumption,
                  onChanged: (value) {
                    setState(() {
                      _alcoholConsumption = value;
                    });
                  },
                ),
              ),
              Flexible(
                child: RadioListTile<String>(
                  title: Text('Non Drinker'),
                  value: 'Non Drinker',
                  groupValue: _alcoholConsumption,
                  onChanged: (value) {
                    setState(() {
                      _alcoholConsumption = value;
                    });
                  },
                ),
              ),
            ],
          ),



          Center(
            child:
              ElevatedButton(
                onPressed: _onSubmits,
                child: Text('Submit'),
              ),

            ),

        ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.lightBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'PatientInfo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onBarItemTapped,
      ),

    );
  }
}