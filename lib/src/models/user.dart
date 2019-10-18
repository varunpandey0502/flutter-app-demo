import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class User {
  String firstName;
  String lastName;
  String role;
  String branchName;
  String bio;

  User({
    @required this.firstName,
    @required this.lastName,
    @required this.role,
    @required this.branchName,
    @required this.bio,
  });

  User.fromSnapshot(DocumentSnapshot documentSnapshot)
      : firstName = documentSnapshot['firstName'],
        lastName = documentSnapshot['lastName'],
        role = documentSnapshot['role'],
        branchName = documentSnapshot['branchName'],
        bio = documentSnapshot['bio'];
}
