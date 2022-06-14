import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_template/screens/homescreen.dart';
import 'package:firebase_template/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';
import '../services/firebase_auth_methods.dart';
import '../util/snackbar.dart';
import 'email_verification_screen.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {

  TextEditingController emailidcontroller = TextEditingController();
  TextEditingController pswdcontroller = TextEditingController();

  void SignUpUser() async {
    String res=await FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
        email: emailidcontroller.text,
        password: pswdcontroller.text,
        context: context);
    print(res);
    if (res != "success") {
      showSnackBar(context, res);
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => VerifyEmailScreen()));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextFormField(

                  controller: emailidcontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email ID',
                  ),

                  autofocus: true,
                  cursorRadius: const Radius.circular(15),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  controller: pswdcontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  cursorRadius: const Radius.circular(15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 20,left: 16,right: 16),
              child: Container(
                height: 50,
                width:  MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                  onPressed: (){
                      SignUpUser();

                  },
                  child: const Text('Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                      )),
                ),
              ),
            ),
            Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? "),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (c) => Login()));
                      },
                      child: Text(
                        "Login here",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color:    Color(0xFF055B7C),),
                      ))
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 20,left: 16,right: 16),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                  onPressed: () => FirebaseAuthMethods(FirebaseAuth.instance).signInWithGoogle(context),
                  child: const Text('Continue with Google',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
