


import 'package:firebase/controller/user_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserListPage extends StatelessWidget {
  UserListPage({super.key});

  final UserListController userListController = Get.put(UserListController());
  

  @override
  Widget build(BuildContext context) {
    userListController.firebaseFetchUserList() ;
    return Scaffold(
      body: Obx(() => ListView.builder(
        itemCount: userListController.userList.length,
        itemBuilder: (context, index) {
          var user = userListController.userList[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.email),
            // Add more details or actions as needed
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _showDialog(BuildContext context) async {
    userListController.naneController.clear();
    userListController.emailController.clear();
    userListController.passwordController.clear();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: userListController.naneController,
                  decoration: InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: userListController.emailController,
                  decoration: InputDecoration(
                      labelText: "E-mail",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: userListController.mobileController,
                  decoration: InputDecoration(
                      labelText: "password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("cancel")),
            TextButton(
                onPressed: () {
                  userListController.firebaseInsertData() ;
                  Navigator.pop(context);
                },
                child: const Text("add")),
          ],
        );
      },
    );
  }

}
