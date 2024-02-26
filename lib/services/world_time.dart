class WorldTime {
  final DateTime dateTime;
  final String formattedDateTime;
  final bool isDayTime;

  WorldTime({required this.dateTime, required this.formattedDateTime}) : 
    isDayTime = dateTime.hour > 6 && dateTime.hour < 20 ? true : false;
}