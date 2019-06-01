import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterhack/resource_model.dart';
import 'package:rxdart/rxdart.dart';
import 'boelens_bloc_provider.dart';

class ResourceListBloc extends BlocBase {

  ResourceListBloc() {
     _fetchAllResources();
  }

  final _resourcesSubject = BehaviorSubject<List<ResourceModel>>();
  Observable<List<ResourceModel>> get resources => _resourcesSubject.stream;

  dispose() async {
    await _resourcesSubject.drain();
    _resourcesSubject.close();
  }

  _fetchAllResources() {
    Firestore.instance
        .collection("resources")
        .snapshots()
        .listen((QuerySnapshot qs) {
      List<ResourceModel> list = [];
      for(DocumentSnapshot ds in qs.documents) {
        final res = ResourceModel.fromSnapshot(ds);
        list.add(res);
      }
      _resourcesSubject.sink.add(list);
    });
  }

}