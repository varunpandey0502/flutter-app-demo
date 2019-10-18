import 'package:flutter/cupertino.dart';

class User {
  String firstName;
  String lastName;
  String role;
  String branchName;

  User({
    @required this.firstName,
    @required this.lastName,
    @required this.role,
    @required this.branchName,
  });
}
