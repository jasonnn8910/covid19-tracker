import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid19_tracker/router/router_constant.dart';
import 'package:covid19_tracker/services/navigation.dart';
import 'package:covid19_tracker/services/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _instance = FirebaseFirestore.instance;
  CollectionReference _users = FirebaseFirestore.instance.collection('users');

  Future<void> userLogIn({email, password}) async {
    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print('User successfully signed in!!!');
      String uid = _auth.currentUser.uid;
      final user = FirebaseAuth.instance.currentUser;
      if (!user.emailVerified) {
        NavigationService.instance.navigateToReplacement(profileScreen);
        print(uid);
      }
    }).catchError(
            (onError) => print('Error signing in with email link $onError'));
  }

  Future<void> registerEmailPassword(
      {email, password, firstName, lastName, gender}) async {
    _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((res) {
      String uid = res.user.uid;
      _users.doc(uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'gender': gender,
      });
    });
  }

  Future<void> updateUser(firstName, gender, lastName) async {
    String uid = _auth.currentUser.uid;
    return await _users.doc(uid).update({
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
    });
  }
}
