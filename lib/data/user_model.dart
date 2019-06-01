import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterhack/util.dart';

class UserModel  {

  static const String FIRST_NAME = 'firstName';
  static const String LAST_NAME = 'lastName';
  static const String EMAIL = 'email';
  static const String SIGNUP_DATE = 'signupDate';

  final String firstName;
  final String lastName;
  final DateTime signupDate;
  final String email;

  final String id;

  final DocumentReference reference;

  UserModel.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map[FIRST_NAME] != null),
        assert(map[LAST_NAME] != null),
        assert(map[EMAIL] != null),
        assert(map[SIGNUP_DATE] != null),

        firstName = map[FIRST_NAME],
        lastName = map[LAST_NAME],
        email = map[EMAIL],
        signupDate = parseTime(map[SIGNUP_DATE]),

        id = reference.documentID;

  UserModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Review<$id:>";

}
