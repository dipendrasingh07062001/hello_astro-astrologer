class AvailabilityTiming {
  String id = "";
  DateTime? date;
  List<Timing> timing = [];
  AvailabilityTiming({
    this.id = "",
    this.date,
    this.timing = const [],
  });
}

class Timing {
  String? startTime;
  String? endTime;
  Timing({
    this.startTime,
    this.endTime,
  });
}
