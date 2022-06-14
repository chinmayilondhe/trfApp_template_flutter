import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_template/screens/login.dart';
import 'package:flutter/material.dart';

import '../util/snackbar.dart';


class VerifyEmailScreen extends StatefulWidget {
  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool isEmailVerified = false;
  Timer? timer;
  bool canResendEmail = false;

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
          const Duration(seconds: 3), (timer) => checkEmailVerified());
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() {
        canResendEmail = false;
      });

      await Future.delayed(const Duration(seconds: 60));

      setState(() {
        canResendEmail = true;
      });
    } on Exception catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? Login()
      : Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "A verification email has sent to your email",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton.icon(
                icon: Icon(Icons.email),
                onPressed: canResendEmail ? sendVerificationEmail : null,

                // canResendEmail ? sendVerificationEmail : startTimer},
                label: const Text(
                  "Resent Email",
                  style: TextStyle(fontSize: 16),
                )),
            const SizedBox(height: 16),
            !canResendEmail
                ? const Text("Wait for 60 seconds")
                : const Text("")
            // ElevatedButton(
            //     onPressed: () => FirebaseAuth.instance.signOut(), child: Text("Cancel"))
          ],
        ),
      ));
}