import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'add_meal_page.dart';

class ImageChoosePage extends StatefulWidget {
  const ImageChoosePage({Key? key}) : super(key: key);

  @override
  State<ImageChoosePage> createState() => _ImageChoosePageState();
}

class _ImageChoosePageState extends State<ImageChoosePage> {
  final _auth2 = FirebaseAuth.instance;
  File? image;

  Future chooseImage(ImageSource source) async{
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image != null) {
        final imageTemporarily = File(image.path);
        this.image = imageTemporarily;
      } else {
        return;
      }
    }on PlatformException catch (e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Failed to pick image")
      )
      );
    }
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Image'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (builder)=>const FirstMealPage())); // Handle menu icon press
          },
        ),
        actions: const [
          /*IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                // Handle home icon press
              },
            ),*/
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "img/dia_pic.jpg"


                ),
                fit: BoxFit.cover// otherwise yhere is a space in corners

            )
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 400,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
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
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromARGB(207, 0, 26, 95),width: 4),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: SizedBox(
                      //g
                      height: 100,
                      width: 300,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          chooseImage(ImageSource.camera);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          foregroundColor: MaterialStateProperty.all(Colors.blue),
                        ),
                        icon: IconTheme(
                          data: IconThemeData(size: 60,color: Colors.blue),
                          child: Icon(Icons.camera_alt_rounded),

                        ), // Use a network image instead of a local asset
                        label: const Text(
                          'Capture From Camera',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromARGB(207, 0, 26, 95),width: 4),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: SizedBox(
                      //g
                      height: 100,
                      width: 300,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          chooseImage(ImageSource.gallery);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          foregroundColor: MaterialStateProperty.all(Colors.blue),
                        ),
                        icon: IconTheme(
                          data: IconThemeData(size: 60,color: Colors.blue),
                          child: Icon(Icons.photo),

                        ), // Use a network image instead of a local asset
                        label: const Text(
                          'Select From Gallery',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
