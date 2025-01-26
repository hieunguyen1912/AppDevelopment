import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> registerNewUser(
      String email, String fullName, String password) async {
    String res = 'Email hoặc Mật Khẩu không phù hợp';

    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

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
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        res = 'Mật Khẩu quá yếu.';
      } else if (e.code == 'email-already-in-use') {
        res = 'Email đã được sử dụng.';
      }
    } catch (e) {
      // Handle errors here
      res = e.toString();
    }

    return res;
  }

  Future<String> loginUser(String email, String password) async {
    String res = 'Email hoặc Mật Khẩu không phù hợp';
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      res = 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        res = 'Email không tồn tại.';
      } else if (e.code == 'wrong-password') {
        res = 'Mật Khẩu không đúng, vui lòng thử lại.';
      }
    } catch (e) {
      // Handle errors here
      res = e.toString();
    }

    return res;
  }
}
