import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_template/screens/homescreen.dart';
import 'package:firebase_template/screens/sign_up.dart';
import 'package:firebase_template/services/firebase_auth_methods.dart';
import 'package:firebase_template/util/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'forget_password.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailidcontroller = TextEditingController();
  TextEditingController pswdcontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailidcontroller.dispose();
    pswdcontroller.dispose();
  }

  void loginUser() async{
    String res = await FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
        email: emailidcontroller.text,
        password: pswdcontroller.text,
        context: context);

    if(res!= 'success'){
      showSnackBar(context, res);
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=> HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                  padding: const EdgeInsets.only(
                      top: 30.0, bottom: 20, left: 16, right: 16),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed: loginUser,
                      child: const Text('Log In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                          )),
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: ()=> ForgotPassword(),
                    child: Text(
                      "Forget Password ?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? "),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (c) => Signin()));
                          },
                          child: const Text(
                            "Create here",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF055B7C),
                            ),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, bottom: 20, left: 16, right: 16),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(15)),
                    child: ElevatedButton(
                      onPressed: () =>
                          FirebaseAuthMethods(FirebaseAuth.instance)
                              .signInWithGoogle(context),
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
        ),
      ),
    );
  }
}
