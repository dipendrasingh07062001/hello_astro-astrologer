import 'package:get/get.dart';

class AvailabilityTiming {
  String id = "";
  DateTime? date;
  RxList<Timing>? timing = RxList();
  RxBool? saved = false.obs;
  AvailabilityTiming({this.id = "", this.date, this.timing, this.saved});
  Map<String, dynamic> toJson() => {
        "date": date?.toIso8601String(),
        "timing": timing?.map((element) => element.toJson())
      };
}

class Timing {
  DateTime? startTime;
  DateTime? endTime;
  Timing({this.startTime, this.endTime});
  Map<String, dynamic> toJson() => {
        "startTime": startTime?.toIso8601String(),
        "endTime": endTime?.toIso8601String(),
      };
}
