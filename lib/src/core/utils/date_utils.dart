import 'package:flutter/material.dart';

extension DateTimeEX on DateTime {
  String getWeekAsDocumentId() {
    final dates = _getCurrentWeekDates(this);
    final startDate = dates.start;
    final endDate = dates.end;
    return "${startDate.day}_${startDate.month}_${startDate.year}" +
        "-" +
        "${endDate.day}_${endDate.month}_${endDate.year}";
  }

  String getDocIdFromDate() {
    return "${day}_${month}_$year";
  }

  static DateTime getDateFromDocId(String docId) {
    final data = docId.split("_");
    return DateTime(int.parse(data[2]), int.parse(data[1]), int.parse(data[0]));
  }
}

DateTimeRange _getCurrentWeekDates(DateTime currentDateTime) {
  switch (currentDateTime.weekday) {
    case DateTime.sunday:
      return DateTimeRange(
          start: currentDateTime.subtract(const Duration(days: 4)),
          end: currentDateTime.add(const Duration(days: 2)));
    case DateTime.monday:
      return DateTimeRange(
        start: currentDateTime.subtract(const Duration(days: 5)),
        end: currentDateTime.add(const Duration(days: 1)),
      );
    case DateTime.tuesday:
      return DateTimeRange(
        start: currentDateTime.subtract(const Duration(days: 6)),
        end: currentDateTime.add(const Duration(days: 0)),
      );
    case DateTime.wednesday:
      return DateTimeRange(
        start: currentDateTime.subtract(const Duration(days: 0)),
        end: currentDateTime.add(const Duration(days: 6)),
      );
    case DateTime.thursday:
      return DateTimeRange(
        start: currentDateTime.subtract(const Duration(days: 1)),
        end: currentDateTime.add(const Duration(days: 5)),
      );
    case DateTime.friday:
      return DateTimeRange(
        start: currentDateTime.subtract(const Duration(days: 2)),
        end: currentDateTime.add(const Duration(days: 4)),
      );
    case DateTime.saturday:
      return DateTimeRange(
        start: currentDateTime.subtract(const Duration(days: 3)),
        end: currentDateTime.add(const Duration(days: 3)),
      );
    default:
      throw Exception("Unknown Weekday");
  }
}
