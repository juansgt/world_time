import 'package:world_time/services/world_time.dart';

abstract interface class IWorldTimeService {
  void getTime(WorldTime worldTime) async {}
}