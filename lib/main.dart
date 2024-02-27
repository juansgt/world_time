import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/services/i_world_time_service.dart';
import 'package:world_time/services/world_time_service.dart';

void main() {

  IWorldTimeService worldTimeService = WorldTimeService();

  runApp(MaterialApp(
    // initialRoute: '/home',
    routes: {
      '/': (context) => Loading(worldTimeService: worldTimeService),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(worldTimeService: worldTimeService),
    },
  ));
}