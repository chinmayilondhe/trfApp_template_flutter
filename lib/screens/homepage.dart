import 'package:flutter/material.dart';
import 'package:flutter_app_template/drawer.dart';
import 'package:flutter_app_template/models/bottom_navigation_bar.dart';
import 'package:flutter_app_template/models/snackbar.dart';
import 'package:flutter_app_template/models/tabBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            ElevatedButton(
              child: Text('Show SnackBar', style: TextStyle(fontSize: 25.0,color: Colors.white),),

              onPressed: () {
                final snackBar = SnackBar(
                  content: Text('Hey! This is a SnackBar message.'),
                  duration: Duration(seconds: 5),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            ElevatedButton(
              child:Text("show tab Bar",style: TextStyle(fontSize: 25.0,)),
              onPressed:(){
                Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (c) => CustomTabBar()),
            );}),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
      ),
      // bottomNavigationBar: CustomBottomNavBar(),
      drawer: CustomDrawer(),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}