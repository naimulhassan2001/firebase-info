import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/page/sign_up_page.dart';
import 'package:firebase/page/test_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;


  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();


  Future<void> firebaseLogIn(BuildContext context) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text) ;


      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TestPage(),)) ;
    } catch (e) {

    }
  }


}