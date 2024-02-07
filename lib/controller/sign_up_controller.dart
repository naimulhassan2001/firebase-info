import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/page/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseSingUpController extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final TextEditingController naneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  Future<void> firebaseLogUp(BuildContext context) async {
    print("called");
    try {
      firebaseAuth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      ).then((value) async {
        await firebaseFirestore.collection("users").doc(value.user!.uid).set({
          "name": naneController.text,
          "email": emailController.text,
          "mobile": mobileController.text,
        });

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogInPage(),)) ;

      });


      print("success");
    } catch (e) {
      print("Error");
    }
  }


}
