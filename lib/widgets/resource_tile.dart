import 'package:flutter/material.dart';
import 'package:flutterhack/models/hardcoded_resource.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:math';

class ResourceTile extends StatefulWidget {
  const ResourceTile({
    Key key,
    this.resource,
  }) : super(key: key);

  final HardcodedResource resource;

  @override
  State<ResourceTile> createState() => ResourceTileState();
}

class ResourceTileState extends State<ResourceTile> {
  Widget _buildLevel() {
    var color;
    var text;

    switch (widget.resource.getLevel()) {
      case Level.beginner:
        color = Colors.green;
        text = 'Beginner';
        break;

      case Level.intermediate:
        color = Colors.yellow;
        text = 'Intermediate';
        break;

      case Level.advanced:
        color = Colors.deepOrangeAccent;
        text = 'Advanced';
        break;
    }

    return Row(children: <Widget>[
      Expanded(
          flex: 1,
          child: Container(
              child: LinearProgressIndicator(
                  backgroundColor: Colors.black12,
                  value: widget.resource.difficulty / 10.0,
                  valueColor: AlwaysStoppedAnimation(color)))),
      Expanded(
        flex: 4,
        child: Padding(padding: EdgeInsets.only(left: 10.0), child: Text(text, style: TextStyle(color: Colors.black))),
      )
    ]);
  }

  Widget _buildRating() {
    Random rnd;
    int min = 50;
    int max = 1000;
    rnd = new Random();
    int r = min + rnd.nextInt(max - min);

    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: FlutterRatingBarIndicator(
            rating: widget.resource.rating.toDouble(),
            itemCount: 5,
            itemSize: 15.0,
            fillColor: Colors.indigo,
            emptyColor: Colors.indigo.withAlpha(40),
          ),
        ),
        Expanded(flex: 1, child: Text('${r} reviews'))
      ],
    );
  }

  Widget _buildData() {
    return Expanded(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
          Text(widget.resource.title, style: TextStyle(fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: _buildLevel(),
          ),
          _buildRating(),
        ]));
  }

  Widget _buildIcon() {
    var icon;
    Random rnd;
    int min = 1;
    int max = 11;
    rnd = new Random();
    int r = min + rnd.nextInt(max - min);

    if (r < 4) {
      icon = Icons.description;
    } else if (r < 8) {
      icon = Icons.video_library;
    } else if (r < 10) {
      icon = Icons.code;
    } else {
      icon = Icons.audiotrack;
    }

    return Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 20.0), child: Icon(icon, size: 50.0, color: Colors.indigo));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Row(children: <Widget>[
              _buildIcon(),
              _buildData(),
            ])));
  }
}
