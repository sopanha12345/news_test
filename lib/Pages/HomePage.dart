import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:news/Components/HorizontalList.dart';
import 'package:news/Components/NewsLayout.dart';
import 'package:news/Components/NewsSlider.dart';
import 'package:news/Model/HttpLayoutModel.dart';
import 'package:news/Model/LayoutModel.dart';
import 'package:http/http.dart' show get;


class HomePage extends StatefulWidget {
  HomePage():super();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _current = 0;
  int index = 1;

    List imgList =[
      'images/angkor_thom.jpg',
      'images/angkor_wat.jpg',
      'images/Preah_Vihear.jpg',
      'images/angkor_wat.jpg',
  ];

  Future<List<ProcheaPreyHttp>> getNewsSlide() async{
    var payloadList = downloadJson();
    return payloadList;
  }

  final flutterWebViewPlugin = new FlutterWebviewPlugin();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    flutterWebViewPlugin.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: 410.0,
            height: 680.0,
            child: ListView(
              children: <Widget>[
                Container(
                  child: Card(
                    child: new FutureBuilder<List<ProcheaPreyHttp>>(
                      future: getNewsSlide(),
                      builder: (context,snapshot){
                        if(snapshot.hasError) print(snapshot.error);
                        return snapshot.hasData ? new NewsSlider(
                            list: snapshot.data
                        ) : new Center(
                          child: new CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ),
//          Container(
//            height: 200.0,
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: <Widget>[
//                CarouselSlider(
//                  height: 150.0,
//                  initialPage: 0,
//                  enlargeCenterPage: true,
//                  autoPlay: false,
//                  enableInfiniteScroll: false,
//                  autoPlayInterval: Duration(seconds: 2),
//                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
//                  pauseAutoPlayOnTouch: Duration(seconds: 10),
//                  onPageChanged: (index){
//                    setState(() {
//                      _current = index;
//                    });
//                  },
//
//                  items: imgList.map((imgUrl){
//                    return Builder(
//                      builder: (BuildContext context){
//                        return Stack(
//                          alignment: Alignment.bottomCenter,
//                          children: <Widget>[
//                            Container(
//                              width: MediaQuery.of(context).size.width,
//                              margin: EdgeInsets.symmetric(horizontal: 10.0),
//                              decoration: BoxDecoration(
//                                color: Colors.red,
//                              ),
//                              child: Image.asset(imgUrl, fit: BoxFit.cover,),
//                            ),
//                            Container(
//                              alignment: Alignment.center,
//                              color: Colors.black45,
//                              height: 70
//                              ,
//                              child: Text("THIS IS NEWS TITLE.",style: TextStyle(color: Colors.white),),
//                            )
//                          ],
//                        );
//                      },
//                    );
//                  }).toList()
//                ),
//              ],
//            ),
//          ),

                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: new Text(
                      'Hot News',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                Container(
                    height:200,
                    width:200,
                    child: new FutureBuilder<List<ProcheaPreyHttp>>(
                      future: downloadJson(),
                      builder: (context,snapshot){
                        if(snapshot.hasData){
                          List<ProcheaPreyHttp> models = snapshot.data;
                          return new NewsLayout(models);
                        }else if(snapshot.hasError){
                          return Text("${snapshot.error}");
                        }
                        return Center(
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height:60.0,
                                width: 60.0,
                                child: new CircularProgressIndicator(),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: new Text(
                      'Business',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                Container(
                    height:250.0,
                    width:200,
                    child: new FutureBuilder<List<LayoutModel>>(
                      future: businessJson(),
                      builder: (context,snapshot){
                        if(snapshot.hasData){
                          List<LayoutModel> models = snapshot.data;
                          return new BusinessNews(models);
                        }else if(snapshot.hasError){
                          return Text("${snapshot.error}");
                        }
                      },
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<List<ProcheaPreyHttp>> downloadJson() async{
    final jsonData = "https://www.popular.com.kh/2017/wp-json/wp/v2/posts?categories=192";
    final response = await get(jsonData);

    if(response.statusCode == 200){
      List newsLayout = json.decode(response.body);
      return newsLayout.map((model)=> new ProcheaPreyHttp.fromJson(model)).toList();
    }else
      throw Exception("We weren't able to retrieve data from json");
}

Future<List<LayoutModel>> businessJson() async{
  final jsonEndpoint = await rootBundle.loadString('Json/business-news.json');
  final List response = await json.decode(jsonEndpoint);
  return response.map((model) => new LayoutModel.fromJson(model)).toList();
}
