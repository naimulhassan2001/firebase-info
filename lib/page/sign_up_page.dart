
import 'package:firebase/controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final FirebaseSingUpController firebaseSingUpController = Get.put(FirebaseSingUpController()) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Auth Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: firebaseSingUpController.naneController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: firebaseSingUpController.emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: firebaseSingUpController.passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: firebaseSingUpController.mobileController,
              decoration: InputDecoration(labelText: 'Mobile'),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: (){
                firebaseSingUpController.firebaseLogUp(context) ;
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }





}
