import 'package:flutter/material.dart';
import 'package:news/Model/LayoutModel.dart';

class DetailsPage extends StatefulWidget {
  final LayoutModel value;

  DetailsPage({Key key, this.value}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('${widget.value.title}'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: new Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    child: Image.asset('${widget.value.image}'),
                    padding: EdgeInsets.only(bottom: 20.0),
                  ),
                  Padding(
                    child: Text(
                      '${widget.value.title}',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                      textAlign: TextAlign.left,
                    ),
                    padding: EdgeInsets.all(20.0),
                  ),
                  Padding(
                    child: Text(
                      '${widget.value.article}',
                      style: TextStyle(fontWeight: FontWeight.normal),
                      textAlign: TextAlign.left,
                    ),
                    padding: EdgeInsets.all(20.0),
                  ),
                  Padding(
                    child: Text(
                      '${widget.value.source}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    padding: EdgeInsets.all(20.0),
                  ),
                  Padding(
                    child: Text(
                      '${widget.value.duration}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    padding: EdgeInsets.all(20.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
