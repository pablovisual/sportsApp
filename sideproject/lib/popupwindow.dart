import 'package:flutter/material.dart';

class yeet extends StatefulWidget {
  yeet({Key key}) : super(key: key);

  _yeetState createState() => _yeetState();
}

class _yeetState extends State<yeet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:
       
       Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: <Widget>[
                     RotatedBox(
                        quarterTurns: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 100.0),
                          child: Icon(
                            Icons.navigation,
                            color: Colors.red,
                            size: 500.0,
                          ),
                        ),
                      ),
                   ],
                 )
    );
  }
}