import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_template/model/drawer.dart';
import 'package:firebase_template/screens/login.dart';
import 'package:flutter/material.dart';

import '../services/firebase_auth_methods.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomeScreen"),),
      body:Container(
        height: MediaQuery.of(context).size.height

      ),
      drawer: CustomDrawer()
    );
  }
}
