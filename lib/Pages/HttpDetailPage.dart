import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:news/Model/HttpLayoutModel.dart';
import 'package:news/Model/LayoutModel.dart';

class HttpDetailPage extends StatefulWidget {
  final ProcheaPreyHttp value;

  HttpDetailPage({Key key, this.value}) : super(key: key);

  @override
  _HttpDetailPageState createState() => _HttpDetailPageState();
}

class _HttpDetailPageState extends State<HttpDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('${widget.value.title.rendered}'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: new Center(
              child: Column(
                children: <Widget>[
//                  Padding(
//                    child: Image.network('${widget.value.imageurl}'),
//                    padding: EdgeInsets.only(bottom: 20.0),
//                  ),
                  Padding(
                    child: Image.network('${widget.value.fimg_url}'),
                    padding: EdgeInsets.only(bottom: 20.0),
                  ),
                  Padding(
                    child: Text(
                      '${widget.value.title.rendered}',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,fontFamily: 'Battambang'),
                      textAlign: TextAlign.left,
                    ),
                    padding: EdgeInsets.all(20.0),
                  ),
                  Padding(
                    child: Html(data: '${widget.value.excerpt.rendered}',customTextStyle:(node,TextStyle baseStyle){
                      return baseStyle.merge(TextStyle(fontFamily: 'Battambang'));
                    }),
                    padding: EdgeInsets.all(20.0),
                  ),
                  Divider(thickness: 2,),
                  Padding(
                    child: Html(
                      data: '${widget.value.content.rendered}',customTextStyle:(node,TextStyle baseStyle){
                      return baseStyle.merge(TextStyle(fontFamily: 'Battambang'));
                    }),
                    padding: EdgeInsets.all(20.0),
                  ),
//                  Padding(
//                    child: Text(
//                      'Destination: ${widget.value.destination}',
//                      style: TextStyle(fontWeight: FontWeight.bold),
//                      textAlign: TextAlign.left,
//                    ),
//                    padding: EdgeInsets.all(20.0),
//                  ),
//                  Padding(
//                    child: Text(
//                      'Existing Technology: ${widget.value.technologyexists}',
//                      style: TextStyle(fontWeight: FontWeight.bold),
//                      textAlign: TextAlign.left,
//                    ),
//                    padding: EdgeInsets.all(20.0),
//                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
