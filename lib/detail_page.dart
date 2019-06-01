import 'package:flutter/material.dart';
import 'package:flutterhack/boelens_bloc_provider.dart';
import 'package:flutterhack/detail_bloc.dart';
import 'package:flutterhack/resource_model.dart';

class DetailPage extends StatelessWidget {

  Widget build(BuildContext context) {
    final bloc = BoelensBlocProvider.of<DetailBloc>(context);
    return StreamBuilder(
      stream: bloc.resource,
      builder: (context, AsyncSnapshot<ResourceModel> resource) {
        if( !resource.hasData) {
          return Scaffold(
            body:  Center(child:CircularProgressIndicator()),
          );
        }
        final res = resource.data;
        return Scaffold(
          //floatingActionButton: 
          appBar: AppBar(title: Text(res.title)),
          body: Column(children: <Widget>[
            Text(res.title),
            Text('Description: ${res.desc}'),
            Text('Dart Version:  ${res.dartVersion}'),
            Text('Flutter Version: ${res.flutterVersion}'),
            Text('Average Rating:  ${res.averageRating}'),
            Text('Author:  ${res.authorId}'),
            Text('Reported Difficulty: ${res.reportedDifficulty}'),
            Text('Publish Date: ${res.publishDate}'),
            Text('Repo URL: ${res.repoUrl}'),
            Text('Video URL: ${res.videoUrl}'),
          ],)
        );
      }
    );

  }


}