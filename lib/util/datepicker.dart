import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<DateTime?> pickDate() async {
  return await showDatePicker(
    context: Get.context!,
    initialDate: DateTime.now(),
    firstDate: DateTime.now().subtract(const Duration(days: 700)),
    lastDate: DateTime.now().add(const Duration(days: 700)),
  );
}

Future<TimeOfDay?> picktime() async {
  return await showTimePicker(
      context: Get.context!, initialTime: TimeOfDay.now());
}

DateTime getDateWithGivenTime(TimeOfDay time) {
  return DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    time.hour,
    time.minute,
  );
}
