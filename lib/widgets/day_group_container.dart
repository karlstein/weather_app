import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayGroupContainer extends StatelessWidget {
  const DayGroupContainer({required this.day, Key? key}) : super(key: key);

  final day;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 10, right: 20, top: 20),
      height: 100,
      child: Text(
        "${DateFormat('EEE').format(DateTime.parse(day))}\n${DateFormat('MM/dd').format(DateTime.parse(day))}",
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }
}
