

import 'package:firebase/controller/log_in_controller.dart';
import 'package:firebase/page/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});


  LogInController logInController = Get.put(LogInController()) ;

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
              controller: logInController.emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: logInController.passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: (){
                logInController.firebaseLogIn(context);
              },
              child: Text('Sign In'),
            ),

            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=> SignUpPage()));
              },
              child: Text('Sign Up'),
            ),

          ],
        ),
      ),
    );
  }
}
