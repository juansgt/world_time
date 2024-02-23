import 'dart:convert';

import 'package:http/http.dart';
import 'package:world_time/services/i_world_time_service.dart';
import 'package:world_time/services/location.dart';
import 'package:world_time/services/world_time.dart';

class WorldTimeService implements IWorldTimeService {

  @override
  Future<WorldTime> getWorldTime(Location location) async {
    try {
      
      WorldTime worldTime;

      Uri uri = Uri(
        scheme: 'http',
        host: 'worldtimeapi.org',
        path: 'api/timezone/${location.continent}/${location.city}',
      );
      Response response = await get(uri);
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      offset = offset.substring(1, 3);
      
      DateTime now = DateTime.parse(datetime);
      DateTime nowFormatted = now.add(Duration(hours: int.parse(offset)));
      
      worldTime = WorldTime(dateTime: now, formattedDateTime: nowFormatted.toString());

      return worldTime;

    } catch (ex) {
        rethrow;
    }
  }
}