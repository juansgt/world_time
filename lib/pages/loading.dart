import 'package:flutter/material.dart';
import 'package:world_time/services/i_world_time_service.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  
  final IWorldTimeService worldTimeService;

  Loading ({ required this.worldTimeService });

  @override
  LoadingState createState() => LoadingState(worldTimeService: worldTimeService);
}

class LoadingState extends State<Loading> {

  final IWorldTimeService worldTimeService;

  LoadingState ({ required this.worldTimeService });

  @override
  void initState() {
    super.initState();
    WorldTime worldTime = WorldTime(country: 'Europe', location: 'Berlin', flag: 'spain.png');
    worldTimeService.getTime(worldTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading screen'),
    );
  }
}