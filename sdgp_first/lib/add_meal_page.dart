import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sdgp_first/food_summary/food_card.dart';
import 'package:sdgp_first/food_summary/food_entity.dart';
import 'package:sdgp_first/food_summary/food_summary.dart';
import 'package:sdgp_first/image_page.dart';
import 'package:sdgp_first/login_Form/patientDetails.dart';
import 'package:sdgp_first/login_page.dart';
import 'package:sdgp_first/user_meal_page.dart';
import 'package:sdgp_first/food_rec_page.dart';

class FirstMealPage extends StatefulWidget {
  const FirstMealPage({Key? key}) : super(key: key);

  @override
  State<FirstMealPage> createState() => _FirstMealPageState();
}

class _FirstMealPageState extends State<FirstMealPage> {
  final _auth2=FirebaseAuth.instance;
  int _selectedIndex=0;

  get image => null;

  void _onBarItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });

    switch(index){
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (builder)=>PatientDetailsForm()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (builder)=>const FoodSummary()));
        break;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
  }
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
    // if(user!=null){
    //   print(user.email);
    // }else{
    //   print("there is no email");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Diabuddies'),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Handle menu icon press
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                _auth2.signOut();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
              },
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "img/dia_pic.jpg"


                      ),
                      fit: BoxFit.cover// otherwise yhere is a space in corners

                  )
              ),
              width: 300,
              height: 700,
              child: Column(
                children: [
                  Image.asset(
                    'img/img1.jpg',
                    width: 300,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(207, 0, 26, 95),width: 4),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: SizedBox(
                      height: 75,
                      width: 300,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=>const ImageChoosePage()));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          foregroundColor: MaterialStateProperty.all(Colors.lightBlue),
                        ),
                        icon: const IconTheme(
                          data: IconThemeData(size: 60,color: Colors.lightBlue),
                          child: Icon(Icons.camera_alt_outlined),

                        ), // Use a network image instead of a local asset
                        label: const Text(
                          'Add Meal Image',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromARGB(207, 0, 26, 95),width: 4),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: SizedBox(
                      //g
                      height: 75,
                      width: 300,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=>const UserMeal()));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          foregroundColor: MaterialStateProperty.all(Colors.lightBlue),
                        ),
                        icon: const IconTheme(
                          data: IconThemeData(size: 60,color: Colors.lightBlue),
                          child: Icon(Icons.fastfood_rounded),

                        ), // Use a network image instead of a local asset
                        label: const Text(
                          'Add Meal Details',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromARGB(207, 0, 26, 95),width: 4),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: SizedBox(
                      //g
                      height: 75,
                      width: 300,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=>const FoodRecPage()));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          foregroundColor: MaterialStateProperty.all(Colors.lightBlue),
                        ),
                        icon: const IconTheme(
                          data: IconThemeData(size: 60,color: Colors.lightBlue),
                          child: Icon(Icons.fastfood_outlined),

                        ), // Use a network image instead of a local asset
                        label: const Text(
                          'Recommended Foods',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromARGB(207, 0, 26, 95),width: 4),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: SizedBox(
                      height: 75,
                      width: 300,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=>PatientDetailsForm()));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          foregroundColor: MaterialStateProperty.all(Colors.lightBlue),
                        ),
                        icon: const IconTheme(
                          data: IconThemeData(size: 60,color: Colors.lightBlue),
                          child: Icon(Icons.person),

                        ), // Use a network image instead of a local asset
                        label: const Text(
                          'Patient Details',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromARGB(207, 0, 26, 95),width: 4),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: SizedBox(
                      height: 75,
                      width: 300,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=>const FoodSummary()));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          foregroundColor: MaterialStateProperty.all(Colors.lightBlue),
                        ),
                        icon: const IconTheme(
                          data: IconThemeData(size: 60,color: Colors.lightBlue),
                          child: Icon(Icons.receipt_rounded),

                        ), // Use a network image instead of a local asset
                        label: const Text(
                          'Report History',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),

      /*bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.lightBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Patient Info',
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
      ),*/
    );
  }


}