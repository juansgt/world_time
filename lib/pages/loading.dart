import 'package:flutter/material.dart';
import 'package:world_time/services/i_world_time_service.dart';
import 'package:world_time/services/location.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  
  final IWorldTimeService worldTimeService;

  Loading ({ required this.worldTimeService });

  @override
  LoadingState createState() => LoadingState(worldTimeService: worldTimeService);
}

class LoadingState extends State<Loading> {

  String time = 'Loading...';
  WorldTime? worldTime;
  final IWorldTimeService worldTimeService;

  LoadingState ({ required this.worldTimeService });

  void setupWorldTime() async {
    Location location = Location(continent: 'Europe', city: 'Berlin', flag: 'spain.png');
    worldTime = await worldTimeService.getWorldTime(location);
    setState(() {
      time = worldTime!.formattedDateTime;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}