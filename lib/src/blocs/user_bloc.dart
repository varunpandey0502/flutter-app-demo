import 'package:demo/src/resources/firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:demo/src/models/usage_statistics.dart';
import 'package:demo/src/models/user.dart';

class UserBloc {
  FirestoreProvider _firestoreProvider = FirestoreProvider();

  Stream<QuerySnapshot> get userDetails {
    return _firestoreProvider.userDetails();
  }

  Future<UsageStatistics> getUsageStatistics() async {
    int kudosGiven = await _firestoreProvider.getKudosGiven();
    int numberOfSubmissions = await getTotalReports();
    int numberOfOpenSubmissions =
        await _firestoreProvider.getUserOpenSubmissions();
    int totalPoints = await _calculateTotalPoints();
    String level = _getUserLevel(totalPoints);

    UsageStatistics usageStatistics = UsageStatistics(
      numberOfSubmissions: numberOfSubmissions,
      kudosReceived: 0,
      kudosGiven: kudosGiven,
      totalPoints: totalPoints,
      level: level,
      numberOfOpenSubmissions: numberOfOpenSubmissions,
    );

    return usageStatistics;
  }

  Future<int> _calculateTotalPoints() async {
    List<int> submissionTypes = [];
    int totalPoints = 0;

    QuerySnapshot userSubmissionsSnapshot =
        await _firestoreProvider.getUserSubmissions();

    userSubmissionsSnapshot.documents.forEach((document) {
      submissionTypes.add(document.data['submissionTypeId']);
    });

    var futures = <Future>[];
    submissionTypes.forEach((submissionType) {
      futures.add(
        _firestoreProvider.getSubmissionPoints(submissionType).then(
          (onValue) {
            totalPoints += onValue;
          },
        ),
      );
    });
    await Future.wait(futures);

    return totalPoints;
  }

  Future<int> getTotalReports() async {
    QuerySnapshot userSubmissionsSnapshot =
        await _firestoreProvider.getUserSubmissions();
    return userSubmissionsSnapshot.documents.length;
  }

  List<String> levels = [
    'Newbie',
    'Adept',
    'Experienced',
    'Proficient',
    'Specialist',
    'Inspiring'
  ];

  String _getUserLevel(int totalPoints) {
    if (totalPoints <= 100) {
      return 'Newbie';
    } else if (totalPoints <= 300) {
      return 'Adept';
    } else if (totalPoints <= 500) {
      return 'Experienced';
    } else if (totalPoints <= 1000) {
      return 'Proficient';
    } else if (totalPoints <= 3000) {
      return 'Specialist';
    } else if (totalPoints <= 5000) {
      return 'Inspiring';
    }
  }
}
