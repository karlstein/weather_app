import 'package:flutter/material.dart';

class DaytimeDiv {
  String? timeDiv;
  DateTimeRange? rangeTimeDiv;

  DaytimeDiv({this.timeDiv, this.rangeTimeDiv});
}

var date = DateTime.now();

List<DaytimeDiv> timeDivision = [
  DaytimeDiv(
      timeDiv: "Pagi",
      rangeTimeDiv: DateTimeRange(
          start: DateTime(date.year, date.month, date.day, 3, 0, 1),
          end: DateTime(date.year, date.month, date.day, 9, 0, 0))),
  DaytimeDiv(
      timeDiv: "Siang",
      rangeTimeDiv: DateTimeRange(
          start: DateTime(date.year, date.month, date.day, 9, 0, 1),
          end: DateTime(date.year, date.month, date.day, 15, 0, 0))),
  DaytimeDiv(
      timeDiv: "Sore",
      rangeTimeDiv: DateTimeRange(
          start: DateTime(date.year, date.month, date.day, 15, 0, 1),
          end: DateTime(date.year, date.month, date.day, 21, 0, 0))),
  DaytimeDiv(
      timeDiv: "Malam",
      rangeTimeDiv: DateTimeRange(
          start: DateTime(date.year, date.month, date.day, 21, 0, 1),
          end: DateTime(date.year, date.month, date.day + 1, 3, 0, 0))),
];
