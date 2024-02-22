import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  LoadingState createState() => LoadingState();
}

class LoadingState extends State<Loading> {

  void getTime() async {

    Uri uri = Uri(
      scheme: 'http',
      host: 'worldtimeapi.org',
      path: 'api/timezone/Europe/Madrid',
    );
    Response response = await get(uri);
    Map data = jsonDecode(response.body);
    // print(data);

    String datetime = data['datetime'];
    String offset = data['utc_offset'];
    offset = offset.substring(1, 3);
    // print(datetime);
    // print(offset);

    // Create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading screen'),
    );
  }
}