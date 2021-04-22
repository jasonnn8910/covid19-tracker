import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid19_tracker/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Stream collectionStream =
  //     FirebaseFirestore.instance.collection('users').snapshots();
  // Stream documentStream =
  //     FirebaseFirestore.instance.collection('users').doc('ABC123').snapshots();

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseAuth _auth = FirebaseAuth.instance;
  // TextEditingController _emailController = TextEditingController();
  // TextEditingController _passwordController = TextEditingController();
  // TextEditingController _firstNameController = TextEditingController();
  // TextEditingController _lastNameController = TextEditingController();
  // TextEditingController _sexController = TextEditingController();
  String _userId;

  final _formkey = GlobalKey<FormState>();

  Future<String> getUser() async {
    final uid = await _auth.currentUser.uid;
    return uid;
  }

  @override
  void initState() {
    super.initState();
    _userId = getUser().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        child: StreamBuilder<DocumentSnapshot>(
            stream: users.doc(_userId).snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }

              if (snapshot.hasData) {
                var data = snapshot.data;
                print(data);
                return Column(
                  children: [Text('firstName: ${data['firstName']}')]
                  ,
                );

              }
              return Form(
                key: _formkey,
                child: Container(
                  child: Column(children: []),
                ),
              );
            }),
      ),
    );
  }

  // Stream<QuerySnapshot> getUserSnapshot(BuildContext context){
  //     final uid = _auth.currentUser.uid;
  //     return users.doc(uid).collection('firstName').snapshots();
  // }

}
