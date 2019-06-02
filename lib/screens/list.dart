import 'package:flutter/material.dart';
import 'package:flutterhack/data/boelens_bloc_provider.dart';
import 'package:flutterhack/data/resource_list_bloc.dart';
import 'package:flutterhack/data/resource_model.dart';
import 'package:flutterhack/models/hardcoded_resource.dart';
import 'package:flutterhack/widgets/resource_tile.dart';

class ListScreen extends StatelessWidget {

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
                final HardcodedResource hcr = HardcodedResource(r.title, r.reportedDifficulty.toDouble(), r.reportedDifficulty,
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
