import 'package:flutter/material.dart';
import 'package:flutterhack/models/hardcoded_resource.dart';
import 'package:flutterhack/widgets/resource_tile.dart';

class ListScreen extends StatelessWidget {
  final List<HardcodedResource>_resources = [
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
      245
    ),
    HardcodedResource(
    'Flutter Tutorial for Beginners - Build iOS and Android Apps',
    1,
    1,
    1,
    '5.0',
    '1.4.2',
    PrimaryType.video,
    ['list'],
    'https://www.youtube.com/watch?v=GLSG_Wh_YWc',
    89
    ),
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
      123
    ),
  ];

  Widget _buildResource(BuildContext context, int index) {
//    var text = _resources[index];
    return ResourceTile(resource: _resources[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Browse"),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: _buildResource,
        itemCount: _resources.length,
      ),
    );
  }
}