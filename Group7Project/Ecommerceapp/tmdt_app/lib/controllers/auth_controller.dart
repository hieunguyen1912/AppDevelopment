import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> registerNewUser(String email, String fullName, String password) async {
    String res = 'something went wrong';
    
    try {

      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': email,
        'fullName': fullName,
        'locality': '',
        'city': '',
        'state': '',
        'pinCode': '',
        'uid': userCredential.user!.uid,
      });
      
      res = 'success';
      
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }

    return res;
  }


  Future<String> loginUser(String email, String password) async {
    String res = 'something went wrong';
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      res = 'success';
    } catch (e) {
      // Handle errors here
      print('Error: $e');
    }

    return res;
  }
}