import 'package:cloud_firestore/cloud_firestore.dart';
import 'resource_model.dart';
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

  _fetchSearchResources(String searchString) {
    Firestore.instance
        .collection("resources").where(ResourceModel.DESC, arrayContains: searchString)
        .snapshots()
        .listen((QuerySnapshot qs) {
      List<ResourceModel> list = [];
      print('search has ${qs.documents.length} items');
      int cnt = 0;
      for(DocumentSnapshot ds in qs.documents) {
        final res = ResourceModel.fromSnapshot(ds);
        print('search $cnt: ${res.desc}');
        list.add(res);
        cnt++;
      }
      _resourcesSubject.sink.add(list);
    });
  }

  updateSearch(String searchStr) {
    _fetchSearchResources(searchStr);
  }

}