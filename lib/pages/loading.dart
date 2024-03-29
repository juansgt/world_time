import 'package:flutter/material.dart';
import 'package:world_time/services/i_world_time_service.dart';
import 'package:world_time/services/location.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    try {
      Location location = Location(continent: 'Europe', city: 'Madrid', flag: 'spain.png');
      worldTime = await worldTimeService.getWorldTime(location);
        Navigator.pushNamed(context, '/home', arguments: {
        'location': location.city,
        'flag': location.flag,
        'time': worldTime?.formattedDateTime,
        'isDayTime': worldTime?.isDayTime
      });
    } catch (e) {
      setState(() {
        time = 'Could not loading data';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}