import 'package:flutter/material.dart';
import 'package:flutterhack/data/boelens_bloc_provider.dart';
import 'package:flutterhack/data/detail_bloc.dart';
import 'package:flutterhack/data/resource_model.dart';
import 'package:flutterhack/data/user_bloc.dart';
import 'package:flutterhack/widgets/user_widget.dart';
import 'package:flutterhack/widgets/star_display.dart';

class DetailPage extends StatelessWidget {
  Widget _buildTags(List<String> tags) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: tags.map((tag) => Chip(
          label: Text(tag, style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.indigo,
        )).toList(),
      )
    );
  }

  Widget build(BuildContext context) {
    final bloc = BoelensBlocProvider.of<DetailBloc>(context);
    return StreamBuilder(
        stream: bloc.resource,
        builder: (context, AsyncSnapshot<ResourceModel> resource) {
          if (!resource.hasData) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          final res = resource.data;
          final authorBloc = UserBloc(userId: res.authorId);

          return Scaffold(
            //floatingActionButton:
            appBar: AppBar(title: Text(res.title)),
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(res.title, style: TextStyle(fontSize: 20.0)),
                  ),
                  BoelensBlocProvider<UserBloc>(
                    bloc: authorBloc,
                    child: UserWidget(),
                  ),
                  Expanded(
                    flex: 1,
                    child: StarDisplay(value: res.averageRating.round()),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                    child: Text('${res.desc}', style: TextStyle(fontSize: 15.0)),
                  ),
                  Text('Dart Version:  ${res.dartVersion}'),
                  Text('Flutter Version: ${res.flutterVersion}'),
                  Text('Reported Difficulty: ${res.reportedDifficulty}'),
                  Text('Publish Date: ${res.publishDate}'),
                  Text('Repo URL: ${res.repoUrl}'),
                  Text('Video URL: ${res.videoUrl}'),
                  _buildTags(res.tags),
                  SizedBox(height: 30.0),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/reviewlist');
                    },
                    child: Text('Reviews'),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/addreview');
                    },
                    child: Text('Add Review'),
                  )
                ],
              ),
            )
          );
        });
  }
}
