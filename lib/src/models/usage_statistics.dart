import 'package:flutter/material.dart';

class UsageStatistics {
  int numberOfSubmissions;
  String kudosGiven;
  String kudosReceived;
  int totalPoints;
  String level;

  UsageStatistics({
    @required this.numberOfSubmissions,
    @required this.kudosGiven,
    @required this.kudosReceived,
    @required this.totalPoints,
  });
}
