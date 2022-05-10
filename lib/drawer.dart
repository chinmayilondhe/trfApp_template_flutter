import 'package:flutter/material.dart';
import 'package:flutter_app_template/screens/homepage.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.blue,
                Colors.lightBlueAccent,
                  Colors.white
              ],
            ),
          ),
          child: ListView(
            children: [
              Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              ListTile(
                title: const Text(
                  'Settings',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onTap: () {

                },
              ),

              ListTile(
                title: const Text('My Account',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                onTap: () {

                },
              ),
              ListTile(
                title: const Text('Home',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (c) => const HomePage()),
                  );
                },
              ),



            ],

          ),
        ),
      ),
    );
  }
}
