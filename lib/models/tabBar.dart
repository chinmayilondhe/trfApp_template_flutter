import 'package:flutter/material.dart';
import 'package:flutter_app_template/screens/first_screen.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Flutter Tabs Demo'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.contacts), text: "Tab 1"),
                Tab(icon: Icon(Icons.camera_alt), text: "Tab 2")
              ],
            ),
          ),
          body: TabBarView(
            children: [
              FirstScreen(),
              FirstScreen()
            ],
          ),
        ),
      ),
    );
  }
}
