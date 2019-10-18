import 'package:flutter/material.dart';

class UsageStatistics {
  int numberOfSubmissions;
  int numberOfOpenSubmissions;
  int kudosGiven;
  int kudosReceived;
  int totalPoints;
  String level;

  UsageStatistics({
    @required this.numberOfSubmissions,
    @required this.numberOfOpenSubmissions,
    @required this.kudosGiven,
    @required this.kudosReceived,
    @required this.totalPoints,
    @required this.level,
  });
}
