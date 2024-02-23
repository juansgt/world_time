import 'package:world_time/services/location.dart';
import 'package:world_time/services/world_time.dart';

abstract interface class IWorldTimeService {
  Future<WorldTime?> getWorldTime(Location worldTime) async { }
}