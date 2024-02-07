import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserListController extends GetxController {

  final TextEditingController naneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();





  RxList userList = [].obs;

  Future<void> firebaseFetchUserList() async {
    final FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

    try {
      QuerySnapshot data = await firebaseFireStore.collection("users").get();

      data.docs.forEach((DocumentSnapshot document) {
        userList
            .add(UserModel(name: document['name'], email: document['email']));
      });

      print("success") ;
    } catch (e) {
      print("error") ;
    }
  }



  Future<void> firebaseInsertData() async {
    final firebaseFireStore = FirebaseFirestore.instance.collection("users");

    try{
      String id = DateTime.now().millisecondsSinceEpoch.toString() ;
      firebaseFireStore.doc(id).set({
        "name" : naneController.text ,
        "email" : emailController.text ,
        "mobile" : mobileController.text ,

      }).then((value){
        print("success") ;
      });


    }catch (e) {

      print("error") ;

    }




  }
}
