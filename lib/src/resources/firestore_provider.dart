import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreProvider {
  Firestore _firestore = Firestore.instance;

  Stream<QuerySnapshot> userDetails() {
    return _firestore
        .collection('users')
        .where('userId', isEqualTo: 1)
        .snapshots();
  }

  Future<QuerySnapshot> getUserSubmissions() async {
    QuerySnapshot submissionsSnapshot = await _firestore
        .collection('submissions')
        .where('userId', isEqualTo: 1)
        .getDocuments();

    return submissionsSnapshot;
  }

  Future<int> getUserOpenSubmissions() async {
    QuerySnapshot openSubmissionsSnapshot = await _firestore
        .collection('submissions')
        .where('userId', isEqualTo: 1)
        .where('status', isEqualTo: 'Open')
        .getDocuments();

    return openSubmissionsSnapshot.documents.length;
  }

  Future<int> getSubmissionPoints(int typeId) async {
    QuerySnapshot submissionsTypeSnapshot = await _firestore
        .collection('submissions_type')
        .where('typeId', isEqualTo: typeId)
        .getDocuments();

    // print(submissionsTypeSnapshot.documents.first['points']);

    return submissionsTypeSnapshot.documents.first['points'];
  }

  Future<int> getKudosGiven() async {
    QuerySnapshot kudosGivenSubmissionType = await _firestore
        .collection('submissions_type')
        .where('submissionType', isEqualTo: 'Kudos Given')
        .getDocuments();

    QuerySnapshot kudosGivenSnapshot = await _firestore
        .collection('submissions')
        .where('submissionTypeId',
            isEqualTo: kudosGivenSubmissionType.documents.first['typeId'])
        .getDocuments();

    // print(kudosGivenSnapshot.documents.length);

    return kudosGivenSnapshot.documents.length;
  }
}
