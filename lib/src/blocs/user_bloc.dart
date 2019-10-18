import 'package:demo/src/models/usage_statistics.dart';
import 'package:demo/src/models/user.dart';

class UserBloc {
  List<String> levels = [
    'Newbie',
    'Adept',
    'Experienced',
    'Proficient',
    'Specialist',
    'Inspiring'
  ];

  User demoUser = User(
    firstName: 'John',
    lastName: 'Doe',
    role: 'Store Supervisor',
    branchName: 'VIC',
  );

  UsageStatistics demoUsageStatistics = UsageStatistics(
    numberOfSubmissions: 90,
    kudosReceived: '10k',
    kudosGiven: '24K',
    totalPoints: 1980,
  );

  UsageStatistics get usageStatistics {
    demoUsageStatistics.level = _setUserLevel(demoUsageStatistics.totalPoints);
    return demoUsageStatistics;
  }

  String _setUserLevel(int totalPoints) {
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

  User get user {
    return demoUser;
  }
}
