import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterhack/resource_model.dart';
import 'package:flutterhack/review_model.dart';
import 'package:rxdart/rxdart.dart';
import 'boelens_bloc_provider.dart';

class DetailBloc extends BlocBase {
  final String resourceId;

  DetailBloc({this.resourceId}) {
    print('[resource_bloc] ctor');
     _fetchResource(resourceId);
     _fetchReviews(resourceId);
  }

  final _resourceSubject = BehaviorSubject<ResourceModel>();
  Observable<ResourceModel> get resource => _resourceSubject.stream;

  final _reviewsSubject = BehaviorSubject<List<ReviewModel>>();
  Observable<List<ReviewModel>> get reviews => _reviewsSubject.stream;

  dispose() async {
    print('[detail_bloc] dispose');
    await _resourceSubject.drain();
    await _reviewsSubject.drain();
    _resourceSubject.close();
    _reviewsSubject.close();
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

  _fetchReviews(String resourceId) {
        Firestore.instance
        .collection("reviews").where(ReviewModel.RESOURCE_ID, isEqualTo: resourceId)
        .snapshots()
        .listen((QuerySnapshot qs) {
      print('[resource_bloc] got new set of reviews for $resourceId');
      List<ReviewModel> list = [];
      for(DocumentSnapshot ds in qs.documents) {
        list.add(ReviewModel.fromSnapshot(ds));
      }
      _reviewsSubject.sink.add(list);
    });
  }

}