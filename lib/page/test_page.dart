import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class TestPage extends StatefulWidget {

  TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var userList = <Map<String, dynamic>>[];

  @override
  initState() {
    super.initState();

    getUsers();
  }

  Future<void> getUsers() async {
    try {
      QuerySnapshot userData = await _firestore.collection("users").get();

      // Clear existing mockUsers before adding new data
      // userList.clear();

      // Add user data to mockUsers list
      userData.docs.forEach((DocumentSnapshot document) {
        userList.add(document.data() as Map<String, dynamic>);
      });

      setState(() {});
      print(userData.docs);
    } catch (e) {
      print("Error fetching user data: $e");
      // Handle the error as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          var user = userList[index];
          return ListTile(
            title: Text(user['name']),
            subtitle: Text(user['email']),
            // Add more details or actions as needed
          );
        },
      ),
    );
  }
}
