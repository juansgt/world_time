import 'package:flutter/material.dart';
import 'package:world_time/services/location.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  ChooseLocationState createState() => ChooseLocationState();
}

class ChooseLocationState extends State<ChooseLocation> {

  List<Location> locations = [
      Location(continent: 'Europe', city: 'London', flag: 'uk.png'),
      Location(continent: 'Europe', city: 'Athens', flag: 'greece.png'),
      Location(continent: 'Africa', city: 'Cairo', flag: 'egypt.png'),
      Location(continent: 'Africa', city: 'Nairobi', flag: 'kenya.png'),
      Location(continent: 'America', city: 'Chicago', flag: 'usa.png'),
      Location(continent: 'America', city: 'New York', flag: 'usa.png'),
      Location(continent: 'Asia', city: 'Seoul', flag: 'south_korea.png'),
      Location(continent: 'Asia', city: 'Jakarta', flag: 'indonesia.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
            'Choose Location',
            style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  print(locations[index].city);
                },
                title: Text(locations[index].city),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}