import 'dart:convert';

import 'package:http/http.dart';
import 'package:world_time/services/i_world_time_service.dart';
import 'package:world_time/services/world_time.dart';

class WorldTimeService implements IWorldTimeService {

  @override
  void getTime(WorldTime worldTime) async {

    Uri uri = Uri(
      scheme: 'http',
      host: 'worldtimeapi.org',
      path: 'api/timezone/${worldTime.country}/${worldTime.location}',
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
}