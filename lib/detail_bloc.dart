import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterhack/resource_model.dart';
import 'package:rxdart/rxdart.dart';
import 'boelens_bloc_provider.dart';

class DetailBloc extends BlocBase {
  final String resourceId;

  DetailBloc({this.resourceId}) {
    print('[resource_bloc] ctor');
     _fetchResource(resourceId);
  }

  final _resourceSubject = BehaviorSubject<ResourceModel>();
  Observable<ResourceModel> get resource => _resourceSubject.stream;

  dispose() async {
    print('[detail_bloc] dispose');
    await _resourceSubject.drain();
    _resourceSubject.close();
  }
  
  _fetchResource(String resourceId) {
    Firestore.instance
        .collection("resources").document(resourceId)
        .snapshots()
        .listen((DocumentSnapshot ds) {
      print('[resource_bloc] got new resource $resourceId');
      final res = ResourceModel.fromSnapshot(ds);
      _resourceSubject.sink.add(res);
    });
  }

}