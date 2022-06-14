
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_template/util/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthMethods{
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);
  Future<String> signUpWithEmail({
    required String email,
    required  String password,
    required BuildContext context,
  }) async{
    String res="";
    try{
      if(email.isNotEmpty || password.isNotEmpty){
        await _auth.createUserWithEmailAndPassword(email: email,
            password: password);
      res="success";}
      else {
        showSnackBar(context,"Credentials are empty");
      }

    }on FirebaseAuthException catch(e){
      res=e.code;
      showSnackBar(context,e.code);
    }
    catch(e){
      return e.toString();
    }
    return res;
  }
  //Email login
  Future<String> loginWithEmail({required String email,
    required String password,
    required BuildContext context,})async{
    String res = "Some error occurred";

    try{
      await _auth.signInWithEmailAndPassword(email: email,
          password: password);
      if (email.isNotEmpty || password.isNotEmpty) {
        final user = await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        res = "success";
      }else {
        res = "Please fill all the fields";
      }
    }
    on FirebaseAuthException catch(e){
      res=e.code;
      showSnackBar(context, e.code);
    }catch(e){
      res=e.toString();
    }
   return res;
  }

  //Email verification
  Future<void> sendEmailVerification(BuildContext context) async{
    try{
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, "Email Verification sent!");
    }
    on FirebaseAuthException catch(e){
      showSnackBar(context, e.message!);
    }
  }
  //Google sign in
Future<void> signInWithGoogle(BuildContext context)async{
    try{
      final GoogleSignInAccount? googleUser=await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth=await googleUser?.authentication;
    if(googleAuth?.accessToken!=null && googleAuth?.idToken!=null){
      final credential=GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken
      );
      UserCredential userCredential=await _auth.signInWithCredential(credential);
   if(userCredential.user!=null){
     if(userCredential.additionalUserInfo!.isNewUser){

     }
   }
    }
    } on FirebaseAuthException catch(e){
      showSnackBar(context, e.message!);
    }
}

  Future<String> resetPassword(String email) async {
    String res = "Some error occured";

    try {
      if (email.isNotEmpty) {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

        res = "success";
      } else {
        res = "Please enter an email";
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return e.code;
    }

    return res;
  }
  
  Future<void> signOut() async {
    await _auth.signOut();
  }
}