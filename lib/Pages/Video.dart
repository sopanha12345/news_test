import 'dart:convert';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;

class Playlist extends StatefulWidget {
  Playlist({this.title, this.url});

  final String title;
  final String url;

  @override
  _PlaylistState createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  Future<List> getData() async {
    final jsonData = "https://newsvideolist.herokuapp.com/";
    final response = await get(jsonData);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? new ListVideo(
                    list: snapshot.data,
                  )
                : Center(child: new CircularProgressIndicator());
          }),
    );
  }
}

class ListVideo extends StatelessWidget {
  final List list;

  ListVideo({this.list});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new Container(
            padding: const EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                InkWell(
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new VideoPlay(url: "https://youtube.com/embed/${list[i]['contentDetails']['videoId']}",))),
                  child: new Container(
                    height: 210,
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                      image: new NetworkImage(
                          list[i]['snippet']['thumbnails']['high']['url']),
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new Text(
                  list[i]['snippet']['title'],
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(
                  thickness: 3,
                )
              ],
            ),
          );
        });
  }
}

class VideoPlay extends StatelessWidget {
  final String url;

  VideoPlay({this.url});

  @override
  Widget build(BuildContext context) {
    return new Center(child: new WebviewScaffold(url: url));
  }
}
