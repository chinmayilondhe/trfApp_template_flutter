import 'package:firebase_template/screens/login.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  Future<void> logout() async {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ));
  }



@override
Widget build(BuildContext context) {
  return Drawer(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        Container(
          color: Colors.teal,
          padding: const EdgeInsets.all(14.0),
          child: Center(
            child: InkWell(
              child: const Text(
                'Logout',
                style: TextStyle(fontSize: 24, color: Colors.white),
                textAlign: TextAlign.left,
              ),
              onTap: logout,
            ),
          ),
        ),
      ],
    ),
  );
}}
