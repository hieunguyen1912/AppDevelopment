import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tmdt_app/models/user_model.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> registerNewUser(UserModel user) async {
    String res = 'Email hoặc Mật Khẩu không phù hợp';

    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: user.email, password: user.password);

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': user.email,
        'fullName': user.fullName,
        'password': user.password,
        'address': user.address,
        'uid': userCredential.user!.uid,
      });

      res = 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        res = 'Mật Khẩu quá yếu.';
      } else if (e.code == 'email-already-in-use') {
        res = 'Email have already used.';
      }
    } catch (e) {
      // Handle errors here
      res = e.toString();
    }

    return res;
  }

  Future<String> loginUser(UserModel user) async {
    String res = 'Email hoặc Mật Khẩu không phù hợp';
    try {
      await _auth.signInWithEmailAndPassword(email: user.email, password: user.password);
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
