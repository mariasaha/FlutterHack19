import 'package:flutter/material.dart';
import 'package:flutterhack/data/boelens_bloc_provider.dart';
import 'package:flutterhack/data/resource_list_bloc.dart';
import 'package:flutterhack/data/resource_model.dart';
import 'package:flutterhack/models/hardcoded_resource.dart';
import 'package:flutterhack/widgets/resource_tile.dart';

class ListScreen extends StatelessWidget {
  final List<HardcodedResource> _resources = [
    HardcodedResource('Flutter Advanced : Build Beautiful Material Search App', 8, 9, 5, '5.0', '1.4.2',
        PrimaryType.video, ['search'], 'https://www.youtube.com/watch?v=FPcl1tu0gDs', 511),
    HardcodedResource(
        'The Flutter Series: Lists and Grids (RecyclerViews in Flutter)',
        2,
        3,
        3,
        '5.0',
        '1.4.2',
        PrimaryType.blog,
        ['grid', 'layout'],
        'https://medium.com/@dev.n/the-complete-flutter-series-article-3-lists-and-grids-in-flutter-b20d1a393e39',
        245),
    HardcodedResource('Flutter Tutorial for Beginners - Build iOS and Android Apps', 1, 1, 1, '5.0', '1.4.2',
        PrimaryType.video, ['list'], 'https://www.youtube.com/watch?v=GLSG_Wh_YWc', 89),
    HardcodedResource(
        'Flutter Thursday 04: Beautiful List UI and Detail page (part 2)',
        5,
        6,
        4,
        '5.0',
        '1.4.2',
        PrimaryType.blog,
        ['list'],
        'https://medium.com/@afegbua/this-is-the-second-part-of-the-beautiful-list-ui-and-detail-page-article-ecb43e203915',
        123),
  ];

  Widget _buildResource(BuildContext context, HardcodedResource hcr) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/detail');
      },
      child: ResourceTile(resource: hcr),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BoelensBlocProvider.of<ResourceListBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text("FRR Sure"), actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            })
      ]),
      body: StreamBuilder(
          stream: bloc.resources,
          builder: (BuildContext context, AsyncSnapshot<List<ResourceModel>> list) {
            if (!list.hasData) return CircularProgressIndicator();
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int inx) {
                final r = list.data[inx];
                final HardcodedResource hcr = HardcodedResource(r.title, r.reportedDifficulty.toDouble(), 7,
                    r.averageRating.toInt(), r.dartVersion, r.flutterVersion, PrimaryType.video, r.tags, r.repoUrl, 89);
                return _buildResource(context, hcr);
              },
              itemCount: list.data.length,
            );
          }),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Column();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}
