import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  @override
  LoadingState createState() => LoadingState();
}

class LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading screen'),
    );
  }
}