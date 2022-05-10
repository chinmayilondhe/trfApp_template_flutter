import 'package:flutter/material.dart';

class CustomSnackBar extends StatefulWidget {
  const CustomSnackBar({Key? key}) : super(key: key);

  @override
  _CustomSnackBarState createState() => _CustomSnackBarState();
}

class _CustomSnackBarState extends State<CustomSnackBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ElevatedButton(
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

    );
  }
}
