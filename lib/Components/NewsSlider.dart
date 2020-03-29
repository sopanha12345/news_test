import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:news/Model/HttpLayoutModel.dart';
import 'package:news/Pages/HttpDetailPage.dart';


class NewsSlider extends StatefulWidget {

  final List<ProcheaPreyHttp> list;
  NewsSlider({this.list});

  @override
  _NewsSliderState createState() => _NewsSliderState();
}

class _NewsSliderState extends State<NewsSlider> {

  int _current = 0;

  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CarouselSlider(
            height: 200.0,
            initialPage: 0,
            onPageChanged: (index){
              setState(() {
                _current = index;
              });
            },
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayInterval: Duration(seconds : 5),
            reverse: false,
            items: widget.list.map((imageUrl){
              return Builder(
                builder: (BuildContext context){
                  return InkWell(
                    onTap: (){
                      var route = new MaterialPageRoute(builder: (BuildContext context) =>
                      new HttpDetailPage(value: widget.list[_current]));

                      Navigator.of(context).push(route);
                    },
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Container(
                          child: Image.network(imageUrl.fimg_url),
                        ),
                        Container(
                          height: 100.0,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                          ),
                          child: Html(data: imageUrl.title.rendered,customTextStyle:(node,TextStyle baseStyle){
                            return baseStyle.merge(TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0,color: Colors.white));
                          }),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
