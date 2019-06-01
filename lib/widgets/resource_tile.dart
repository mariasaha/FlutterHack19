import 'package:flutter/material.dart';
import 'package:flutterhack/models/hardcoded_resource.dart';
import 'package:flutterhack/widgets/star_display.dart';

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

    switch(widget.resource.getLevel()) {
      case Level.beginner:
        color = Colors.green;
        text = 'Beginner';
        break;

      case Level.intermediate:
        color = Colors.yellow;
        text = 'Intermediate';
        break;

      case Level.advanced:
        color = Colors.red;
        text = 'Advanced';
        break;
    }

    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            child: LinearProgressIndicator(
              backgroundColor: Colors.white,
              value: widget.resource.difficulty,
              valueColor: AlwaysStoppedAnimation(color)
            )
          )
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(text,
              style: TextStyle(color: Colors.black))),
        )
      ]
    );

  }

  Widget _buildRating() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: StarDisplay(value: widget.resource.rating)
        ),
        Expanded(
          flex: 1,
          child: Text('${widget.resource.numReviews} reviews')
        )
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
        ]
      )
    );
  }

  Widget _buildIcon() {
    var icon;
    switch(widget.resource.primaryType) {
      case PrimaryType.blog:
        icon = Icons.description;
        break;
      case PrimaryType.video:
        icon = Icons.video_library;
        break;

      case PrimaryType.audio:
        icon = Icons.audiotrack;
        break;

      case PrimaryType.code:
        icon = Icons.code;
        break;

    }

    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 20.0),
      child: Icon(icon, size: 50.0, color: Colors.indigoAccent)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Row(
          children: <Widget>[
            _buildIcon(),
            _buildData(),
          ]
        )
      )
    );
  }

}