import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterhack/user_model.dart';
import 'package:rxdart/rxdart.dart';
import 'boelens_bloc_provider.dart';

class UserBloc extends BlocBase {
  final String userId;

  UserBloc({this.userId}) {
     _fetchUser(userId);
  }

  final _userSubject = BehaviorSubject<UserModel>();
  Observable<UserModel> get user => _userSubject.stream;

  dispose() async {
    await _userSubject.drain();
    _userSubject.close();
  }

  _fetchUser(String userId) {
    Firestore.instance
        .collection("users").document(userId)
        .snapshots()
        .listen((DocumentSnapshot ds) {
      final u = UserModel.fromSnapshot(ds);
      _userSubject.sink.add(u);
    });
  }

}