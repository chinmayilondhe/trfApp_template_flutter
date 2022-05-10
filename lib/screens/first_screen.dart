import 'package:flutter/material.dart';
import 'package:flutter_app_template/models/bottom_navigation_bar.dart';
import 'package:flutter_app_template/screens/homepage.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text("HomePage"),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (c)=>HomePage()));
            },
          ),
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
